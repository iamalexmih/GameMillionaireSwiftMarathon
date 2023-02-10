//
//  ServiceBuilderScreen.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 07.02.2023.
//

import UIKit

protocol ServiceBuilderScreenProtocol {
    func createStartScreen(router: RouterProtocol) -> UIViewController
     func createRulesGameScreen(router: RouterProtocol) -> UIViewController
     func createGameScreen(serviceTimer: ServiceTimerProtocol) -> UIViewController
     func createGameScreen(router: RouterProtocol) -> UIViewController
     func createPyramidQuestionScreen(router: RouterProtocol) -> UIViewController
     func createLoseScreen(router: RouterProtocol) -> UIViewController
}


class ServiceBuilderScreen: ServiceBuilderScreenProtocol {
    func createGameScreen(serviceTimer: ServiceTimerProtocol) -> UIViewController {
        let storyboard = UIStoryboard(name: "GameScreen", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "GameScreen") as! GameViewController
        
        return viewController
        
    }
    
    func createStartScreen(router: RouterProtocol) -> UIViewController {
        let storyboard = UIStoryboard(name: "StartScreen", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "StartScreen") as! StartScreenViewController
        router.
        
        return viewController
    }
    
    func createRulesGameScreen(router: RouterProtocol) -> UIViewController {
        let storyboard = UIStoryboard(name: "RulesGame", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "RulesGame") as! RulesGameViewController
        
        return viewController
    }
    
    func createGameScreen(router: RouterProtocol) -> UIViewController {
        let storyboard = UIStoryboard(name: "GameMain", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "GameMain") as! GameViewController
        
        return viewController
    }
    
    func createPyramidQuestionScreen(router: RouterProtocol) -> UIViewController {
        let storyboard = UIStoryboard(name: "PyramidQuestion", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "PyramidQuestion") as! PyramidQuestionViewController
        
        return viewController
    }
    
    func createLoseScreen(router: RouterProtocol) -> UIViewController {
        let storyboard = UIStoryboard(name: "Lose", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Lose") as! LoseViewController
        
        return viewController
    }
    

}

