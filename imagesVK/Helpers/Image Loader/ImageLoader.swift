//
//  ImageLoader.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 25.11.2020.
//  Copyright © 2020 Matvey Chernyshov. All rights reserved.
//

import Foundation

struct ImageLoader {
    
    private init() { }
    
    static let shared = ImageLoader()
    
    func load(withURL url: String, isInternalFile: Bool = true, completion: @escaping (Data?) -> Void) {
        
        guard let imageURL = URL(string: url) else { return completion(nil) }
        let cache = URLCache.shared
        let request = URLRequest(url: imageURL)
        if Thread.isMainThread {
            DispatchQueue.global(qos: .utility).async {
                self.makeRequest(request, cache: cache, completion: completion)
            }
        } else {
            makeRequest(request, cache: cache, completion: completion)
        }
    }
    
    private func makeRequest(_ request: URLRequest, cache: URLCache, completion: @escaping (Data?) -> Void) {
        if let data = cache.cachedResponse(for: request)?.data {
            completion(data)
        } else {
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data, let response = response, ((response as? HTTPURLResponse)?.statusCode ?? 500) < 300 {
                    let cachedData = CachedURLResponse(response: response, data: data)
                    cache.storeCachedResponse(cachedData, for: request)
                    completion(data)
                } else {
                    completion(nil)
                }
            }.resume()
        }
    }
}
