//
//  SKScene_scale.swift
//  YSDemo
//
//  Created by yaoshuai on 2021/1/24.
//

/// 基础action：缩放、平移、旋转
class SKScene_scale: SKScene {
    
    private lazy var node:SKSpriteNode = SKSpriteNode(imageNamed: "girl").ys.then{
        $0.position = CGPoint(x: UIScreen.ys.mainWidth * 0.5, y: 80)
        $0.size = CGSize(width: 100, height: 100)
    }
 
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        addChild(node)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        move_only()
    }
}

extension SKScene_scale{
    
    private func move_only(){
        // 移动了xxx距离
        let act = SKAction.moveBy(x: 100, y: 500, duration: 2)
        node.run(act)
    }
    
    private func scale_only(){
        
    }
    
    private func rotate_only(){
        
    }
}
