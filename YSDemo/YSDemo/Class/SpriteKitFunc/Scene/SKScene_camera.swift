//
//  SKScene_camera.swift
//  YSDemo
//
//  Created by yaoshuai on 2021/1/26.
//

/// 相机
class SKScene_camera: SKScene {
    
    private lazy var cameraNode:SKCameraNode = SKCameraNode().ys.then{
        $0.xScale = 1
        $0.yScale = 1
        $0.zRotation = 3.14
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        addChild(cameraNode)
        camera = cameraNode
        
        cameraNode.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        
        let bgN = SKSpriteNode(color: .orange, size: size)
        bgN.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        addChild(bgN)
        
        let redN = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 100))
        redN.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        addChild(redN)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let move = SKAction.move(by: CGVector(dx: 200, dy: 0), duration: 2)
        cameraNode.run(move)
    }
}
