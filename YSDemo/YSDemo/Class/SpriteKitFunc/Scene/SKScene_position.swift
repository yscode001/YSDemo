//
//  SKScene_position.swift
//  YSDemo
//
//  Created by yaoshuai on 2021/1/24.
//

/// 位置动作
class SKScene_position: SKScene {
    
    private lazy var node:SKSpriteNode = SKSpriteNode(imageNamed: "girl").ys.then{
        $0.position = CGPoint(x: UIScreen.ys.mainWidth * 0.5, y: 80)
        $0.size = CGSize(width: 100, height: 100)
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        addChild(node)
    }
    
    deinit {
        Tool_print.print("SKScene-deinit：SKScene_position")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        speed()
    }
}

// MARK: - 具体的动作
extension SKScene_position{
    
    // MARK: - 移动
    private func moveAction(){
        // 移动了xxx距离
        // let act = SKAction.moveBy(x: 100, y: 100, duration: 2) // 注意：起点是当前点，而不是最初点
        let act = SKAction.move(by: CGVector(dx: 100, dy: 100), duration: 2) // 同上，vector是x，y的集合
        
        // 移动到xxx
        // let act = SKAction.moveTo(x: 100, duration: 2) // 水平移动，如果当前点==目标点，不移动
        // let act = SKAction.moveTo(y: 500, duration: 2) // 垂直移动，如果当前点==目标点，不移动
        // let act = SKAction.move(to: CGPoint(x: 200, y: 500), duration: 2) // 指定点移动，如果当前点==目标点，不移动
        
        node.run(act)
    }
    
    // MARK: - 旋转
    private func rotateAction(){
        // angle：用来指定精灵或者其他节点的旋转量，以弧度为单位：下面所示的常用的角度(框架自带)
        // x轴为0度，逆时针为正，顺时针为负
        // #define M_PI------3.14159265358979323846264338327950288----180度
        // #define M_PI_2----1.57079632679489661923132169163975144----90度
        // #define M_PI_4----0.785398163397448309615660845819875721---45度
        
        // 旋转到指定弧度，如果当前弧度==目标弧度，不旋转
        // let act = SKAction.rotate(toAngle: -CGFloat.pi, duration: 2)
        
        // 旋转到指定弧度
        // shortestUnitArc：为true时，顺正逆负；为false时，顺负逆正
        let act = SKAction.rotate(toAngle: CGFloat.pi, duration: 1, shortestUnitArc: false)
        
        // 旋转了指定弧度，注意：起点是当前弧度，不是最初弧度
        // let act = SKAction.rotate(byAngle: CGFloat.pi, duration: 1)
        node.run(act)
    }
    
    // MARK: - 路径
    private func pathAction(){
        /*
         先看2个参数：
         asOffset（默认为true）：
         1、true：相对路径，以精灵当前位置为坐标原点
         2、false：以精灵的父类坐标系为基准
         orientToPath(默认为true)：
         1、true：在旋转过程中，精灵会进行自转，即头始终朝着中心
         2、false：在旋转过程中，精灵不会自转
         */
        
        let rect = CGRect(x: 100, y: 100, width: 200, height: 300)
        let path = CGPath(rect: rect, transform: nil)
        
        // 精灵的移动路径，速度
        // let act = SKAction.follow(path, speed: 100)
        
        // 上面的增强版
        // let act = SKAction.follow(path, asOffset: false, orientToPath: false, speed: 100)
        
        // 精灵的移动路径，路径动作完成所需要的时间
        // let act = SKAction.follow(path, duration: 2)
        
        // 上面的增强版
        let act = SKAction.follow(path, asOffset: false, orientToPath: false, duration: 2)
        
        node.run(act)
    }
    
    // MARK: - 反向运动
    private func reversedAction(){
        let move = SKAction.move(by: CGVector(dx: 100, dy: 100), duration: 2)
        let reversed = move.reversed() // 原动作的反向
        
        // 序列动作：SKAction.sequence，按顺序执行
        // SKAction.sequence：把一组action组合成一个action，按顺序执行，前一个执行完，后一个再执行
        let act = SKAction.sequence([move, reversed])
        node.run(act)
    }
}

// MARK: - 速度动作
/*
 速度动作一般是配合着别的位置动作使用的，其实不但有速度动作，还有速度属性。
 我们可以给定一定的速度值来改变场景中节点执行动作的速度。
 速度动作有两个创建方式：一个是设置一个恒定的速度，加速度为0；一个是设置恒定的加速度，即速度增量。
 */
extension SKScene_position{
    
    private func speed(){
        // 指定节点运动的速度，指定完成动作所需要的时间
        // 速度恒定
        let speed = SKAction.speed(to: 10, duration: 2)
        
        // 指定节点运动的加速度(即速度增量)，指定完成动作所需要的时间
        // 速度越来越快
        // let speed = SKAction.speed(by: 10, duration: 2)
        
        let move = SKAction.move(by: CGVector(dx: 100, dy: 500), duration: 10)
        
        // 组动作：SKAction.group，同时执行
        // SKAction.group：把一组action组合成一个action，同时执行
        let group = SKAction.group([speed, move])
        
        node.run(group)
    }
}

// MARK: - 组合动作
/*
 序列动作：按顺序执行
 SKAction.sequence([move, reversed])
 
 组动作：同时执行
 SKAction.group([speed, move])
 
 重复动作：执行重复次数、无限重复
 SKAction.repeat(move, count: 10)
 SKAction.repeatForever(move)
 
 组合动作注意事项:
 上面叙述的组动作,序列动作,重复动作是以子动作的方式包含其他动作：
 一个序列动作中有多个子动作，序列中的每一个动作在前一个动作结束之前开始。
 一个组动作中有多个子动作，动作组中的所有动作同时开始执行。
 一个重复动作中只有一个子动作，当重复动作中的子动作完成时，重复动作将重新开始执行。
 上面三种动作可以嵌套使用，这种使动作结合起来的能力可以帮你为节点添加非常复杂的动作。
 */
