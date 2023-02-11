//
//  LoseViewController.swift
//  GameMillionaire
//
//  Created by Эдгар Исаев on 07.02.2023.
//

import UIKit

class LoseViewController: UIViewController {

    var router: RouterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UserModel.shared.round = 1
        UserModel.shared.score = 100
        UserModel.shared.hintAskAudience = true
        UserModel.shared.hintFiftyFifty = true
        UserModel.shared.hintCallFriend = true
    }

    @IBAction func getPlayAgain(_ sender: UIButton) {
        router.initialStartScreen()
    }
}
