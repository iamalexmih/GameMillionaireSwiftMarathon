//
//  PyramidQuestionViewController.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 07.02.2023.
//

import UIKit

class PyramidQuestionViewController: UIViewController {
    
    var router: RouterProtocol!
    @IBOutlet var arrayButtons: [UIButton]!
    @IBOutlet var buttonTakeMoney: UIButton!
    let pyramidQuestionDataService = PyramidQuestionDataService()
    var listProgress: [PyramidQuestionModel] = []

    print("2 = \(2)")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listProgress = pyramidQuestionDataService.getListProgress()
        cornerRadius()
        setBorderForCurrentQuestion(user: UserModel.shared)
        changedColorQuestion(user: UserModel.shared)
        disableButtons(user: UserModel.shared)
        
        UserModel.shared.costQuestion = listProgress[UserModel.shared.round - 1].money
        UserModel.shared.moneyWon = listProgress[UserModel.shared.round - 2].money
    }
    
    
    @IBAction func buttonTakeMoneyPress(_ sender: UIButton) {
        UserModel.shared.isLose = false
        router.showLoseScreen()
    }
    
    
    func cornerRadius() {
        arrayButtons.forEach { $0.layer.cornerRadius = 20 }
        buttonTakeMoney.layer.cornerRadius = 10
    }
    
    
    func setBorderForCurrentQuestion(user: UserModel) {
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
                    button.backgroundColor = UIColor.blue.withAlphaComponent(0.4)
                    button.isEnabled = false
                } else {
                    button.backgroundColor = UIColor.green.withAlphaComponent(0.4)
                    button.isEnabled = false
                }
            }
        }
    }
    
    
    func disableButtons(user: UserModel) {
        for button in arrayButtons {
            button.isEnabled = true
            if button.tag != user.round {
                button.isEnabled = false
            }
        }
    }
    
    @IBAction func questionButtonsPress(sender: UIButton) {
        router.initialAndGoToGameScreen()
        UserModel.shared.costQuestion = listProgress[UserModel.shared.round - 1].money
        UserModel.shared.moneyWon = listProgress[UserModel.shared.round - 2].money
    }
}
