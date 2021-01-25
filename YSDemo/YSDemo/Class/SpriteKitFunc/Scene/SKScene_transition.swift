/*
 open class func crossFade(withDuration sec: TimeInterval) -> SKTransition // 交叉淡入淡出

 --------------------------------------------------------
 open class func fade(withDuration sec: TimeInterval) -> SKTransition // 一个淡入淡出的动画,先变为黑色,在切换到新场景

 open class func fade(with color: UIColor, duration sec: TimeInterval) -> SKTransition // 一个淡入淡出的动画,先变为指定颜色,在切换到新场景

 --------------------------------------------------------
 open class func flipHorizontal(withDuration sec: TimeInterval) -> SKTransition // 以水平中轴线垂直翻转的动画

 open class func flipVertical(withDuration sec: TimeInterval) -> SKTransition // 以垂直中轴线水平翻转的动画

 --------------------------------------------------------
 open class func reveal(with direction: SKTransitionDirection, duration sec: TimeInterval) -> SKTransition // 旧场景向指定方向移出,新场景在旧场景下面的动画

 open class func moveIn(with direction: SKTransitionDirection, duration sec: TimeInterval) -> SKTransition // 新场景从指定方向移入的动画

 open class func push(with direction: SKTransitionDirection, duration sec: TimeInterval) -> SKTransition // 新场景向指定方向推入的过渡动画

 --------------------------------------------------------
 open class func doorsOpenHorizontal(withDuration sec: TimeInterval) -> SKTransition // 从中间向两边水平打开的动画

 open class func doorsOpenVertical(withDuration sec: TimeInterval) -> SKTransition // 从中间向上下两边垂直打开的动画

 open class func doorsCloseHorizontal(withDuration sec: TimeInterval) -> SKTransition // 从左右两边水平关闭的动画

 open class func doorsCloseVertical(withDuration sec: TimeInterval) -> SKTransition // 从上下两边垂直关闭的动画
 
 open class func doorway(withDuration sec: TimeInterval) -> SKTransition // 旧场景从中间向两边打开,新场景从后方向屏幕靠近的动画
 */

/// 转场
class SKScene_transition1: SKScene {
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        backgroundColor = .red
    }
    
    deinit {
        Tool_print.print("SKScene-deinit：SKScene_transition1")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view?.presentScene(SKScene_transition2(), transition: getTransition())
    }
    
    /// 转场效果
    private func getTransition() -> SKTransition{
        return .doorsOpenVertical(withDuration: 1)
    }
}

class SKScene_transition2: SKScene {
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        backgroundColor = .blue
    }
    
    deinit {
        Tool_print.print("SKScene-deinit：SKScene_transition2")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view?.presentScene(SKScene_transition1(), transition: getTransition())
    }
    
    /// 转场效果
    private func getTransition() -> SKTransition{
        return .doorsCloseHorizontal(withDuration: 1)
    }
}
