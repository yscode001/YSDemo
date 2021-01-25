//
//  VC_sk_action.swift
//  YSDemo
//
//  Created by yaoshuai on 2021/1/24.
//

/// action演练
class VC_sk_action: VC_base {
    
    private var scene:SKScene?
    
    private lazy var skV:SKView = SKView(frame: UIScreen.ys.mainBounds)
    
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
        
        scene?.scaleMode = .aspectFill
        scene?.backgroundColor = Color.background
        scene?.size = skFrame.size
        skV.presentScene(scene)
    }
}
