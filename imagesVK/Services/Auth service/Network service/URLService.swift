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
        var components = URLComponents()
        
        guard let token = authService.token else { return }
        
        let parametrs = ["filters": "post, photo"]
        var allParametrs = parametrs
        allParametrs["access_token"] = token
        allParametrs["v"] = VK_API.version
        
        components.scheme = VK_API.scheme
        components.host = VK_API.host
        components.path = VK_API.methodGetPhotos
        components.queryItems = allParametrs.map{ URLQueryItem(name: $0, value: $1) }
    
        guard let url = components.url else { return }
        print(url)
    }
}
