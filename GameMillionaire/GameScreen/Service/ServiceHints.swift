//
//  ServiceHints.swift
//  GameMillionaire
//
//  Created by Даниил Петров on 08.02.2023.
//

import Foundation
import UIKit

protocol ServiceHintsProtocol {
    static func askTheAudience(question: Question, selectedButton: UIButton, timer: ServiceTimerProtocol)
    
    static func fiftyFifty(question: Question, selectedButton: UIButton, timer: ServiceTimerProtocol)
    
    static func phoneAFriend(question: Question, selectedButton: UIButton, timer: ServiceTimerProtocol)
}

class ServiceHints {
    
    var timer: ServiceTimerProtocol?
    
    init(timer: ServiceTimerProtocol?) {
        self.timer = timer
    }
    
    func askTheAudience(question: Question, selectedButton: UIButton) {
        let answers = question.variantsAnswer
        /*
        процентаж = 100%
         райт ансвер = Инт рандом ин 65...75
         процентаж - райт ансвер
         вторая вероятность = процентаж - инт рандом ин 10...15
         третья вероятность = вторая вероятность - инт рандом ин
         ...
         */
        
        /*
         иф
         */
        
        
        
        let message = """
Вариант А:


"""
        
        
        let alert = UIAlertController(title: "title", message: "message", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
//            self.password.text = ""
        }
        alert.addAction(okAction)
//        present(alert, animated: true)
    }
    
}
