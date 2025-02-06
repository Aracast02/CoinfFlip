//
//  flipScene.swift
//  CoinfFlip
//
//  Created by Arantza Castro Dessavre on 30/01/25.
//

import SpriteKit

class CoinFlipScene: SKScene {
    let coin = SKSpriteNode(imageNamed: "coin_heads") // Imagen de la moneda
    var gameLogic = GameLogic()

    // Nuevo inicializador
    init(gameLogic: GameLogic) {
        self.gameLogic = gameLogic
        super.init(size: CGSize(width: 400, height: 600))
        self.scaleMode = .aspectFill
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = .clear
        
        // Configurar la moneda
        coin.position = CGPoint(x: size.width / 2, y: size.height / 3)
        coin.setScale(0.5)
        let coinSize = min(size.width, size.height) * 0.6 // 60% del tamaño de la pantalla
        coin.size = CGSize(width: coinSize, height: coinSize)
        addChild(coin)

        // Agregar interacción táctil
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(flipCoin))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func flipCoin() {
        let isHeads = gameLogic.flipCoin() // Genera cara o cruz aleatoriamente
        let texture = SKTexture(imageNamed: isHeads ? "coin_heads" : "coin_tails")

        let flipAnimation = SKAction.sequence([
            SKAction.scaleX(to: 0.0, duration: 0.2),
            SKAction.run { self.coin.texture = texture },
            SKAction.scaleX(to: 0.5, duration: 0.2)
            
        ])
        let flipRotation = SKAction.rotate(byAngle: .pi * 2, duration: 0.4)
        let flipSequence = SKAction.group([flipAnimation, flipRotation])
        
        coin.run(flipSequence)

    }
}
