//
//  MainmenuView.swift
//  CoinfFlip
//
//  Created by Arantza Castro Dessavre on 30/01/25.
//

import SwiftUI

struct MainMenuView: View {
    @Binding var isGameActive: Bool
    @State private var animateImage = false
    
    var body: some View {
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
        .onAppear{
            animateImage = true
        }
    }
}

#Preview {
    MainMenuView(isGameActive: .constant(false))
}
