//
//  URLService.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 03.11.2020.
//  Copyright © 2020 Matvey Chernyshov. All rights reserved.
//

import Foundation

struct URLService {
    
    private let authService: AuthService
    
    init(authService: AuthService = SceneDelegate.shared().authService) {
        self.authService = authService
    }
}

extension URLService {
    
 func getFeed() {
        guard let token = authService.token else { return }
        
        let parametrs = ["filters": "post,photo"]
        var allParametrs = parametrs
        allParametrs["access_token"] = token
        allParametrs["v"] = VK_API.version

    guard let url = getUrl(VK_API.methodGetPhotos, params: allParametrs) else { return }
        print(url)
    }
    
    private func getUrl(_ path: String, params: [String: String]) -> URL? {
        var components = URLComponents()
        
        components.scheme = VK_API.scheme
        components.host = VK_API.host
        components.path = path
        components.queryItems = params.map{ URLQueryItem(name: $0, value: $1) }
        
        return components.url
    }
}

