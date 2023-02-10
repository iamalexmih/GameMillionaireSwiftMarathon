//
//  ServiceRouter.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 09.02.2023.
//

import UIKit


protocol RouterMainProtocol: AnyObject {
    var navigationController: UINavigationController? { get }
    init(navigationController: UINavigationController, builder: ServiceBuilderScreenProtocol)
}


protocol RouterProtocol: RouterMainProtocol {
    func popToRoot()
    func initialStartScreen()
    func showsGameScreen()
    func showsRulesGameScreen()
}

class ServiceRouter: RouterProtocol {
    
    var navigationController: UINavigationController?
    var builder: ServiceBuilderScreenProtocol?
    
    required init(navigationController: UINavigationController, builder: ServiceBuilderScreenProtocol) {
        self.navigationController = navigationController
        self.builder = builder
    }
    
    
    func initialStartScreen() {
        if let navigationController = navigationController {
            guard let screenStartGameVC = builder?.createStartScreen(router: self) else { return }
            navigationController.viewControllers = [screenStartGameVC]
        }
    }
    
    
    func showsGameScreen() {
        if let navigationController = navigationController {
            guard let screenGameScreen = builder?.createGameScreen(router: self) else { return }
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
