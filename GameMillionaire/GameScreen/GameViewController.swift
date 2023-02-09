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
    var currentQuestion: Question! { get }

    var serviceCheckQuestion: ServiceCheckQuestionProtocol { get }
    var serviceGetQuestionProtocol: ServiceGetQuestionProtocol!  { get }
    
    func setupTitileButton(button: [UIButton], currentQuestion: Question)
    func setupLabelTextQuestion(label: UILabel, text: String)
    func setupLabelRoundInfo(label: UILabel, currentQuestion: PyramidQuestionModel)
}


class GameViewController: UIViewController {
    
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var labelRoundInfo: UILabel!
    @IBOutlet weak var questionNumber: UILabel!
    
    @IBOutlet weak var labelA: UILabel!
    @IBOutlet weak var labelB: UILabel!
    @IBOutlet weak var labelC: UILabel!
    @IBOutlet weak var labelD: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func butttonA(_ sender: Any) {
        
    }
    
    @IBAction func buttonB(_ sender: Any) {
        
    }
    
    @IBAction func buttonC(_ sender: Any) {
        
    }
    
    @IBAction func buttonD(_ sender: Any) {
        
    }
    func goToResultViewController() {
        
    }
}

