/**
 碰撞类型：
 extension UICollisionBehavior {
 
 public struct Mode : OptionSet {
 
 // 元素之间的碰撞(不会检测到边界碰撞)
 public static var items: UICollisionBehavior.Mode { get }
 
 // 边界碰撞(不会检测到元素之间的碰撞)
 public static var boundaries: UICollisionBehavior.Mode { get }
 
 // 碰撞所有(会同时检测到边界和元素之间的碰撞)
 public static var everything: UICollisionBehavior.Mode { get }
 }
 }
 */

/// 物理引擎：碰撞检测
class VC_uk_physics_collision: VC_base {
    
    private lazy var redPointV:UIImageView = UIImageView.ys.create(imgName: "cp_red")
    
    private lazy var animator:UIDynamicAnimator = UIDynamicAnimator(referenceView: self.view)
    
    override func viewDidLoad(firstTime: Bool) {
        super.viewDidLoad(firstTime: firstTime)
        setupUI()
    }
    
    private func setupUI(){
        view.addSubview(redPointV)
        redPointV.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(100)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 重力
        let gravity = UIGravityBehavior(items: [redPointV])
        gravity.gravityDirection = CGVector(dx: 1, dy: 1)
        
        // 碰撞
        let collision = UICollisionBehavior(items: [redPointV])
        /*
         这是将重力向量设置为{1, 1}后，dynamicItemView与ReferenceView边界碰撞产生的效果
         translatesReferenceBoundsIntoBoundary：表示是否以当前坐标系边界作为检测碰撞的边界
         此时dynamicItemView运动到self.view的边界时就会发生碰撞
         */
        collision.translatesReferenceBoundsIntoBoundary = true
        // 设置边界内边距
        collision.setTranslatesReferenceBoundsIntoBoundary(with: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        
        // 设置为item后，translatesReferenceBoundsIntoBoundary将失效，因为items只检测items之间的碰撞
        // collision.collisionMode = .items
        
        // 只检测边界碰撞，忽略items之间的碰撞
        // collision.collisionMode = .boundaries
        
        // 碰撞代理
        collision.collisionDelegate = self
        
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
    }
}

// MARK: - 碰撞检测代理

extension VC_uk_physics_collision: UICollisionBehaviorDelegate{
    
    // 动力项开始碰到某个边界
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        
    }
    
    // 动力项结束碰到某个边界
    func collisionBehavior(_ behavior: UICollisionBehavior, endedContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?) {
        
    }
    
    // 一个动力项开始碰到另一个动力项时调用
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
        
    }
    
    // 一个动力项结束碰到另一个动力项时调用
    func collisionBehavior(_ behavior: UICollisionBehavior, endedContactFor item1: UIDynamicItem, with item2: UIDynamicItem) {
        
    }
}
