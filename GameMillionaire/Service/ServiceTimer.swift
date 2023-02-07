//
//  ServiceTimer.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 05.02.2023.
//

import Foundation


protocol ServiceTimerProtocol {
    var serviceMusic: ServiceMusicProtocol? { get }
    func startTimer(roundStages: RoundStages)
    func timeIsOver() -> Bool
    func stopTimer()
    
    
    init(serviceMusic: ServiceMusicProtocol)
}

class ServiceTimer: ServiceTimerProtocol {
    
    var serviceMusic: ServiceMusicProtocol?
    var timer = Timer()
    var totalTime = 0

    func startTimer(roundStages: RoundStages) {
        switch roundStages {
        case .roundStart:
            serviceMusic?.playMusic(roundStages: .roundStart)
            totalTime = 30
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: false)
        case .rightAnswer:
            serviceMusic?.playMusic(roundStages: .rightAnswer)
            totalTime = 4
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: false)
        case .wrongAnswer:
            serviceMusic?.playMusic(roundStages: .wrongAnswer)
            totalTime = 4
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: false)
        case .timeIsOver:
            serviceMusic?.playMusic(roundStages: .timeIsOver)
            totalTime = 5
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: false)
        case .answerIsBeingCheked:
            serviceMusic?.playMusic(roundStages: .timeIsOver)
            totalTime = 5
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: false)
        }
    }
    
    @objc func updateTimer() {
        totalTime -= 1
        if totalTime == 0 {
            timer.invalidate()
            serviceMusic?.stopMusic()
        } 
    }
    
    func timeIsOver() -> Bool {
        if totalTime == 0 {
            return true
        } else {
            return false
        }
    }
    
    func stopTimer() {
        totalTime = 0
        timer.invalidate()
        serviceMusic?.stopMusic()
    }
    
    required init(serviceMusic: ServiceMusicProtocol) {
        self.serviceMusic = serviceMusic
    }
}

