//
//  SKScene_camera.swift
//  YSDemo
//
//  Created by yaoshuai on 2021/1/26.
//

/// 相机节点
class SKScene_camera: SKScene {
    
    /// 相机节点
    private lazy var cameraNode:SKCameraNode = SKCameraNode().ys.then{
        $0.xScale = 1
        $0.yScale = 1
    }
    
    /// 主精灵节点
    private lazy var redN:SKSpriteNode = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 100))
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        let centerPoint = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        
        // 相机
        cameraNode.position = centerPoint
        addChild(cameraNode)
        camera = cameraNode
        
        // spriteNode
        redN.position = centerPoint
        addChild(redN)
    }
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
        // 相机向右移动，相当于镜头向右移动，右边的镜头显示在屏幕上，所以看起来，redN在向左移动
        cameraNode.position.x += 3
        
        // 相对位置不变，看起来，redN没有在动
        // cameraNode.position.x += 3
        // redN.position.x += 3
    }
}
