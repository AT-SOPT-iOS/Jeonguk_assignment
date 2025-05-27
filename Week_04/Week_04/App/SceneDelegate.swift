//
//  SceneDelegate.swift
//  Week_04
//
//  Created by 정정욱 on 5/8/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let rootViewController = TivingMainViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigationController 
        window.makeKeyAndVisible()
        self.window = window
    }
}

