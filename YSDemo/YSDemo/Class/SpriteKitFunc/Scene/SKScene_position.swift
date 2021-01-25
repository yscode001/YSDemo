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
        pathAction()
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
    
    private func scale_only(){
        
    }
}
