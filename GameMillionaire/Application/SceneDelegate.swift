//
//  SceneDelegate.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 05.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)

        let navigationController = UINavigationController()
        let music = ServiceMusic()
        let timer = ServiceTimer(serviceMusic: music)
        let builder = ServiceBuilderScreen(timer: timer, music: music)
        let router = ServiceRouter(navigationController: navigationController, builder: builder)
        router.initialStartScreen()
        window?.rootViewController = navigationController

        window?.makeKeyAndVisible()
    }
}

