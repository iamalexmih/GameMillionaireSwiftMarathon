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
        selectedButton.backgroundColor = .yellow

        timer?.startTimer(roundStages: .answerIsBeingCheked)
        print(timer?.timeIsOver() as Any)
        
        
        
            if selectedButton.currentTitle == question.rightAnswer {

                self.timer?.startTimer(roundStages: .rightAnswer)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.timer?.stopTimer()
                    selectedButton.backgroundColor = .green

                    print("Ответ верный. Переход на экран c полным списком вопросов")
                }
                

                return true
            } else {
                self.timer?.startTimer(roundStages: .wrongAnswer)

                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.timer?.stopTimer()
                    selectedButton.backgroundColor = .red
                    print("Не верный ответ. Переход на экран c полным списком вопросов")
                }
                return false
            }
    }

}
