//
//  ViewController.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 05.02.2023.
//

import UIKit

protocol GameViewControllerProtocol {
    
    var labelQuestion: UILabel! { get }
    var labelRoundInfo: UILabel! { get }
    var buttonA: UIButton! { get }
    var buttonB: UIButton! { get }
    var buttonC: UIButton! { get }
    var buttonD: UIButton! { get }
    
    var timer: ServiceTimerProtocol! { get }
    var serviceGetQuestionProtocol: ServiceGetQuestionProtocol!  { get }
    var currentQuestion: Question! { get }
    func setupTitileButton(button: [UIButton], currentQuestion: Question)
    func setupLabelTextQuestion(button: UILabel, text: String)
    func setupLabelRoundInfo(button: UILabel, currentQuestion: PyramidQuestionModel)
}


class GameViewController: UIViewController {
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

