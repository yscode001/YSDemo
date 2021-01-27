//
//  SKScene_emitter.swift
//  YSDemo
//
//  Created by yaoshuai on 2021/1/27.
//

/// 粒子节点
class SKScene_emitter: SKScene {
    
    private lazy var redN:SKSpriteNode = SKSpriteNode.init(color: .red, size: CGSize(width: 100, height: 100))
    
    private lazy var emitterN:SKEmitterNode = NSKeyedUnarchiver.unarchiveObject(withFile: Bundle.main.path(forResource: "FireParticle", ofType: "sks")!) as! SKEmitterNode
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        backgroundColor = .black
        
        let centerP = CGPoint(x: size.width / 2, y: size.height / 2)
        redN.position = centerP
        addChild(redN)
        
        emitterN.position = CGPoint(x: 0, y: 0)
        redN.addChild(emitterN)
    }
}
