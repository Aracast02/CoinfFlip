import SwiftUI
import SpriteKit

struct ContentView: View {
    @StateObject var gameLogic: GameLogic = GameLogic()
    @State private var isGameActive = false
    
    
    private var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    private var screenHeight: CGFloat { UIScreen.main.bounds.size.height }
    
    var scene: SKScene {
        let scene = CoinFlipScene(gameLogic: gameLogic)
        scene.size = CGSize(width: 400, height: 600)
        scene.scaleMode = .aspectFill
        return scene
    }
    
    var body: some View {
        ZStack(alignment: .center){
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            if isGameActive {
                // Aquí cargamos la vista del juego
                ScoreView(gameLogic: gameLogic)
                    .environmentObject(gameLogic)
                    .frame(alignment: .center)
                
                SpriteView(scene: scene, options: [.allowsTransparency])
                    .frame(width: screenWidth/2, height: screenHeight/2)
                
            } else {
                MainMenuView(isGameActive: $isGameActive)
            }
        }
        .frame(width: screenWidth, height: screenHeight)
    }
}


