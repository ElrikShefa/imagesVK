//
//  ImageViewController.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 30.10.2020.
//

import UIKit

final class ImageViewController: BaseVC {
    
    private typealias CellType = ImageViewTableCell
    
    private let urlService = URLService()
    private var feedViewModel = ImageViewModel.init(cells: []){
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                self.tableView.reloadData()
            }
        }
    }
    
    private lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        Networking.fetchData(from: urlService.getFeed()) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                let cells = response.response.items.map { self.convertCellModel(
                    feedItem: $0,
                    profile: response.response.profiles,
                    groups: response.response.groups
                )}
                self.feedViewModel = ImageViewModel.init(cells: cells)
                
            case .failure(let error):
                
                switch  error {
                case .badURL:
                    self.showAlert(message: "badURL")
                    
                case .badImageData(_):
                    self.showAlert(message: "StringbadImageData")
                    
                case .nilImageURL(_):
                    self.showAlert(message: "nilImageURL")
                    
                case .responseError(_):
                    self.showAlert(message: "responseError")
                    
                case .nilResponseData:
                    self.showAlert(message: "nilResponseData")
                    
                case .jsonDecodingError(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}

extension ImageViewController: UITableViewDelegate {}

extension ImageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedViewModel.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellType.reuseIdentifier, for: indexPath) as! ImageViewTableCell
        
        cell.set(viewModel: feedViewModel.cells[indexPath.row])
        setupCellImage(cell: cell, viewModel: feedViewModel.cells[indexPath.row])
        
        return cell
    }
}

private extension ImageViewController {
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        tableView.backgroundColor = nil
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CellType.self, forCellReuseIdentifier: CellType.reuseIdentifier)
        
        view.addSubview(tableView)
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(contentsOf: tableView.edgeConstraints(to: view.safeAreaLayoutGuide))
        NSLayoutConstraint.activate(constraints)
    }
    
    func convertCellModel(feedItem: FeedItem, profile: [Profile], groups: [Group]) -> ImageViewModel.CellModel {
        
        let profile = self.profile(sourceId: feedItem.sourceId, profiles: profile, groups: groups)
        let date = Date(timeIntervalSince1970: feedItem.date)
        
        return ImageViewModel.CellModel.init(
            iconURLString: profile.photo,
            name: profile.name,
            date: date.formatRelativeString(),
            text: feedItem.text,
            likes: String(feedItem.likes?.count ?? 0),
            comments: String(feedItem.comments?.count ?? 0),
            shares: String(feedItem.reposts?.count ?? 0),
            views: String(feedItem.views?.count ?? 0),
            photoAttachement: photoAttachement(feedItem: feedItem))
    }
    
    func profile(sourceId: Int, profiles: [Profile], groups: [Group]) -> ProfileRepresentableProtocol {
        let profilesOrGroups: [ProfileRepresentableProtocol] = sourceId >= 0 ? profiles : groups
        let normalSourseId = sourceId >= 0 ? sourceId : -sourceId
        
        return profilesOrGroups.first { profile -> Bool in profile.id == normalSourseId }!
    }
    
    private func setupCellImage(cell: CellType, viewModel: ImageViewTableCellProtocol) {
        
        ImageLoader.shared.load(withURL: viewModel.iconURLString) { data in
            guard
                let data = data,
                let image = UIImage(data: data) else {
                self.showAlert(message: "Bad data")
                return
            }
            
            cell.setIconImage(image: image)
        }
        
        if let photoAttachement = viewModel.photoAttachement {
            
            guard let url = photoAttachement.urlString else {
                showAlert(message: "Wrong photoAttachement url")
                return
            }
            
            ImageLoader.shared.load(withURL: url) { data in
                guard
                    let data = data,
                    let image = UIImage(data: data) else {
                    self.showAlert(message: "Bad data")
                    return
                }
                
                cell.setPostImage(image: image)
            }
        }
    }
    
    func photoAttachement(feedItem: FeedItem) -> ImageViewModel.ImageAttachementTableCell? {
        guard let photos = feedItem.attachments?.compactMap({ attachement in
            attachement.photo
        }), let firstPhoto = photos.first else { return nil }
        return ImageViewModel.ImageAttachementTableCell.init(urlString: firstPhoto.srcBIG, width: firstPhoto.width, height: firstPhoto.height)
    }
    
}
