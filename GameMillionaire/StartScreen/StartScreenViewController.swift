//
//  StartScreenViewController.swift
//  GameMillionaire
//
//  Created by Эдгар Исаев on 07.02.2023.
//

import UIKit

class StartScreenViewController: UIViewController {
    
    var router: RouterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
    

    

