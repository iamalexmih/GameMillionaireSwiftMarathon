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
        label.text = "Игра закончена, вы выиграли \(user.moneyWon) ₽"
        isLose = user.isLose
        setLabelLose()
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
    }
}
