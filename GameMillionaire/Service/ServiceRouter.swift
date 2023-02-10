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
    func initialStartScreen()
    func showsRulesGameScreen()
    func showsGameScreen()
    func showPyramidQuestionScreen()
    func showLoseScreen()
    func popToRoot()
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
    
    
    func showsRulesGameScreen() {
        if let navigationController = navigationController {
            guard let rulesGameViewController = builder?.createRulesGameScreen(router: self)
            else { return }
            
            navigationController.pushViewController(rulesGameViewController, animated: true)
        }
    }
    
    
    
    func showsGameScreen() {
        if let navigationController = navigationController {
            guard let screenGameScreen = builder?.createGameScreen(router: self) else { return }
            navigationController.pushViewController(screenGameScreen, animated: true)
        }
    }
    
    
    
    func showPyramidQuestionScreen() {
        if let navigationController = navigationController {
            guard
                let PyramidQuestionViewController = builder?.createPyramidQuestionScreen(router: self)
            else { return }
            
            navigationController.pushViewController(PyramidQuestionViewController, animated: true)
        }
    }
    
    
    
    func showLoseScreen() {
        if let navigationController = navigationController {
            guard
                let loseScreenViewController = builder?.createLoseScreen(router: self)
            else { return }
            
            navigationController.pushViewController(loseScreenViewController, animated: true)
        }
    }
    
    
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
    
    
}
