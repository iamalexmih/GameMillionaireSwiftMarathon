//
//  PyramidQuestionScreen.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 05.02.2023.
//

import Foundation



struct PyramidQuestionModel {
    let idQuestion: Int
    let money: Int
}



class PyramidQuestionDataService {
    private let pyramidQuestionList: [PyramidQuestionModel] = [
        PyramidQuestionModel(idQuestion: 1, money: 100),
        PyramidQuestionModel(idQuestion: 2, money: 200),
        PyramidQuestionModel(idQuestion: 3, money: 300),
        PyramidQuestionModel(idQuestion: 4, money: 500),
        PyramidQuestionModel(idQuestion: 5, money: 1000),
        PyramidQuestionModel(idQuestion: 6, money: 2000),
        PyramidQuestionModel(idQuestion: 7, money: 4000),
        PyramidQuestionModel(idQuestion: 8, money: 8000),
        PyramidQuestionModel(idQuestion: 9, money: 16000),
        PyramidQuestionModel(idQuestion: 10, money: 32000),
        PyramidQuestionModel(idQuestion: 11, money: 64000),
        PyramidQuestionModel(idQuestion: 12, money: 125000),
        PyramidQuestionModel(idQuestion: 13, money: 250000),
        PyramidQuestionModel(idQuestion: 14, money: 500000),
        PyramidQuestionModel(idQuestion: 15, money: 1000000),
    ]
    
    func getListProgress() -> [PyramidQuestionModel] {
        return pyramidQuestionList
    }
}


