//
//  SKScene_textureAtlas.swift
//  YSDemo
//
//  Created by yaoshuai on 2021/1/24.
//

/// 纹理集action，其实就相当于UIKit里面的序列帧动画
class SKScene_textureAtlas: SKScene {
    
    private lazy var node:SKSpriteNode = SKSpriteNode(imageNamed: "girl").ys.then{
        $0.size = CGSize(width: 100, height: 100)
    }
 
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        addChild(node)
        node.position = CGPoint(x: view.bounds.width * 0.5, y: view.bounds.height * 0.5)
    }
    
    deinit {
        Tool_print.print("SKScene-deinit：SKScene_textureAtlas")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let atlas = SKTextureAtlas(named: "plane")
        
        var list = [SKTexture]()
        for item in atlas.textureNames{
            list.append(SKTexture(imageNamed: item))
        }
        
        if list.isEmpty{
            return
        }
        
        // 每一帧多少秒
        let act = SKAction.animate(with: list, timePerFrame: 0.1)
        
        // repeatForever：将一个action生成一个永远重复的action
        node.run(SKAction.repeatForever(act))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: { [weak self] in
            // 移除所有action，SKSpriteNode图片保留在最后一帧
            self?.node.removeAllActions()
        })
    }
}
