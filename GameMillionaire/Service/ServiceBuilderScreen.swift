//
//  ServiceBuilderScreen.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 07.02.2023.
//

import UIKit

protocol ServiceBuilderScreenProtocol {
    static func createStartScreen(router: RouterProtocol) -> UIViewController
    static func createRulesGameScreen() -> UIViewController
    static func createGameScreen(router: RouterProtocol) -> UIViewController
    static func createPyramidQuestionScreen() -> UIViewController
    static func createLoseScreen() -> UIViewController
}


class ServiceBuilderScreen: ServiceBuilderScreenProtocol {
    
    static func createStartScreen(router: RouterProtocol) -> UIViewController {
        let storyboard = UIStoryboard(name: "StartScreen", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "StartScreen") as! StartScreenViewController
        viewController.router = router
        return viewController
    }
    
    
    
    static func createRulesGameScreen() -> UIViewController {
        let storyboard = UIStoryboard(name: "RulesGame", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "RulesGame") as! RulesGameViewController
        
        return viewController
    }
    
    
    
    static func createGameScreen(router: RouterProtocol) -> UIViewController {
        let storyboard = UIStoryboard(name: "GameMain", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "GameMain") as! GameViewController
        let music = ServiceMusic()
        let timer = ServiceTimer(serviceMusic: music)
        
        viewController.router = router
        viewController.music = music
        viewController.timer = timer
        
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

