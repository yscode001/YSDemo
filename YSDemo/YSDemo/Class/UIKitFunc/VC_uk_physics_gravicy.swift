//
//  VC_uk_physics_gravicy.swift
//  YSDemo
//
//  Created by yaoshuai on 2021/1/24.
//

/// 物理引擎：重力
class VC_uk_physics_gravity: VC_base {
 
    private lazy var bluePointV:UIImageView = UIImageView.ys.create(imgName: "cp_blue")
    
    private lazy var animator:UIDynamicAnimator = UIDynamicAnimator(referenceView: self.view)
    
    override func viewDidLoad(firstTime: Bool) {
        super.viewDidLoad(firstTime: firstTime)
        setupUI()
    }
    
    private func setupUI(){
        view.ys.addSubviews(bluePointV)
        bluePointV.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(100)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        animator.removeAllBehaviors()
        
        // MARK: - 添加重力行为
        let gravity = UIGravityBehavior(items: [bluePointV])
        
        // 重力加速度的倍数，1.0代表加速度是1000 points /second²
        // gravity.magnitude = 0.5
        
        // 重力方向：是一个角度，以x轴正方向为0°，顺时针正数，逆时针负数
        // 即：重力矢量方向与坐标轴x的夹角，例如垂直向下：π/2
        // gravity.angle = -1
        
        // 重力加速度与方向：是一个二维向量，可以看成是magnitude和angle的组合
        // vector看结构就是一个点，从坐标原点向这个点连线就是一个矢量，也就是重力的方向，默认是(0.0,1.0)。
        // 这个属性的数据量很丰富，由这个点向X轴和Y轴分别做垂线构成了一个矩形，对角线与X轴夹角就是重力加速度的方向，即angle，
        // 对角线的长度就是重力加速度的值，即magnitude。
        // 即：我们完全可以用gravityDirection变量确定angle和magnitude的值
        // 反之:用angle和magnitude也可以确定gravityDirection的值
        gravity.gravityDirection = CGVector(dx: 0, dy: 1)
        animator.addBehavior(gravity)
        
        // MARK: - 添加边界碰撞检测，否则小球会落到屏幕之外
        let collision = UICollisionBehavior(items: [bluePointV])
        
        /*
         是否需要检测边界碰撞：dynamicItemView与ReferenceView边界碰撞产生的效果
         translatesReferenceBoundsIntoBoundary：表示是否以当前坐标系边界作为检测碰撞的边界
         此时dynamicItemView运动到self.view的边界时就会发生碰撞
         */
        collision.translatesReferenceBoundsIntoBoundary = true
        
        // 设置边界内边距
        // collision.setTranslatesReferenceBoundsIntoBoundary(with: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        
        animator.addBehavior(collision)
        
        // 移除behavior后，dynamicItem会回到最初的位置
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: { [weak self] in
            self?.animator.removeAllBehaviors()
        })
    }
}

extension VC_uk_physics_gravity: UIDynamicAnimatorDelegate{
    
    func dynamicAnimatorWillResume(_ animator: UIDynamicAnimator) {
        
    }
    
    func dynamicAnimatorDidPause(_ animator: UIDynamicAnimator) {
        
    }
}
