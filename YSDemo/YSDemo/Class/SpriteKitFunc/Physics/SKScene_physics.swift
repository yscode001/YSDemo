//
//  SKScene_physics.swift
//  YSDemo
//
//  Created by yaoshuai on 2021/1/25.
//

/// 物理世界
class SKScene_physics: SKScene {
    
    private lazy var node1:SKSpriteNode = SKSpriteNode(imageNamed: "sprite-1").ys.then{
        $0.size = CGSize(width: 50, height: 50)
    }
    private lazy var node2:SKSpriteNode = SKSpriteNode(imageNamed: "sprite-2").ys.then{
        $0.size = CGSize(width: 50, height: 50)
    }
    private lazy var node3:SKSpriteNode = SKSpriteNode(imageNamed: "sprite-3").ys.then{
        $0.size = CGSize(width: 50, height: 50)
    }
 
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        addChild(node1)
        addChild(node2)
        addChild(node3)
        node1.position = CGPoint(x: 80, y: view.bounds.height - 50)
        node2.position = CGPoint(x: 200, y: view.bounds.height - 50)
        node3.position = CGPoint(x: 320, y: view.bounds.height - 50)
        
        setupNodePhysicsBody()
        setupScenePhysicsWorld()
    }
    
    deinit {
        Tool_print.print("SKScene-deinit：SKScene_physics")
    }
    
    /// 设置场景的物理世界
    private func setupScenePhysicsWorld(){
        // 碰撞检测代理
        physicsWorld.contactDelegate = self
    }
    
    /// 设置节点的物理体
    private func setupNodePhysicsBody(){
        
    }
}

extension SKScene_physics: SKPhysicsContactDelegate{
    
}
