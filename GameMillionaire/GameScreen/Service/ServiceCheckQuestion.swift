//
//  ServiceCheckQuestion.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 05.02.2023.
//

import Foundation
import UIKit

protocol ServiceCheckQuestionProtocol {
    static func checkQuestion(question: Question, selectedButton: UIButton, timer: ServiceTimerProtocol)
}

class ServiceCheckQuestion {
    
    var timer: ServiceTimerProtocol?
    
    init(timer: ServiceTimerProtocol?) {
        self.timer = timer
    }
    
    func checkQuestion(question: Question, selectedButton: UIButton) -> Bool {
        
        timer?.stopTimer()
        timer?.startTimer(roundStages: .answerIsBeingCheked)
        selectedButton.backgroundColor = .yellow.withAlphaComponent(0.4)
        
        if selectedButton.currentTitle == question.rightAnswer {
            
            self.timer?.startTimer(roundStages: .rightAnswer)
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.timer?.stopTimer()
                selectedButton.backgroundColor = .green.withAlphaComponent(0.4)
            }
            return true
        } else {
            self.timer?.startTimer(roundStages: .wrongAnswer)
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.timer?.stopTimer()
                selectedButton.backgroundColor = .red.withAlphaComponent(0.4)
            }
            return false
        }
    }
}
