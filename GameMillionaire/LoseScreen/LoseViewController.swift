//
//  LoseViewController.swift
//  GameMillionaire
//
//  Created by Эдгар Исаев on 07.02.2023.
//

import UIKit

class LoseViewController: UIViewController {

    var router: RouterProtocol!
    var isLose: Bool = true
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelStatusLoseOrTakeMoney: UILabel!
    @IBOutlet weak var buttonPlayAgain: UIButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonPlayAgain.layer.cornerRadius = 20
        isLose = UserModel.shared.isLose
        calculateMoney()
        setLabelLose()
    }

    func calculateMoney() {
        if isLose {
            switch UserModel.shared.round {
            case 6...10:
                label.text = "Игра закончена, вы выиграли 1000 ₽"
                return
            case 11...16:
                label.text = "Игра закончена, вы выиграли 32000 ₽"
                return
            default:
                label.text = "Игра закончена, вы выиграли 0 ₽"
                return
            }
        } else {
            if UserModel.shared.round == 16 {
                label.text = "Игра закончена, вы выиграли МИЛЛИОН РУБЛЕЙ"
                return
            }
            label.text = "Игра закончена, вы выиграли \(UserModel.shared.moneyWon) ₽"
        }
    }
    
    
    func setLabelLose() {
        if isLose {
            labelStatusLoseOrTakeMoney.text = "😔 ЖАЛЬ 😔"
        } else {
            labelStatusLoseOrTakeMoney.text = "💰 😎 🤑"
        }
    }
    
    
    @IBAction func getPlayAgain(_ sender: UIButton) {
        router.initialStartScreen()
        UserModel.shared.round = 1
        UserModel.shared.costQuestion = 100
        UserModel.shared.moneyWon = 0
        UserModel.shared.hintAskAudience = true
        UserModel.shared.hintFiftyFifty = true
        UserModel.shared.hintCallFriend = true
        UserModel.shared.isLose = true
        
        QuestionData.questionList = QuestionStorage.questionList
    }
}
