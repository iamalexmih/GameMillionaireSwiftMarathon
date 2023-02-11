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
            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                
                self.timer?.stopTimer()
                self.timer?.startTimer(roundStages: .rightAnswer)
                UserModel.shared.updateRound()
                selectedButton.backgroundColor = .green.withAlphaComponent(0.4)
            }
            return true
        } else {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                self.timer?.stopTimer()
                self.timer?.startTimer(roundStages: .wrongAnswer)
                
                selectedButton.backgroundColor = .red.withAlphaComponent(0.4)
            }
            return false
        }
    }
}
