//
//  ViewController.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 05.02.2023.
//

import UIKit



class GameViewController: UIViewController {
    
    var router: RouterProtocol!
    var timer: ServiceTimerProtocol!
    var music: ServiceMusicProtocol!
    
    var currentQuestion: Question?
    
    var serviceCheckQuestion: ServiceCheckQuestion?
    var serviceHints: ServiceHints = ServiceHints()
    
    
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
        setButtonCornerRadius()
 
        currentQuestion = QuestionData.nextQuestion(round: UserModel.shared.round)
        setupTitileButton(button: [buttonA, buttonB, buttonC, buttonD], currentQuestion: currentQuestion!)
        timer?.startTimer(roundStages: .rightAnswer)
        serviceCheckQuestion = ServiceCheckQuestion(timer: timer)
//        serviceHints = ServiceHints()
        setLabelCurrentQuestion()
        setInfoAboutCurrentRound()
    }
    
    
    @IBAction func buttonPressA(_ sender: UIButton) {
        answerProcessing(sender)
    }
    
    @IBAction func buttonPressB(_ sender: UIButton) {
        answerProcessing(sender)
    }
    
    @IBAction func buttonPressC(_ sender: UIButton) {
        answerProcessing(sender)
    }
    
    @IBAction func buttonPressD(_ sender: UIButton) {
        answerProcessing(sender)
    }
    
    // MARK: - Hint button
    
    @IBAction func fiftyFiftyHint(_ sender: UIButton) {
        serviceHints.getFiftyFifty(buttons: [buttonA, buttonB, buttonC, buttonD],
                                    currentQuestion: currentQuestion!,
                                    fiftyFiftyHint: sender)
    }
    
    @IBAction func callAFriendHint(_ sender: UIButton) {
        presentCallAFriend(sender)
    }
    
    @IBAction func askTheAudienceHint(_ sender: UIButton) {
        presentAskTheAudience(sender)
    }
    
    
    func goToResultViewController() {
        
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


extension GameViewController {

    func setupTitileButton(button: [UIButton], currentQuestion: Question) {
        var answer = "N/A"
        var answersArray = currentQuestion.variantsAnswer
        button.forEach { btn in
            answer = answersArray.removeFirst()
            btn.setTitle(answer, for: .normal)
        }
    }

    
    func answerProcessing(_ sender: UIButton) {
        if serviceCheckQuestion?.checkQuestion(question: currentQuestion!, selectedButton: sender) == true {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) { [weak self] in
//                self.performSegue(withIdentifier: "segueToPyramid", sender: nil)
                guard let self = self else { return }
                self.router.showPyramidQuestionScreen()
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) { [weak self] in
//                self.performSegue(withIdentifier: "segueToLose", sender: nil)
                guard let self = self else { return }
                self.router.showLoseScreen()
            }
        }
    }
    
    
    func presentAskTheAudience(_ sender: UIButton) {
        guard let currentQuestion else { return }
        
        present(serviceHints.askTheAudience(question: currentQuestion,
                                            sender: sender), animated: true)
    }
    
    
    func presentCallAFriend(_ sender: UIButton) {
        guard let currentQuestion else { return }
        
        present(serviceHints.callAFriend(question: currentQuestion,
                                         sender: sender), animated: true)
    }
}
