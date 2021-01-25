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
    
    deinit {
        Tool_print.print("SKScene-deinit：SKScene_scale")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        move_only()
    }
}

extension SKScene_scale{
    
    private func move_only(){
        // 移动了xxx距离
        // let act = SKAction.moveBy(x: 100, y: 100, duration: 2) // 注意：起点是当前点，而不是最初点
        let act = SKAction.move(by: CGVector(dx: 100, dy: 100), duration: 2) // 同上，vector是x，y的集合
        
        // 移动到xxx
        // let act = SKAction.moveTo(x: 100, duration: 2) // 水平移动，如果当前点==目标点，不移动
        // let act = SKAction.moveTo(y: 500, duration: 2) // 垂直移动，如果当前点==目标点，不移动
        // let act = SKAction.move(to: CGPoint(x: 200, y: 500), duration: 2) // 指定点移动，如果当前点==目标点，不移动
        node.run(act)
    }
    
    private func scale_only(){
        
    }
    
    private func rotate_only(){
        
    }
}
