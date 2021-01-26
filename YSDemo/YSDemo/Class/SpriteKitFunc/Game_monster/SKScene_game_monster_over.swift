//
//  SKScene_game_monster_over.swift
//  YSDemo
//
//  Created by 姚帅 on 2021/1/26.
//

/// 打怪兽游戏场景(你输了)
class SKScene_game_monster_over: SKScene {
    
    init(size: CGSize, win: Bool) {
        super.init(size: size)
        setupScene(win: win)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        Tool_print.print("SKScene-deinit：SKScene_game_monster_over")
    }
    
    private func setupScene(win: Bool){
        backgroundColor = Color.background
        
        let label = SKLabelNode()
        label.text = win ? "你赢了 :)" : "你输了 :("
        label.fontSize = 40
        label.fontColor = SKColor.black
        label.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(label)
        
        let act = SKAction.sequence([
            SKAction.wait(forDuration: 2.0),
            SKAction.run({ [weak self] in
                guard let `self` = self else { return }
                let transition = SKTransition.doorsOpenHorizontal(withDuration: 2)
                let scene = SKScene_game_monster(size: self.size)
                self.view?.presentScene(scene, transition: transition)
            }, queue: DispatchQueue.main)
        ])
        run(act)
    }
}
