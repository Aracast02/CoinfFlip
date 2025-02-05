//
//  MainmenuView.swift
//  CoinfFlip
//
//  Created by Arantza Castro Dessavre on 30/01/25.
//

import SwiftUI

struct MainMenuView: View {
    @State private var isGameActive = false
    @State private var animateImage = false
    
    var body: some View {
        if isGameActive {
            // Aquí cargamos la vista del juego
            ContentView()
                
        } else {
            VStack {
                Image("NewNew")
                    .resizable()
                    .scaledToFit()
              
                Button(action: {
                    isGameActive = true
                }) {
                    Image("coin_heads") // Ícono opcional
                        .resizable()
                        .frame(width: 200, height: 200)
                        .scaleEffect(animateImage ? 2.0 : 1.0) // Slight zoom animation
                        .animation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true), value: animateImage)
                        .padding()
                }
                
                Spacer()
                
                Text("Tap on the coin to start")
                    .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                    .bold()
                    .foregroundStyle(.white)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .onAppear{
                animateImage = true
            }
            .background(Image("background").resizable().scaledToFill())
        }
    }
}

#Preview {
    MainMenuView()
}
