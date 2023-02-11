//
//  LoseViewController.swift
//  GameMillionaire
//
//  Created by Эдгар Исаев on 07.02.2023.
//

import UIKit

class LoseViewController: UIViewController {

    var router: RouterProtocol!
    let user = UserModel.shared
    var isLose: Bool = true
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelStatusLoseOrTakeMoney: UILabel!
    @IBOutlet weak var buttonPlayAgain: UIButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonPlayAgain.layer.cornerRadius = 20
        isLose = user.isLose
        calculateMoney()
        setLabelLose()
    }

    func calculateMoney() {
        if isLose {
            switch user.round {
            case 6...10:
                label.text = "Игра закончена, вы выиграли 1000 ₽"
            case 11...15:
                label.text = "Игра закончена, вы выиграли 32000 ₽"
            default:
                label.text = "Игра закончена, вы выиграли 0 ₽"
            }
        } else {
            label.text = "Игра закончена, вы выиграли \(user.moneyWon) ₽"
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
        user.round = 1
        user.costQuestion = 100
        user.moneyWon = 0
        user.hintAskAudience = true
        user.hintFiftyFifty = true
        user.hintCallFriend = true
        user.isLose = true
        
        QuestionData.questionList = QuestionStorage.questionList
    }
}
