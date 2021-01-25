//
//  VC_uk_physics_snap.swift
//  YSDemo
//
//  Created by yaoshuai on 2021/1/24.
//

// 捕获行为是定义一个动态元素运动到指定点，运动过程伴随弹簧效果

/// 物理引擎：捕获
class VC_uk_physics_snap: VC_base {
    
    private lazy var bluePointV:UIImageView = UIImageView.ys.create(imgName: "cp_blue")
    
    private lazy var animator:UIDynamicAnimator = UIDynamicAnimator(referenceView: self.view)
    
    override func viewDidLoad(firstTime: Bool) {
        super.viewDidLoad(firstTime: firstTime)
        setupUI()
    }
    
    private func setupUI(){
        view.ys.addSubviews(navBar, bluePointV)
        bluePointV.snp.makeConstraints { (make) in
            make.top.equalTo(navBar.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        animator.removeAllBehaviors()
        
        guard let loc = touches.first?.location(in: view) else{ return }
        let snap = UISnapBehavior(item: bluePointV, snapTo: loc)
        
        // 震动幅度：0表示振幅最大，1振幅最小
        snap.damping = 0.8
        
        animator.addBehavior(snap)
        
        // 移除behavior后，dynamicItem会回到最初的位置
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: { [weak self] in
            self?.animator.removeAllBehaviors()
        })
    }
}
