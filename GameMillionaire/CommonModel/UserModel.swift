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
    
    var login: String? = ""
    var round: Int = 1
    var score = 100
    
    func  updateRound() {
        round += 1
    }
}

