//
//  ViewController.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 05.02.2023.
//

import UIKit



class GameViewController: UIViewController {
    
    func testFunc(){
        
    }
    
    var router: RouterProtocol!
    var timer: ServiceTimerProtocol!
    var music: ServiceMusicProtocol!
    
    var currentQuestion: Question?
    
    var serviceCheckQuestion: ServiceCheckQuestion?
    var serviceHints: ServiceHints = ServiceHints()
    var wasPressButtonQuestion: Bool = false
    
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var labelCostQuestion: UILabel!
    @IBOutlet weak var labelCurrentRound: UILabel!
    @IBOutlet weak var labelTimer: UILabel!
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    @IBOutlet weak var buttonTakeMoney: UIButton!
    
    @IBOutlet weak var hintFiftyFifty: UIButton!
    @IBOutlet weak var hintCallFriend: UIButton!
    @IBOutlet weak var hintAskAudience: UIButton!
    
    var arrayAllButton: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonCornerRadius()
        
        currentQuestion = QuestionData.nextQuestion(round: UserModel.shared.round)
        setupTitileButton(button: [buttonA, buttonB, buttonC, buttonD], currentQuestion: currentQuestion!)
        if UserModel.shared.round != 1 {
            timer.stopTimer()
        }
        timer?.startTimer(roundStages: .roundStart)
        serviceCheckQuestion = ServiceCheckQuestion(timer: timer)
        setLabelCurrentQuestion()
        setInfoAboutCurrentRound()
        setHintButton()
        makeArrayForAllButton()
        
        timer.totalTimeNow = { [weak self] timeCounter in
            guard let self = self else { return }
            if !self.wasPressButtonQuestion {
                self.labelTimer.text = "\(timeCounter)"
                if timeCounter == 0 {
                    self.showAlertMessage()
                    self.timer.stopTimer()
                }
            } else {
                self.labelTimer.text = "\(0)"
            }
        }
    }
    
    
    @IBAction func buttonPressA(_ sender: UIButton) {
        self.labelTimer.isHidden = true
        wasPressButtonQuestion = true
        answerProcessing(sender)
    }
    
    
    @IBAction func buttonPressB(_ sender: UIButton) {
        self.labelTimer.isHidden = true
        wasPressButtonQuestion = true
        answerProcessing(sender)
    }
    
    
    @IBAction func buttonPressC(_ sender: UIButton) {
        self.labelTimer.isHidden = true
        wasPressButtonQuestion = true
        answerProcessing(sender)
    }
    
    
    @IBAction func buttonPressD(_ sender: UIButton) {
        self.labelTimer.isHidden = true
        wasPressButtonQuestion = true
        answerProcessing(sender)
    }
    
    
    @IBAction func buttonTakeMoneyPress(_ sender: UIButton) {
        timer.stopTimer()
        UserModel.shared.isLose = false
        router.showLoseScreen()
    }
    
    
    // MARK: - Hint button
    
    @IBAction func fiftyFiftyHint(_ sender: UIButton) {
        serviceHints.getFiftyFifty(buttons: [buttonA, buttonB, buttonC, buttonD],
                                   currentQuestion: currentQuestion!,
                                   sender: sender)
        UserModel.shared.hintFiftyFifty = false
    }
    
    @IBAction func callAFriendHint(_ sender: UIButton) {
        presentCallAFriend(sender)
        UserModel.shared.hintCallFriend = false
    }
    
    @IBAction func askTheAudienceHint(_ sender: UIButton) {
        presentAskTheAudience(sender)
        UserModel.shared.hintAskAudience = false
    }
    
    
    // MARK: - func for config UI
    
    private func setLabelCurrentQuestion() {
        labelQuestion.text = currentQuestion?.textQuestion
    }
    
    
    private func setInfoAboutCurrentRound() {
        labelCostQuestion.text = "Цена вопроса \(UserModel.shared.costQuestion) ₽"
        labelCurrentRound.text = "Вопрос № \(UserModel.shared.round)"
    }
    
    
    private func setButtonCornerRadius() {
        buttonA.layer.cornerRadius = 20
        buttonB.layer.cornerRadius = 20
        buttonC.layer.cornerRadius = 20
        buttonD.layer.cornerRadius = 20
        buttonTakeMoney.layer.cornerRadius = 20
    }
    
    // MARK: - func for disable All Buttons
    
    private func makeArrayForAllButton() {
        arrayAllButton = [buttonA, buttonB, buttonC, buttonD, buttonTakeMoney,
                          hintCallFriend, hintFiftyFifty, hintAskAudience]
    }
    
    private func disableAllButtons() {
        arrayAllButton.forEach { $0.isEnabled = false }
    }
}

// MARK: - Logic

extension GameViewController {
    
    private func setupTitileButton(button: [UIButton], currentQuestion: Question) {
        var answer = "N/A"
        var answersArray = currentQuestion.variantsAnswer
        button.forEach { btn in
            answer = answersArray.removeFirst()
            btn.setTitle(answer, for: .normal)
        }
    }
    
    
    private func answerProcessing(_ sender: UIButton) {
        disableAllButtons()
        print(UserModel.shared.round, "v gameVC")
        if serviceCheckQuestion?.checkQuestion(question: currentQuestion!, selectedButton: sender) == true {
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) { [weak self] in
                guard let self = self else { return }
                
                if UserModel.shared.round > 15 {
                    UserModel.shared.isLose = false
                    self.router.showLoseScreen()
                } else {
                    self.router.showPyramidQuestionScreen()
                }
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) { [weak self] in

                guard let self = self else { return }
                UserModel.shared.isLose = true
                self.router.showLoseScreen()
            }
        }
    }
    
    
    private func presentAskTheAudience(_ sender: UIButton) {
        guard let currentQuestion else { return }
        
        present(serviceHints.askTheAudience(question: currentQuestion,
                                            sender: sender), animated: true)
    }
    
    
    private func presentCallAFriend(_ sender: UIButton) {
        guard let currentQuestion else { return }
        
        present(serviceHints.callAFriend(question: currentQuestion,
                                         sender: sender), animated: true)
    }
    
    
     private func setHintButton() {
        hintCallFriend.isEnabled = UserModel.shared.hintCallFriend
        hintFiftyFifty.isEnabled = UserModel.shared.hintFiftyFifty
        hintAskAudience.isEnabled = UserModel.shared.hintAskAudience
        
        if !UserModel.shared.hintCallFriend {
            let btnImage = UIImage(named: "helpFriendFalse")
            hintCallFriend.setImage(btnImage, for: .disabled)
        }
        if !UserModel.shared.hintFiftyFifty {
            let btnImage = UIImage(named: "fiftyFiftyFalse")
            hintFiftyFifty.setImage(btnImage, for: .disabled)
        }
        if !UserModel.shared.hintAskAudience {
            let btnImage = UIImage(named: "askAudienceFalse")
            hintAskAudience.setImage(btnImage, for: .disabled)
        }
    }
}

// MARK: - Alert Messege
extension GameViewController {
    func showAlertMessage() {
        let alert = UIAlertController(title: "Вы проиграли",
                                      message: "Время вышло",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.router.showLoseScreen()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
