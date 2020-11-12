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
    private var newsFeedList = [FeedItem](){
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
                self.newsFeedList.append(contentsOf: response.response.items.map{ $0})
                
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
        return newsFeedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellType.reuseIdentifier, for: indexPath)
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
    
}
