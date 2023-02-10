//
//  PyramidQuestionViewController.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 07.02.2023.
//

import UIKit

class PyramidQuestionViewController: UIViewController {
    
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
    
    func cornetRadius() {

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
    }
    
    func currentRound(user: UserModel) {
        switch user.round {
            case 1: questionButton1.layer.borderWidth = 4.0;  questionButton1.layer.borderColor = (UIColor.white).cgColor
            case 2: questionButton2.layer.borderWidth = 4.0;  questionButton2.layer.borderColor = (UIColor.white).cgColor
            case 3: questionButton3.layer.borderWidth = 4.0;  questionButton3.layer.borderColor = (UIColor.white).cgColor
            case 4: questionButton4.layer.borderWidth = 4.0;  questionButton4.layer.borderColor = (UIColor.white).cgColor
            case 5: questionButton5.layer.borderWidth = 4.0;  questionButton5.layer.borderColor = (UIColor.white).cgColor
            case 6: questionButton6.layer.borderWidth = 4.0;  questionButton6.layer.borderColor = (UIColor.white).cgColor
            case 7: questionButton7.layer.borderWidth = 4.0;  questionButton7.layer.borderColor = (UIColor.white).cgColor
            case 8: questionButton8.layer.borderWidth = 4.0;  questionButton8.layer.borderColor = (UIColor.white).cgColor
            case 9: questionButton9.layer.borderWidth = 4.0;  questionButton9.layer.borderColor = (UIColor.white).cgColor
            case 10: questionButton10.layer.borderWidth = 4.0;  questionButton10.layer.borderColor = (UIColor.white).cgColor
            case 11: questionButton11.layer.borderWidth = 4.0;  questionButton11.layer.borderColor = (UIColor.white).cgColor
            case 12: questionButton12.layer.borderWidth = 4.0;  questionButton12.layer.borderColor = (UIColor.white).cgColor
            case 13: questionButton13.layer.borderWidth = 4.0;  questionButton13.layer.borderColor = (UIColor.white).cgColor
            case 14: questionButton14.layer.borderWidth = 4.0;  questionButton14.layer.borderColor = (UIColor.white).cgColor
            case 15: questionButton15.layer.borderWidth = 4.0;  questionButton15.layer.borderColor = (UIColor.white).cgColor
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentRound(user: <#T##UserModel#>)
        cornetRadius()
}
    
    @IBAction func questionButton1Press(sender: UIButton) {
        print("questionButton1")
    }
}
