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
    
    var questionNumber = 0
    var score = 0
    
    func nextQuestion() {
        
    }
    
    static var questionList: [Question] = [
        Question(textQuestion: "Какая кошка самая большая на планете?",
                 difficultyIssue: .lite,
                 variantsAnswer: ["Лев", "Тигр", "Гепард", "Барс"],
                 rightAnswer: "Тигр"),
        
        Question(textQuestion: "Биткойн - это ...?",
                 difficultyIssue: .lite,
                 variantsAnswer: ["Криптовалюта", "Супервалюта", "Скрипка-валюта", "Скрепка-валюта"],
                 rightAnswer: "Криптовалюта"),
        
        Question(textQuestion: "Какие деревья растут из желудей?",
                 difficultyIssue: .lite,
                 variantsAnswer: ["Дуб", "Клен", "Гикори", "Грецкий орех"],
                 rightAnswer: "Дуб"),
        
        Question(textQuestion: "Сколько цветов в радуге?",
                 difficultyIssue: .lite,
                 variantsAnswer: ["7", "10", "6", "8"],
                 rightAnswer: "7"),
        
        Question(textQuestion: "Какое самое твердое вещество в нашем теле?",
                 difficultyIssue: .lite,
                 variantsAnswer: ["Кости", "Волосы", "Ногти", "Зубы"],
                 rightAnswer: "Зубы"),
        
        /// medium
        Question(textQuestion: "Дата первого полета человека в космос?",
                 difficultyIssue: .medium,
                 variantsAnswer: ["12.04.1961", "19.03.1965", "12.06.1956", "10.09.1973"],
                 rightAnswer: "12.04.1961"),
        
        Question(textQuestion: "самый сильный символ в китайской культуре?",
                 difficultyIssue: .medium,
                 variantsAnswer: ["Собака", "Крыса", "Обезьяна", "Дракон"],
                 rightAnswer: "Дракон"),
        
        Question(textQuestion: "Самая длинная река в России?",
                 difficultyIssue: .medium,
                 variantsAnswer: ["Енисей", "Лена", "Волга", "Обь"],
                 rightAnswer: "Лена"),
        
        Question(textQuestion: "Как называется длина круга?",
                 difficultyIssue: .medium,
                 variantsAnswer: ["Диаметр", "Радиус", "Окружность", "Площадь"],
                 rightAnswer: "Окружность"),
        
        Question(textQuestion: "Где самая быстрая мышца в теле?",
                 difficultyIssue: .medium,
                 variantsAnswer: ["Нога", "Рука", "Пальцы", "Глаз"],
                 rightAnswer: "Глаз"),
        
        /// hard
        Question(textQuestion: "Сколько в России субъектов Федерации?",
                 difficultyIssue: .hard,
                 
                 variantsAnswer: ["85", "120", "62", "74"],
                 rightAnswer: "85"),
        
        Question(textQuestion: "Сколько костей в теле взрослого человека?",
                 difficultyIssue: .hard,
                 
                 variantsAnswer: ["501", "105", "206", "347"],
                 rightAnswer: "206"),
        
        Question(textQuestion: "Что изобрели и испытали братья Райт?",
                 difficultyIssue: .hard,
                 
                 variantsAnswer: ["Компьютер", "Автомобиль", "Телефон", "Самолет"],
                 rightAnswer: "Самолет"),
        
        Question(textQuestion: "Кто расписывал потолок Сикстинской капеллы?",
                 difficultyIssue: .hard,
                 variantsAnswer: ["Пабло Пикассо", "Леонардо Да Винчи", "Микеланджело", "Винсент Ван Гог"],
                 rightAnswer: "Микеланджело"),
        
        Question(textQuestion: "трехзначное число: вторая цифра в четыре раза больше третьей, первая – на три меньше второй?",
                 difficultyIssue: .hard,
                 variantsAnswer: ["282", "693", "141", "241"],
                 rightAnswer: "141"),
    ]
    
    static func nextQuestion(round: Int) -> Question {
            switch round {
                
            case 1...5:
                let randomIndex = Int.random(in: 0...4)
                let randomEasyQuestion = questionList.remove(at: randomIndex)
                return randomEasyQuestion
            case 6...10:
                let randomIndex = Int.random(in: 5...9)
                let randomMediumQuestion = questionList.remove(at: randomIndex)
                return randomMediumQuestion
            default:
                let randomIndex = Int.random(in: 10...14)
                let randomHardQuestion = questionList.remove(at: randomIndex)
                return randomHardQuestion
            }
        }
}
