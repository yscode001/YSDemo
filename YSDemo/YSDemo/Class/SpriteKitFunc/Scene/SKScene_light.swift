//
//  SKScene_light.swift
//  YSDemo
//
//  Created by 姚帅 on 2021/1/27.
//

/// 光照节点
class SKScene_light: SKScene {
    
    /// 主精灵节点
    private lazy var redN:SKSpriteNode = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        self.backgroundColor = .orange
        
        redN.position = CGPoint(x: 20, y: 20)
        addChild(redN)
    }
}
