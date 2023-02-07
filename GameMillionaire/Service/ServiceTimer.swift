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
    var callBack: (() -> Void)? { get set }
    
    init(serviceMusic: ServiceMusicProtocol)
}

class ServiceTimer: ServiceTimerProtocol {
    
    var serviceMusic: ServiceMusicProtocol?
    var timer = Timer()
    var totalTime = 0
    var callBack: (() -> Void)?

    func startTimer(roundStages: RoundStages) {
        switch roundStages {
        case .roundStart:
            serviceMusic?.playMusic(roundStages: .roundStart)
            totalTime = 30
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        case .rightAnswer:
            serviceMusic?.playMusic(roundStages: .rightAnswer)
            totalTime = 4
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        case .wrongAnswer:
            serviceMusic?.playMusic(roundStages: .wrongAnswer)
            totalTime = 4
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        case .timeIsOver:
            serviceMusic?.playMusic(roundStages: .timeIsOver)
            totalTime = 5
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        case .answerIsBeingCheked:
            serviceMusic?.playMusic(roundStages: .answerIsBeingCheked)
            totalTime = 88
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
    
    @objc func updateTimer() {
        totalTime -= 1
        print("Timer: \(totalTime)")
        if totalTime == 0 {
            timer.invalidate()
            serviceMusic?.stopMusic()
            callBack?()
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
        timer.invalidate()
        serviceMusic?.stopMusic()
        totalTime = 0
    }
    
    required init(serviceMusic: ServiceMusicProtocol) {
        self.serviceMusic = serviceMusic
    }
}

