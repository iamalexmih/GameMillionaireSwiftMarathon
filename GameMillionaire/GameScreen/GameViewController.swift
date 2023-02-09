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
    var serviceHints: ServiceHintsProtocol? { get set }
    
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
    var serviceHints: ServiceHints?
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
        serviceHints = ServiceHints()
    }
    
    
    @IBAction func buttonApress(_ sender: UIButton) {
        answerProcessing(sender)
    }
    
    @IBAction func buttonBpress(_ sender: UIButton) {
        answerProcessing(sender)
    }
    
    @IBAction func buttonCpress(_ sender: UIButton) {
        answerProcessing(sender)
    }
    
    @IBAction func buttonDpress(_ sender: UIButton) {
        answerProcessing(sender)
        
    }
    
    @IBAction func fiftyFiftyHint(_ sender: UIButton) {
        
    }
    
    @IBAction func callAFriendHint(_ sender: UIButton) {
        presentCallAFriend()
    }
    
    @IBAction func askTheAudienceHint(_ sender: UIButton) {
        presentAskTheAudience()
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
    
    func answerProcessing(_ sender: UIButton) {
        if serviceCheckQuestion?.checkQuestion(question: currentQuestion!, selectedButton: sender) == true {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                self.performSegue(withIdentifier: "segueToPyramid", sender: nil)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                self.performSegue(withIdentifier: "segueToLose", sender: nil)
            }
        }
    }
    
    func presentAskTheAudience() {
        guard let currentQuestion else { return }
        guard let serviceHints else { return }
        
        present(serviceHints.askTheAudience(question: currentQuestion), animated: true)
    }
    
    func presentCallAFriend() {
        guard let currentQuestion else { return }
        guard let serviceHints else { return }
        
        present(serviceHints.callAFriend(question: currentQuestion), animated: true)
    }
}
