//
//  UserModel.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 05.02.2023.
//

import Foundation


class UserModel {
    
    static let shared = UserModel()
    private init() { }
    
    let login: String? = ""
    let round: Int = 1
    var score = 0
    
    func  updateScore() {
        
    }
}

