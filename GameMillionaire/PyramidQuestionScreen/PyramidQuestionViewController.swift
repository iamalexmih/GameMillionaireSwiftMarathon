//
//  PyramidQuestionViewController.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 07.02.2023.
//

import UIKit

class PyramidQuestionViewController: UIViewController {
    
    var router: RouterProtocol!
    
    
    @IBOutlet weak var questionButton15: UIButton!
    @IBOutlet weak var questionButton14: UIButton!
    @IBOutlet weak var questionButton13: UIButton!
    @IBOutlet weak var questionButton12: UIButton!
    @IBOutlet weak var questionButton11: UIButton!
    @IBOutlet weak var questionButton10: UIButton!
    @IBOutlet weak var questionButton9: UIButton!
    @IBOutlet weak var questionButton8: UIButton!
    @IBOutlet weak var questionButton7: UIButton!
    @IBOutlet weak var questionButton6: UIButton!
    @IBOutlet weak var questionButton5: UIButton!
    @IBOutlet weak var questionButton4: UIButton!
    @IBOutlet weak var questionButton3: UIButton!
    @IBOutlet weak var questionButton2: UIButton!
    @IBOutlet weak var questionButton1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.questionButton1.layer.cornerRadius = 20
        self.questionButton2.layer.cornerRadius = 20
        self.questionButton3.layer.cornerRadius = 20
        self.questionButton4.layer.cornerRadius = 20
        self.questionButton5.layer.cornerRadius = 20
        self.questionButton6.layer.cornerRadius = 20
        self.questionButton7.layer.cornerRadius = 20
        self.questionButton8.layer.cornerRadius = 20
        self.questionButton9.layer.cornerRadius = 20
        self.questionButton10.layer.cornerRadius = 20
        self.questionButton11.layer.cornerRadius = 20
        self.questionButton12.layer.cornerRadius = 20
        self.questionButton13.layer.cornerRadius = 20
        self.questionButton14.layer.cornerRadius = 20
        self.questionButton15.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func questionButton1Press(sender: UIButton) {
        router.initialAndGoToGameScreen()
    }
}
