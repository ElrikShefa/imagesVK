//
//  AppDelegate.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 30.10.2020.
//

import UIKit
import VK_ios_sdk

@main
final class AppDelegate: UIResponder, UIApplicationDelegate{
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        VKSdk.processOpen(url, fromApplication: UIApplication.OpenURLOptionsKey.sourceApplication.rawValue)
        
        return true
    }
}
