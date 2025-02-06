//
//  ScoreView.swift
//  CoinfFlip
//
//  Created by Arantza Castro Dessavre on 06/02/25.
//

import SwiftUI

struct ScoreView: View {
    @ObservedObject var gameLogic: GameLogic
    
    var body: some View {
        VStack{
            Image("scoreText")
                .resizable()
                .scaledToFit()
                .padding(.bottom, -200)
            
            HStack{
                Text("Heads: \(gameLogic.headsCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                
                Text("Tails: \(gameLogic.tailsCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
            }

            Spacer()
        }
        .safeAreaInset(edge: .bottom) {
            Button {
                gameLogic.resetScores()
            } label: {
                Text("Reset scores")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(20)
            }
            .padding(.bottom, 100)
            
        }
    }
}
