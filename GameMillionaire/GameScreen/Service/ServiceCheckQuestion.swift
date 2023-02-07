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
        timer?.startTimer(roundStages: .wrongAnswer)
        timer?.callBack = { [weak self] in
            guard let self = self else { return }
            print("1")
            if selectedButton.currentTitle == question.rightAnswer {
                print("2")
                self.timer?.startTimer(roundStages: .rightAnswer)
                self.timer?.callBack = nil
                selectedButton.backgroundColor = .green
    //            user.updateScore()
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    self.timer?.stopTimer()
                    //переход на экран c полным списком вопросов
                    //вью последнего вопроса меняет цвет на зеленый
                    print("Верный ответ. Переход на экран c полным списком вопросов")
                }
            } else {
                self.timer?.startTimer(roundStages: .wrongAnswer)
                selectedButton.backgroundColor = .red
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.timer?.stopTimer()
                    //переход на экран c полным списком вопросов
                    //цвет вью последней несгораемой суммы меняется на желтый
                    print("Не верный ответ. Переход на экран c полным списком вопросов")
                }
            }
        }
    }
}
