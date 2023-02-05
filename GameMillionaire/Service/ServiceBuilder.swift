//
//  GameScreenBuilder.swift
//  GameMillionaire
//
//  Created by Алексей Попроцкий on 05.02.2023.
//

import UIKit

protocol GameScreenBuilderProtocol {
    static func createGameScreenService(serviceTimer: ServiceTimerProtocol) -> UIViewController
}

