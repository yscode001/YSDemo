//
//  SKScene_game_monster.swift
//  YSDemo
//
//  Created by 姚帅 on 2021/1/26.
//

/// physicsbody类型
struct SKScene_game_monster_physicsCategory {
    
    static let none      : UInt32 = 0
    
    static let all       : UInt32 = UInt32.max
    
    /// 怪兽
    static let monster   : UInt32 = 0b1       // 1
    
    /// 炮弹
    static let projectile: UInt32 = 0b10      // 2
}

/// 打怪兽游戏场景
class SKScene_game_monster: SKScene {
    
    /// 摧毁怪兽的数量
    private lazy var monstersDestroyed = 0
    
    /// 玩家
    private lazy var player:SKSpriteNode = SKSpriteNode(imageNamed: "sk_player")
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        setupScene()
    }
    
    deinit {
        Tool_print.print("SKScene-deinit：SKScene_game_monster")
    }
    
    /// 发射炮弹
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchLocation = touches.first?.location(in: self) else {
            return
        }
        
        // 碰撞音效
        run(SKAction.playSoundFileNamed("sk_biu.caf", waitForCompletion: false))
        
        // 添加炮弹
        let projectile = SKSpriteNode(imageNamed: "sk_projectile")
        projectile.position = player.position
        
        projectile.physicsBody = SKPhysicsBody(circleOfRadius: projectile.size.width / 2)
        projectile.physicsBody?.isDynamic = true
        projectile.physicsBody?.categoryBitMask = SKScene_game_monster_physicsCategory.projectile
        projectile.physicsBody?.contactTestBitMask = SKScene_game_monster_physicsCategory.monster
        projectile.physicsBody?.collisionBitMask = SKScene_game_monster_physicsCategory.none
        projectile.physicsBody?.usesPreciseCollisionDetection = true
        
        // 保证炮弹在玩家右侧
        let offset = touchLocation - projectile.position
        if offset.x < 0 { return }
        addChild(projectile)
        
        // 计算炮弹运动的重点
        let direction = offset.normalized()
        let shootAmount = direction * 1000
        let realDest = shootAmount + projectile.position
        
        let move = SKAction.move(to: realDest, duration: 1)
        let moveDone = SKAction.removeFromParent()
        projectile.run(SKAction.sequence([move, moveDone]))
    }
    
    private func setupScene(){
        backgroundColor = Color.background
        
        // 物理世界联结代理
        physicsWorld.contactDelegate = self
        
        // 添加背景音乐
        let backgroundMusic = SKAudioNode(fileNamed: "sk_bg.caf")
        backgroundMusic.autoplayLooped = true // 自动循环播放
        addChild(backgroundMusic)
        
        // 添加玩家
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        addChild(player)
        
        // 1秒种添加1个怪兽
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(addMonster),
                SKAction.wait(forDuration: 1)
            ])
        ))
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    /// 添加怪兽
    func addMonster() {
        let monster = SKSpriteNode(imageNamed: "sk_monster")
        monster.physicsBody = SKPhysicsBody(rectangleOf: monster.size)
        monster.physicsBody?.isDynamic = true
        monster.physicsBody?.categoryBitMask = SKScene_game_monster_physicsCategory.monster
        monster.physicsBody?.contactTestBitMask = SKScene_game_monster_physicsCategory.projectile
        monster.physicsBody?.collisionBitMask = SKScene_game_monster_physicsCategory.none
        
        // 怪兽y轴随机
        let actualY = random(min: monster.size.height / 2, max: size.height - monster.size.height / 2)
        monster.position = CGPoint(x: size.width + monster.size.width / 2, y: actualY)
        
        addChild(monster)
        
        // 怪兽从右边走到左边的时间随机
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
        let actionMove = SKAction.move(to: CGPoint(x: -monster.size.width/2, y: actualY), duration: TimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        let loseAction = SKAction.run() { [weak self] in
            guard let `self` = self else { return }
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 1)
            let gameOverScene = SKScene_game_monster_over(size: self.size, win: false)
            self.view?.presentScene(gameOverScene, transition: reveal)
        }
        monster.run(SKAction.sequence([actionMove, loseAction, actionMoveDone]))
    }
}

/// 碰撞检测代理
extension SKScene_game_monster: SKPhysicsContactDelegate{
    
    /// 炮弹碰到了怪兽
    /// - Parameters:
    ///   - projectile: 炮弹
    ///   - monster: 怪兽
    private func projectileDidCollideWithMonster(projectile: SKSpriteNode, monster: SKSpriteNode) {
        projectile.removeFromParent()
        monster.removeFromParent()
        
        monstersDestroyed += 1
        if monstersDestroyed >= 10 { // 摧毁10个就算赢
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.5)
            let gameOverScene = SKScene_game_monster_over(size: size, win: true)
            view?.presentScene(gameOverScene, transition: reveal)
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var body1: SKPhysicsBody
        var body2: SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            body1 = contact.bodyA
            body2 = contact.bodyB
        } else {
            body1 = contact.bodyB
            body2 = contact.bodyA
        }
        
        if ((body1.categoryBitMask & SKScene_game_monster_physicsCategory.monster != 0) &&
                (body2.categoryBitMask & SKScene_game_monster_physicsCategory.projectile != 0)) {
            if let monster = body1.node as? SKSpriteNode,
               let projectile = body2.node as? SKSpriteNode {
                projectileDidCollideWithMonster(projectile: projectile, monster: monster)
            }
        }
    }
}
