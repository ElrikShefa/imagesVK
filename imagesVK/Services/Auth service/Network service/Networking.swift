//
//  Networking.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 04.11.2020.
//  Copyright © 2020 Matvey Chernyshov. All rights reserved.
//

import Foundation

enum Networking {}

extension Networking {
    
    func fetchData(from urlString: String, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }
        
        NetworkSettings.urlSession.dataTask(with: url) { (data, _, error) in
            
            if error != nil {
                completion(.failure(.requestFailed))
                return
            }
            
            guard let data = data else {
                completion(.failure(.requestFailed))
                return
            }
            
            DispatchQueue.main.async {
                completion(.success(data))
                completion(.failure(.unknown))
            }
        }.resume()
    }
}

