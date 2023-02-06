//
//  ServiceCheckQuestion.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 05.02.2023.
//

import Foundation


protocol ServiceCheckQuestionProtocol {
    static func checkQuestion(question: Question, titleSelectedButton: String, timer: ServiceTimerProtocol) -> Bool
}
