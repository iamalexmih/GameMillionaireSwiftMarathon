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
}



enum DifficultyIssue {
    case lite
    case medium
    case hard
}


class QuestionData {
    static var questionList: [Question] = [
        Question(textQuestion: "сам вопрос", difficultyIssue: .lite, variantsAnswer: ["4 варианта ответа"], rightAnswer: "текст ответа")
    
    ]
}
