//
//  GameLogic.swift
//  CoinfFlip
//
//  Created by Arantza Castro Dessavre on 06/02/25.
//

import Foundation

class GameLogic: ObservableObject {
    
    @Published var headsCount = 0
    @Published var tailsCount = 0

    func flipCoin() -> Bool {
        let isHeads = Bool.random()
        if isHeads {
            headsCount += 1
        } else {
            tailsCount += 1
        }
        return isHeads
    }
    
    func resetScores() {
        headsCount = 0
        tailsCount = 0
    }
}
