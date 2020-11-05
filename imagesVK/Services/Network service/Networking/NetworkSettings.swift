//
//  NetworkSettings.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 04.11.2020.
//  Copyright © 2020 Matvey Chernyshov. All rights reserved.
//

import Foundation

enum NetworkSettings {}

extension NetworkSettings {
    
    static let urlSession: URLSession = {
        let configuration = URLSessionConfiguration.default
        
        configuration.urlCache = urlCache
        configuration.httpMaximumConnectionsPerHost = 5
        
        configuration.timeoutIntervalForRequest = 5
        configuration.timeoutIntervalForResource = 10
        
        return URLSession(
            configuration: configuration,
            delegate: nil,
            delegateQueue: urlSessionOperationQueue
        )
    }()
}

private extension NetworkSettings {
    
    static let MB = 1024 * 1024 // 1 MB
    
    static let urlCache = URLCache(memoryCapacity: MB, diskCapacity: 10 * MB, diskPath: "images")
    
    static let urlSessionOperationQueue = OperationQueue()
}
