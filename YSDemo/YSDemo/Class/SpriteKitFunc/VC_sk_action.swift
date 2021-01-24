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
    
    override func loadView() {
        view = skV
    }
    
    override func viewDidLoad(firstTime: Bool) {
        super.viewDidLoad(firstTime: firstTime)
        setupScene()
    }
    
    private func setupScene(){
        scene?.scaleMode = .aspectFill
        scene?.backgroundColor = Color.background
        scene?.size = view.bounds.size
        skV.presentScene(scene)
    }
}
