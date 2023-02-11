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
    var costQuestion = 100
    var moneyWon = 0
    
    var hintFiftyFifty: Bool = true
    var hintCallFriend: Bool = true
    var hintAskAudience: Bool = true
    
    func  updateRound() {
        round += 1
    }
}

