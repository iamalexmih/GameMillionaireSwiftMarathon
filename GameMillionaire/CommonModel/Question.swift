//
//  Question.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 05.02.2023.
//

import Foundation


struct Question {
    let textQuestion: String
    let difficultyIssue: DifficultyIssue
    let variantsAnswer: [String]
    let rightAnswer: String
    
//    var price: Int {
//        if currentQuestion < 11 {
//            return currentQuestion * 100
//        } else {
//            return ???
//        }
     /*
      15    2000
      14    1800
      13    1600
      12    1400
      11    1200
      10    1000
      9     900
      8     800
      7     700
      6     600
      5     500
      4     400
      
      
//      */
//    }
}



enum DifficultyIssue {
    case lite
    case medium
    case hard
}


class QuestionData {
    static var questionList: [Question] = [
        Question(textQuestion: "сам вопрос", difficultyIssue: .lite, variantsAnswer: ["варианта 1", "варианта 2", "варианта 3", "варианта 4"], rightAnswer: "текст ответа")
    ]
    func nextQuestion() {
        
    }
}
