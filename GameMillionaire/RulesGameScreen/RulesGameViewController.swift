//
//  RulesGameViewController.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 07.02.2023.
//

import UIKit

class RulesGameViewController: UIViewController {
    
    @IBOutlet weak var rulesTextView: UITextView!
    @IBAction func getBack(_ sender: UIButton) {
    }
    
    let rules = Rules()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rulesTextView.isEditable = false
        rulesTextView.text = Rules.getRulesText(rules)()
    
        // Do any additional setup after loading the view.
    }

}
