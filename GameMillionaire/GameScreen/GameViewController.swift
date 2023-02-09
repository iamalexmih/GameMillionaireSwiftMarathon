//
//  ViewController.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 05.02.2023.
//

import UIKit

protocol GameViewControllerProtocol {
    var timer: ServiceTimerProtocol! { get }
    var currentQuestion: Question! { get }

    var serviceCheckQuestion: ServiceCheckQuestionProtocol { get }
    var serviceGetQuestionProtocol: ServiceGetQuestionProtocol!  { get }
    
    func setupTitileButton(button: [UIButton], currentQuestion: Question)
    func setupLabelTextQuestion(label: UILabel, text: String)
    func setupLabelRoundInfo(label: UILabel, currentQuestion: PyramidQuestionModel)
}


class GameViewController: UIViewController {
    
    var timer: ServiceTimerProtocol!
    var music: ServiceMusicProtocol!
    var router: RouterProtocol!
    
    var currentQuestion: Question?
    
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var labelCostQuestion: UILabel!
    @IBOutlet weak var labelCurrentRound: UILabel!
    
    @IBOutlet weak var labelA: UILabel!
    @IBOutlet weak var labelB: UILabel!
    @IBOutlet weak var labelC: UILabel!
    @IBOutlet weak var labelD: UILabel!
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        buttonA.titleLabel?.font = UIFont.systemFont(ofSize: 33, weight: .bold)
        setButtonCornerRadius()
 
        currentQuestion = QuestionData.nextQuestion(round: UserModel.shared.round)
//        timer = ServiceTimer(serviceMusic: music)
        setupTitileButton(button: [buttonA, buttonB, buttonC, buttonD], currentQuestion: currentQuestion!)
//        timer?.startTimer(roundStages: .rightAnswer)
//        serviceCheckQuestion = ServiceCheckQuestion(timer: timer)
        setLabelCurrentQuestion()
        setInfoAboutCurrentRound()
    
    }
    
    
    @IBAction func buttonPressA(_ sender: UIButton) {
        
    }
    
    @IBAction func buttonPressB(_ sender: UIButton) {
        
    }
    
    @IBAction func buttonPressC(_ sender: UIButton) {
        
    }
    
    @IBAction func buttonPressD(_ sender: UIButton) {
        
    }
    
    func goToResultViewController() {
        
    }
    
    func setupTitileButton(button: [UIButton], currentQuestion: Question) {
        var answer = "N/A"
        var answersArray = currentQuestion.variantsAnswer
        button.forEach { btn in
            answer = answersArray.removeFirst()
            btn.setTitle(answer, for: .normal)
            
        }
    }
    
    func setLabelCurrentQuestion() {
        labelQuestion.text = currentQuestion?.textQuestion
    }
    
    func setInfoAboutCurrentRound() {
        labelCostQuestion.text = "1 000 000 Р"
        labelCurrentRound.text = "Вопрос № \(UserModel.shared.round)"
    }
    
    
    func setButtonCornerRadius() {
        buttonA.layer.cornerRadius = 20
        buttonB.layer.cornerRadius = 20
        buttonC.layer.cornerRadius = 20
        buttonD.layer.cornerRadius = 20
    }
}

