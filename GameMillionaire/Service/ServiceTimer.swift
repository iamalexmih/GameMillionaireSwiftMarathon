//
//  ServiceTimer.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 05.02.2023.
//

import Foundation


protocol ServiceTimerProtocol {
    var serviceMusic: ServiceMusicProtocol? { get }
    func startTimer(roundStages: RoundStages, serviceMusic: ServiceMusicProtocol)
    func timeIsOver() -> Bool
    func stopTimer()
    
    init(serviceMusic: ServiceMusicProtocol)
}
