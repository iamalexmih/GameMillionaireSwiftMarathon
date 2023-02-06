//
//  ServiceMusic.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 05.02.2023.
//

import Foundation
import AVFoundation


protocol ServiceMusicProtocol {
    func playMusic(roundStages: RoundStages)
    func stopMusic()
}

class serviceMusic: ServiceMusicProtocol {
    
    private var player: AVAudioPlayer!
    private var url: URL?
    
    
    func playMusic(roundStages: RoundStages) {
        
        switch roundStages {
            
        case .roundStart:
            url = Bundle.main.url(forResource: "clockSound", withExtension: "mp3")
        case .rightAnswer:
            url = Bundle.main.url(forResource: "answerRight", withExtension: "mp3")
        case .wrongAnswer:
            url = Bundle.main.url(forResource: "answerWrong", withExtension: "mp3")
        case .timeIsOver:
            url = Bundle.main.url(forResource: "answerWrong", withExtension: "mp3")
        }
        
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    
    func stopMusic() {
        player.stop()
    }
}
