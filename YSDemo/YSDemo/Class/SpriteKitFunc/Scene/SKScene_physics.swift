//
//  SKScene_physics.swift
//  YSDemo
//
//  Created by yaoshuai on 2021/1/25.
//

/// 物理世界
class SKScene_physics: SKScene {
    
    private lazy var node:SKSpriteNode = SKSpriteNode(imageNamed: "girl").ys.then{
        $0.size = CGSize(width: 100, height: 100)
    }
 
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        addChild(node)
        node.position = CGPoint(x: view.bounds.width * 0.5, y: view.bounds.height - 80)
        
        setupScenePhysicsWorld()
    }
    
    deinit {
        Tool_print.print("SKScene-deinit：SKScene_physics")
    }
    
    /// 设置场景的物理世界
    private func setupScenePhysicsWorld(){
        // 重力加速度
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        
        // 碰撞检测代理
        physicsWorld.contactDelegate = self
    }
}

extension SKScene_physics: SKPhysicsContactDelegate{
    
    /*
     SKPhysicsContact：
     open var bodyA: SKPhysicsBody { get }， 联系中的第一个物体
     open var bodyB: SKPhysicsBody { get }， 联系中的第二个物体
     open var contactPoint: CGPoint { get }， 两个物体在场景坐标系中的联系点
     open var contactNormal: CGVector { get }，
     open var collisionImpulse: CGFloat { get }， 两个物体的碰撞强度，牛顿每秒
     */
    
    /// 开始碰撞
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
//        if ((firstBody.categoryBitMask & PhysicsCategory.monster != 0) &&
//                (secondBody.categoryBitMask & PhysicsCategory.projectile != 0)) {
//            if let monster = firstBody.node as? SKSpriteNode,
//               let projectile = secondBody.node as? SKSpriteNode {
//                projectileDidCollideWithMonster(projectile: projectile, monster: monster)
//            }
//        }
    }
    
    /// 结束碰撞
    func didEnd(_ contact: SKPhysicsContact) {
        
    }
}
