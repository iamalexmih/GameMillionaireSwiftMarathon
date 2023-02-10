//
//  PyramidQuestionViewController.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 07.02.2023.
//

import UIKit

class PyramidQuestionViewController: UIViewController {
    
    
    @IBOutlet var arrayButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cornetRadius()
        currentQuestion(user: .shared)
        
    }
    
    func cornetRadius() {
        arrayButtons[0].layer.cornerRadius = 20
        arrayButtons[1].layer.cornerRadius = 20
        arrayButtons[2].layer.cornerRadius = 20
        arrayButtons[3].layer.cornerRadius = 20
        arrayButtons[4].layer.cornerRadius = 20
        arrayButtons[5].layer.cornerRadius = 20
        arrayButtons[6].layer.cornerRadius = 20
        arrayButtons[7].layer.cornerRadius = 20
        arrayButtons[8].layer.cornerRadius = 20
        arrayButtons[9].layer.cornerRadius = 20
        arrayButtons[10].layer.cornerRadius = 20
        arrayButtons[11].layer.cornerRadius = 20
        arrayButtons[12].layer.cornerRadius = 20
        arrayButtons[13].layer.cornerRadius = 20
        arrayButtons[14].layer.cornerRadius = 20
    }
    
    func currentQuestion(user: UserModel) {
        switch user.round {
        case 1: arrayButtons[0].layer.borderWidth = 4; arrayButtons[0].layer.borderColor = UIColor.white.cgColor
        case 2: arrayButtons[1].layer.borderWidth = 4; arrayButtons[1].layer.borderColor = UIColor.white.cgColor
        case 3: arrayButtons[2].layer.borderWidth = 4; arrayButtons[2].layer.borderColor = UIColor.white.cgColor
        case 4: arrayButtons[3].layer.borderWidth = 4; arrayButtons[3].layer.borderColor = UIColor.white.cgColor
        case 5: arrayButtons[4].layer.borderWidth = 4; arrayButtons[4].layer.borderColor = UIColor.white.cgColor
        case 6: arrayButtons[5].layer.borderWidth = 4; arrayButtons[5].layer.borderColor = UIColor.white.cgColor
        case 7: arrayButtons[6].layer.borderWidth = 4; arrayButtons[6].layer.borderColor = UIColor.white.cgColor
        case 8: arrayButtons[7].layer.borderWidth = 4; arrayButtons[7].layer.borderColor = UIColor.white.cgColor
        case 9: arrayButtons[8].layer.borderWidth = 4; arrayButtons[8].layer.borderColor = UIColor.white.cgColor
        case 10: arrayButtons[9].layer.borderWidth = 4; arrayButtons[9].layer.borderColor = UIColor.white.cgColor
        case 11: arrayButtons[10].layer.borderWidth = 4; arrayButtons[10].layer.borderColor = UIColor.white.cgColor
        case 12: arrayButtons[11].layer.borderWidth = 4; arrayButtons[11].layer.borderColor = UIColor.white.cgColor
        case 13: arrayButtons[12].layer.borderWidth = 4; arrayButtons[12].layer.borderColor = UIColor.white.cgColor
        case 14: arrayButtons[13].layer.borderWidth = 4; arrayButtons[13].layer.borderColor = UIColor.white.cgColor
        case 15: arrayButtons[14].layer.borderWidth = 4; arrayButtons[14].layer.borderColor = UIColor.white.cgColor
        default:
            break
        }
    }
    
    func changedColorQuestion(user: UserModel) {
        for button in arrayButtons {
            if button.tag < user.round {
                if button.tag == 5 || button.tag == 10 {
                    button.backgroundColor = UIColor.blue
                } else {
                    button.backgroundColor = UIColor.green
                }
            }
        }
    }
    
    @IBAction func questionButton1Press(sender: UIButton) {
        print("questionButton1")
    }
}
