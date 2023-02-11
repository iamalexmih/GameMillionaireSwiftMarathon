//
//  StartScreenViewController.swift
//  GameMillionaire
//
//  Created by Эдгар Исаев on 07.02.2023.
//

import UIKit

class StartScreenViewController: UIViewController {
    
    var router: RouterProtocol!
    
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var rulesBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        startBtn.layer.cornerRadius = 15
        rulesBtn.layer.cornerRadius = 15
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    @IBAction func getToRules(_ sender: UIButton) {
        router.showsRulesGameScreen()
    }
    
    
    @IBAction func getToStart(_ sender: UIButton) {
        router.showsGameScreen()
    }
}
    

    

