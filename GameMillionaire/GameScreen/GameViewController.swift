//
//  ViewController.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 05.02.2023.
//

import UIKit

protocol GameViewControllerProtocol {
    
//    var labelQuestion: UILabel! { get }
//    var labelRoundInfo: UILabel! { get }
//    var buttonA: UIButton! { get }
//    var buttonB: UIButton! { get }
//    var buttonC: UIButton! { get }
//    var buttonD: UIButton! { get }
    
    var timer: ServiceTimerProtocol? { get set }
    var currentQuestion: Question? { get set }

    var serviceCheckQuestion: ServiceCheckQuestionProtocol? { get set }
    var serviceGetQuestionProtocol: ServiceGetQuestionProtocol?  { get set }
    
    func setupTitileButton(button: [UIButton], currentQuestion: Question)
    func setupLabelTextQuestion(label: UILabel, text: String)
    func setupLabelRoundInfo(label: UILabel, currentQuestion: PyramidQuestionModel)
}


class GameViewController: UIViewController {
    
    var timer: ServiceTimerProtocol?
    var currentQuestion: Question?
//    var serviceCheckQuestion: ServiceCheckQuestionProtocol?
    var serviceGetQuestionProtocol: ServiceGetQuestionProtocol?
    var serviceCheckQuestion: ServiceCheckQuestion?
    var music = serviceMusic()
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currentQuestion = QuestionData.questionList[0]
        timer = ServiceTimer(serviceMusic: music)
        setupTitileButton(button: [buttonA, buttonB, buttonC, buttonD], currentQuestion: currentQuestion!)
        timer?.startTimer(roundStages: .rightAnswer)
        serviceCheckQuestion = ServiceCheckQuestion(timer: timer)
    }
    
    
    @IBAction func buttonApress(_ sender: UIButton) {
        
        if serviceCheckQuestion?.checkQuestion(question: currentQuestion!, selectedButton: sender) == true {
            Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(goToNextScreen), userInfo: nil, repeats: false)
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                self.performSegue(withIdentifier: "segueToLose", sender: nil)
            }
        }
        
    }
    
    @IBAction func buttonBpress(_ sender: UIButton) {
        
        if serviceCheckQuestion?.checkQuestion(question: currentQuestion!, selectedButton: sender) == true {
            print(1)
            Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(goToNextScreen), userInfo: nil, repeats: false)
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                print(2)
                self.performSegue(withIdentifier: "segueToLose", sender: nil)
            }
            print(3)
        }
    }
    
    
    @IBAction func buttonCpress(_ sender: Any) {
        
    }
    
    @IBAction func buttonDpress(_ sender: Any) {
    }
    
    
    func goToResultViewController() {
        
    }
}


extension GameViewController {

    
    
    
    func setupTitileButton(button: [UIButton], currentQuestion: Question) {
        var answer = "N/A"
        var answersArray = currentQuestion.variantsAnswer
        button.forEach { btn in
            answer = answersArray.removeFirst()
            btn.setTitle(answer, for: .normal)
        }
    }
    
    func setupLabelTextQuestion(label: UILabel, text: String) {
        
    }
    
    func setupLabelRoundInfo(label: UILabel, currentQuestion: PyramidQuestionModel) {
        
    }
    
    @objc func goToNextScreen() {
        
        
        performSegue(withIdentifier: "segueToPyramid", sender: nil)
        print(1.1)
    }
}
