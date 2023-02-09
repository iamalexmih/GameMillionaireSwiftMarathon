//
//  ServiceHints.swift
//  GameMillionaire
//
//  Created by Даниил Петров on 08.02.2023.
//

import Foundation
import UIKit

protocol ServiceHintsProtocol {
    static func askTheAudience(question: Question)
    
    static func fiftyFifty(question: Question)
    
    static func phoneAFriend(question: Question)
}

class ServiceHints {
 
    func askTheAudience(question: Question) -> UIAlertController {
        let firstPos: String
        let secPos: String
        let thirdPos: String
        let fourthPos: String
        let answers = question.variantsAnswer
        
        if answers[0] == question.rightAnswer {
            firstPos = answers[0]
            secPos = answers[1]
            thirdPos = answers[2]
            fourthPos = answers[3]
        } else if answers[1] == question.rightAnswer {
            firstPos = answers[1]
            secPos = answers[2]
            thirdPos = answers[3]
            fourthPos = answers[0]
        } else if answers[2] == question.rightAnswer {
            firstPos = answers[2]
            secPos = answers[0]
            thirdPos = answers[1]
            fourthPos = answers[3]
        } else {
            firstPos = answers[3]
            secPos = answers[0]
            thirdPos = answers[1]
            fourthPos = answers[2]
        }
        
        let message = """
\(firstPos) - 70%
\(secPos) - 19%
\(thirdPos) - 6%
\(fourthPos) - 5%
"""

        let alertAskTheAudience = UIAlertController(title: "Результаты зрительского голосования:", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
        }
        
        alertAskTheAudience.addAction(okAction)
        return alertAskTheAudience
    }
    
    func callAFriend(question: Question) -> UIAlertController {
        
        var options = question.variantsAnswer
        
        func chooseAnswer() -> String {
            let randomNumber = Double.random(in: 0...1)
            if randomNumber <= 0.8 {
                return question.rightAnswer
            } else {
                let valueToRemove = question.rightAnswer
                let updatedOptions = options.filter { $0 != valueToRemove }
                
                return updatedOptions.randomElement() ?? ""
            }
        }

        let alertCallAFriend = UIAlertController(title: "Ваш друг считает, что правильный ответ:", message: chooseAnswer(), preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
        }
        
        alertCallAFriend.addAction(okAction)
        return alertCallAFriend

    }
}
