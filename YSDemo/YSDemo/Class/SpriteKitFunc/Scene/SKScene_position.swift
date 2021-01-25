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
        deleteAction()
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
    
    // MARK: - 调整尺寸
    private func resizeAction(){
        // 增量方式调整
        let act1 = SKAction.resize(byWidth: 100, height: 100, duration: 2)
        
        // 调整至目标值
        let act2 = SKAction.resize(toWidth: 50, duration: 2)
        let act3 = SKAction.resize(toHeight: 50, duration: 2)
        let act4 = SKAction.resize(toWidth: 200, height: 200, duration: 2)
        
        node.run(SKAction.sequence([act1, act2, act3, act4]))
    }
    
    // MARK: - 缩放
    private func scaleAction(){
        // 增量方式缩放
        // let act1 = SKAction.scale(by: 2, duration: 2) // x、y都扩大2倍
        // let act2 = SKAction.scaleX(by: 1, y: 1.5, duration: 2) // x不变，y再扩大1.5倍
    
        // let act1 = SKAction.scale(to: 2, duration: 2) // 扩大至2倍
        // let act2 = SKAction.scale(to: CGSize(width: 150, height: 150), duration: 2) // 扩大至指定尺寸
        
        let act1 = SKAction.scaleX(to: 2, duration: 2) // x轴缩放
        let act2 = SKAction.scaleY(to: 2, duration: 2) // y轴缩放
        let act3 = SKAction.scaleX(to: 1, y: 1, duration: 2) // x、y都缩放
        node.run(SKAction.sequence([act1, act2, act3]))
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
    
    // MARK: - 块动作，把动作的整个执行过程放到一个Block块中
    
    // 2中形式，一种带线程，一种不带
    private func blockAction(){
        let block = SKAction.run({ [weak self] in
            let move = SKAction.move(by: CGVector(dx: 100, dy: 100), duration: 2)
            self?.node.run(move)
        }, queue: DispatchQueue.main)
        node.run(block)
    }
    
    // MARK: - 透明度动作，改变节点透明度
    private func fadeAction(){
        // 指定时间alpha变为0
        let act1 = SKAction.fadeOut(withDuration: 2)
        
        // 指定时间alpha变为1
        let act2 = SKAction.fadeIn(withDuration: 2)
        
        // 指定时间alpha变为指定值
        let act3 = SKAction.fadeAlpha(to: 0.2, duration: 2)
        
        /// alpha的增量，增加多少alpha
        let act4 = SKAction.fadeAlpha(by: 0.2, duration: 2)
        
        node.run(SKAction.sequence([act1, act2, act3, act4]))
    }
    
    // MARK: - 隐藏/显示动作
    /*
     隐藏/显示动作：整体效果看起来和透明度的整体效果差不多。但是还是有一些区别的：
     透明度只是改变的透明度，节点还是存在在场景上的。
     而隐藏/显示动作是真的隐藏了，节点是不存在场景之中的。
     */
    private func hideUnhideAction(){
        let hide = SKAction.hide()
        let unhide = SKAction.unhide()
        node.run(SKAction.sequence([hide, unhide]))
    }
    
    // MARK: - 颜色动作，改变节点的颜色以及混合因子
    private func colorAction(){
        // BlendFactor，混合因为，可以理解为颜色的深浅度
        let act1 = SKAction.colorize(withColorBlendFactor: 0.2, duration: 2)
        let act2 = SKAction.colorize(with: .red, colorBlendFactor: 0.8, duration: 2)
        node.run(SKAction.sequence([act1, act2]))
    }
    
    // MARK: - 等待动作，一般结合其他动作一起使用
    private func waitAction(){
        // 指定延迟时间
        let wait1 = SKAction.wait(forDuration: 2)
        
        // 指定延迟时间和延迟时间的范围
        // range：前后变化2秒(range/2)，duration：2 + (-2...2) = 0...4
        let wait2 = SKAction.wait(forDuration: 2, withRange: 4)
        
        let scale = SKAction.scaleX(to: 2, duration: 2)
        let move = SKAction.move(to: CGPoint(x: 100, y: 300), duration: 2)
        let color = SKAction.colorize(with: .red, colorBlendFactor: 1, duration: 2)
        
        node.run(SKAction.sequence([scale, wait1, move, wait2, color]))
    }
    
    // MARK: - 自定义动作
    private func customAction(){
        // 2秒中内block一直在执行
        let act = SKAction.customAction(withDuration: 2, actionBlock: { [weak self] (node, elapsedTime) in
            guard let `self` = self else{ return }
            node.position = CGPoint(x: 100, y: 300)
            print(elapsedTime) // 当前过了多久
            print(node == self.node) // true，这里的node就是执行动作的node
        })
        node.run(act)
    }
    
    // MARK: - 删除动作，即删除节点，当不需要节点的时候，可以删除
    private func deleteAction(){
        let act = SKAction.move(to: CGPoint(x: 100, y: 400), duration: 2)
        let del = SKAction.removeFromParent()
        node.run(SKAction.sequence([act, del]))
    }
}

// MARK: - 速度动作
/*
 速度动作一般是配合着别的位置动作使用的，其实不但有速度动作，还有速度属性。
 我们可以给定一定的速度值来改变场景中节点执行动作的速度。
 速度动作有两个创建方式：一个是设置一个恒定的速度，加速度为0；一个是设置恒定的加速度，即速度增量。
 */
extension SKScene_position{
    
    private func speedAction(){
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
