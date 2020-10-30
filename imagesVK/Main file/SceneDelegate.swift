//
//  SceneDelegate.swift
//  imagesVK
//
//  Created by Матвей Чернышев on 30.10.2020.
//

import UIKit
import VK_ios_sdk

final class SceneDelegate: UIResponder {
    
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = .init(windowScene: windowScene)
        
        window?.rootViewController = makeNavController()
        window?.makeKeyAndVisible()
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
            VKSdk.processOpen(url, fromApplication: UIApplication.OpenURLOptionsKey.sourceApplication.rawValue)
            
        }
    }
}

extension SceneDelegate: UIWindowSceneDelegate {}

private extension SceneDelegate {
    
    func makeNavController() -> UIViewController {
        return UINavigationController(rootViewController: ViewController())
    }
}
