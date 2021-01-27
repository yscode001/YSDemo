//
//  VC_sk_action.swift
//  YSDemo
//
//  Created by yaoshuai on 2021/1/24.
//

/// action演练
class VC_sk_action: VC_base {
    
    private var scene:SKScene?
    
    private lazy var skV:SKView = SKView(frame: UIScreen.ys.mainBounds).ys.then{
        $0.showsFPS = true // 是否显示帧率
        $0.showsNodeCount = true // 是否显示节点数(精灵数)
        $0.showsDrawCount = true // 是否显示绘制数量，使用多少绘画传递来渲染内容（越少越好）
        $0.showsQuadCount = true // 是否显示矩形数量(默认为不开启)
        $0.showsPhysics = true // 是否显示物理引擎
        $0.ignoresSiblingOrder = true // 是否利用Z轴的层级深浅关系来定制绘制次序(绘制属性)
    }
    
    convenience init(scene: SKScene) {
        self.init()
        self.scene = scene
    }
    
    override func viewDidLoad(firstTime: Bool) {
        super.viewDidLoad(firstTime: firstTime)
        setupScene()
    }
    
    private func setupScene(){
        view.ys.addSubviews(navBar, skV)
        
        let vb = view.bounds
        let skFrame = CGRect(x: 0, y: navBar.bounds.height, width: vb.width, height: vb.height - navBar.bounds.height)
        skV.frame = skFrame
        
        /*
         缩放模式：
         fill：这个模式会让场景全部显示出来，但是会导致场景变形
         aspectFill：此模式可以保证场景比例不变，会填充整个视图，但可能只是部分场景显示出来
         aspectFit：此模式会保证场景比例不变，而且全部现在在视图当中，视图可能会有留白
         resizeFill：此模式可以保证场景与视图的尺寸相匹配
         */
        scene?.scaleMode = .aspectFill
        scene?.backgroundColor = Color.background
        scene?.size = skFrame.size
        skV.presentScene(scene)
    }
}
