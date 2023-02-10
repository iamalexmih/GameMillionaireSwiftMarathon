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

    }

    @IBAction func getPlayAgain(_ sender: UIButton) {
        router.initialStartScreen()
    }
}
