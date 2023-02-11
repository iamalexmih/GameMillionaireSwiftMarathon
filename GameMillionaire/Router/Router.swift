//
//  RouterProtocol.swift
//  GameMillionaire
//
//  Created by Евгений Сланин on 09.02.2023.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: ServiceBuilderScreenProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func popToRoot()
    func showPyramidQuestionScreen()
    func showGameScreen()
    func showLoseScreen()
    func showRulesGameScreen()
    
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: ServiceBuilderScreenProtocol?
    
    init(navigationController: UINavigationController?, assemblyBuilder: ServiceBuilderScreenProtocol?) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard
                let startViewController = assemblyBuilder?.createStartScreen(router: self)
            else { return }
            
            navigationController.viewControllers = [startViewController]
            
        }
    }
    
    func showRulesGameScreen() {
        if let navigationController = navigationController {
            guard
                let rulesGameViewController = assemblyBuilder?.createRulesGameScreen(router: self)
            else { return }
            
            navigationController.pushViewController(rulesGameViewController, animated: true)
            
        }
    }
    
    func showGameScreen() {
        if let navigationController = navigationController {
            guard
                let gameScreenViewController = assemblyBuilder?.createGameScreen(router: self)
            else { return }
            
            navigationController.pushViewController(gameScreenViewController, animated: true)
            
        }
    }
    
    func showPyramidQuestionScreen() {
        if let navigationController = navigationController {
            guard
                let PyramidQuestionViewController = assemblyBuilder?.createPyramidQuestionScreen(router: self)
            else { return }
            
            navigationController.pushViewController(PyramidQuestionViewController, animated: true)
            
        }
    }
    
    func showLoseScreen() {
        if let navigationController = navigationController {
            guard
                let loseScreenViewController = assemblyBuilder?.createLoseScreen(router: self)
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
