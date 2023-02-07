//
//  ServiceBuilderScreen.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 07.02.2023.
//

import UIKit

protocol ServiceBuilderScreenProtocol {
    static func createStartScreen() -> UIViewController
    static func createRulesGameScreen() -> UIViewController
    static func createGameScreen(serviceTimer: ServiceTimerProtocol) -> UIViewController
    static func createGameScreen() -> UIViewController
    static func createPyramidQuestionScreen() -> UIViewController
    static func createLoseScreen() -> UIViewController
}


class ServiceBuilderScreen: ServiceBuilderScreenProtocol {
    static func createGameScreen(serviceTimer: ServiceTimerProtocol) -> UIViewController {
        return UIViewController()
    }
    
    static func createStartScreen() -> UIViewController {
        let storyboard = UIStoryboard(name: "StartScreen", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "StartScreen") as! StartScreenViewController
        
        return viewController
    }
    
    
    
    static func createRulesGameScreen() -> UIViewController {
        let storyboard = UIStoryboard(name: "RulesGame", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "RulesGame") as! RulesGameViewController
        
        return viewController
    }
    
    
    
    static func createGameScreen() -> UIViewController {
        let storyboard = UIStoryboard(name: "GameMain", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "GameMain") as! GameViewController
        
        return viewController
    }
    
    
    
    static func createPyramidQuestionScreen() -> UIViewController {
        let storyboard = UIStoryboard(name: "PyramidQuestion", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "PyramidQuestion") as! PyramidQuestionViewController
        
        return viewController
    }
    
    
    
    static func createLoseScreen() -> UIViewController {
        let storyboard = UIStoryboard(name: "Lose", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Lose") as! LoseViewController
        
        return viewController
    }
}

