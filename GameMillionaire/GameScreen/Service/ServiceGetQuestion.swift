//
//  ServiceGetQuestion.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 05.02.2023.
//

import Foundation


protocol ServiceGetQuestionProtocol {
    // случайный из массива с учетом сложности раунда
    func getQuestion(round: Int, questionList: [Question]) -> Question
}
