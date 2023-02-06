//
//  ServiceCheckQuestion.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 05.02.2023.
//

import Foundation
import UIKit

protocol ServiceCheckQuestionProtocol {
    static func checkQuestion(question: Question, selectedButton: UIButton, timer: ServiceTimerProtocol, music: ServiceMusicProtocol, user: UserModel)
}

class ServiceCheckQuestion: ServiceCheckQuestionProtocol {
    static func checkQuestion(question: Question, selectedButton: UIButton, timer: ServiceTimerProtocol, music: ServiceMusicProtocol, user: UserModel){
        
        timer.stopTimer()
        selectedButton.backgroundColor = .yellow //попробовать другие цвета
        //сделать кастомную кнопку для изменения шрифта, мб добавить границы
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
           // music.playMusic(roundStages: .answerIsBeingCheked)
        }
        if selectedButton.currentTitle == question.rightAnswer {
            music.playMusic(roundStages: .rightAnswer)
            user.updateScore()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                //переход на экран c полным списком вопросов
                //вью последнего вопроса меняет цвет на зеленый
            }
            
        } else {
            music.playMusic(roundStages: .wrongAnswer)
            selectedButton.backgroundColor = .red
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                //переход на экран c полным списком вопросов
                //цвет вью последней несгораемой суммы меняется на желтый
            }
        }
    }
}
