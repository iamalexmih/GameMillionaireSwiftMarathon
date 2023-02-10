//
//  ServiceBuilderScreen.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 07.02.2023.
//

import UIKit

protocol ServiceBuilderScreenProtocol {
    func createStartScreen(router: RouterProtocol) -> UIViewController
    func createRulesGameScreen() -> UIViewController
    func createGameScreen(router: RouterProtocol) -> UIViewController
    func createPyramidQuestionScreen() -> UIViewController
    func createLoseScreen() -> UIViewController
}


class ServiceBuilderScreen: ServiceBuilderScreenProtocol {
    
    var timer: ServiceTimerProtocol
    var music: ServiceMusicProtocol
    
    
    init(timer: ServiceTimerProtocol, music: ServiceMusicProtocol) {
        self.timer = timer
        self.music = music
    }
    
    
    func createStartScreen(router: RouterProtocol) -> UIViewController {
        let storyboard = UIStoryboard(name: "StartScreen", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "StartScreen") as! StartScreenViewController
        viewController.router = router
        return viewController
    }
    
    
    
    func createRulesGameScreen() -> UIViewController {
        let storyboard = UIStoryboard(name: "RulesGame", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "RulesGame") as! RulesGameViewController
        
        return viewController
    }
    

    
    func createGameScreen(router: RouterProtocol) -> UIViewController {
        let storyboard = UIStoryboard(name: "GameMain", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "GameMain") as! GameViewController

        viewController.router = router
        viewController.music = music
        viewController.timer = timer
        
        return viewController
    }
    
    
    
    func createPyramidQuestionScreen() -> UIViewController {
        let storyboard = UIStoryboard(name: "PyramidQuestion", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "PyramidQuestion") as! PyramidQuestionViewController
        
        return viewController
    }
    
    
    
    func createLoseScreen() -> UIViewController {
        let storyboard = UIStoryboard(name: "Lose", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Lose") as! LoseViewController
        
        return viewController
    }
}

