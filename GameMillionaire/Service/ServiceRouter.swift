//
//  ServiceRouter.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 09.02.2023.
//

import UIKit


protocol RouterMainProtocol: AnyObject {
    var navigationController: UINavigationController? { get }
    init(navigationController: UINavigationController)
}


protocol RouterProtocol: RouterMainProtocol {
    func popToRoot()
    func initialStartScreen()
    func showsGameScreen()
    func showsRulesGameScreen()
}

class ServiceRouter: RouterProtocol {
    
    var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func initialStartScreen() {
        if let navigationController = navigationController {
            let screenStartGameVC = ServiceBuilderScreen.createStartScreen(router: self)
            navigationController.viewControllers = [screenStartGameVC]
        }
    }
    
    
    func showsGameScreen() {
        if let navigationController = navigationController {
            let screenGameScreen = ServiceBuilderScreen.createGameScreen(router: self)
            navigationController.pushViewController(screenGameScreen, animated: true)
        }
    }
    
    func showsRulesGameScreen() {
        
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
    
    
}
