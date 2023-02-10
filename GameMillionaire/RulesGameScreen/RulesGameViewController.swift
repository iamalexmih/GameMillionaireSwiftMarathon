//
//  RulesGameViewController.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 07.02.2023.
//

import UIKit

class RulesGameViewController: UIViewController {
    
    let rules = Rules()
    var router: RouterProtocol!
    
    @IBOutlet weak var rulesTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rulesTextView.isEditable = false
        rulesTextView.text = rules.getRulesText()
    }
    
    
    @IBAction func getBack(_ sender: UIButton) {
        router.goBackOneScreen()
    }
}
