//
//  AuthService.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 30.10.2020.
//  Copyright © 2020 Matvey Chernyshov. All rights reserved.
//

import Foundation
import VK_ios_sdk

final class AuthService: NSObject {
    
    private let appID = StringConstants.appID
    private let vkSDK: VKSdk
    
    override init() {
        vkSDK = VKSdk.initialize(withAppId: appID)
        super.init()
        vkSDK.register(self)
        vkSDK.uiDelegate = self
    }
}

extension AuthService: VKSdkDelegate {
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
    }
    
    func vkSdkUserAuthorizationFailed() {
        print(#function)
    }
    

    
}


extension AuthService: VKSdkUIDelegate {
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
    
    
}
