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
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = "Игра закончена, вы выиграли \(user.moneyWon) ₽"
    }

    
    @IBAction func getPlayAgain(_ sender: UIButton) {
        router.initialStartScreen()
        user.round = 1
        user.costQuestion = 100
        user.moneyWon = 0
        user.hintAskAudience = true
        user.hintFiftyFifty = true
        user.hintCallFriend = true
    }
}
