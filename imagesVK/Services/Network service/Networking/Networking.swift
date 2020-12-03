//
//  Networking.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 04.11.2020.
//  Copyright © 2020 Matvey Chernyshov. All rights reserved.
//

import UIKit

enum Networking {}

extension Networking {
    
    static func fetchData(from url: URL?, completion: @escaping (Result<FeedInfo, NetworkError>) -> Void) {
        
        guard let url = url else {
            completion(.failure(.badURL))
            return
        }
        
        NetworkSettings.urlSession.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                completion(.failure(.responseError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.nilResponseData))
                return
            }
            
            DispatchQueue.main.async {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    let result = try decoder.decode(FeedInfo.self, from: data)
                    completion(.success(result))
                } catch let jsonDecodingError {
                    completion(.failure(.jsonDecodingError(jsonDecodingError)))
                }
            }
            
        }.resume()
    }
    
    static func downloadImage(
        urlString: String,
        onSuccess: @escaping (UIImage) -> Void,
        onFailure: @escaping (NetworkError) -> Void
    ) {
        guard let url = URL(string: urlString) else { return }
        
        NetworkSettings.urlSession.dataTask(with: url) { data, response, error in
            if let error = error {
                onFailure(.responseError(error))
                return
            }
            
            guard let data = data else {
                onFailure(.nilResponseData)
                return
            }
            
            guard let image = UIImage(data: data) else {
                onFailure(.badImageData(data))
                return
            }
            
            onSuccess(image)
        }.resume()
    }
}
