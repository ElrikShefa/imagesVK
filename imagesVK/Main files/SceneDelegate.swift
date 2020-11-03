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
    var authService: AuthService!
    
    static func shared() -> SceneDelegate {
        let scene = UIApplication.shared.connectedScenes.first
        return (scene?.delegate as? SceneDelegate)!
    }
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = .init(windowScene: windowScene)
        
        authService = AuthService()
        authService.delegate = self
        
        window?.rootViewController = AuthViewController()
        window?.makeKeyAndVisible()
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
            VKSdk.processOpen(url, fromApplication: UIApplication.OpenURLOptionsKey.sourceApplication.rawValue)
            
        }
    }
}

extension SceneDelegate: UIWindowSceneDelegate {}

// MARK:- protocol AuthServiceDelegate
extension SceneDelegate: AuthServiceDelegate {
    
    func authServiceShouldShow(viewController: UIViewController) {
        print(#function)
        window?.rootViewController?.present(viewController, animated: true, completion: nil)
    }
    
    func authServiceSignIn() {
        print(#function)
        window?.rootViewController? = makeNavController()
    }
    
    func authServiceSignInDidFail() {
        print(#function)
    }
}

private extension SceneDelegate {
    
    func makeNavController() -> UIViewController {
        return UINavigationController(rootViewController: ImageViewController())
    }
}
