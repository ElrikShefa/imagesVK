//
//  ImageViewController.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 30.10.2020.
//

import UIKit

final class ImageViewController: BaseVC {
    
    private let urlService = URLService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        
        Networking.fetchData(from: urlService.getFeed()) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
              print("\(response)")
                
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



