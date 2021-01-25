//
//  VC_uk_physics_push.swift
//  YSDemo
//
//  Created by yaoshuai on 2021/1/24.
//

/// 物理引擎：推动
class VC_uk_physics_push: VC_base {
    
    private lazy var continuousBtn:UIButton = UIButton.ys.create(titlec: .blue, title: "连续推力", target: self, action: #selector(continuousBtnClick))
    
    private lazy var instantaneousBtn:UIButton = UIButton.ys.create(titlec: .red, title: "瞬间推力", target: self, action: #selector(instantaneousBtnClick))
    
    private lazy var bluePointV:UIImageView = UIImageView.ys.create(imgName: "cp_blue")
    
    private lazy var redPointV:UIImageView = UIImageView.ys.create(imgName: "cp_red")
    
    private lazy var pushContinuousBehavior:UIPushBehavior = UIPushBehavior(items: [self.bluePointV], mode: .continuous).ys.then{
        // continuous：连续推力(一直在推)
        // instantaneous：瞬间推力(只推一下)
        // let push = UIPushBehavior(items: [birdImgV], mode: .instantaneous)
        
        // 设置推力大小和方向
        $0.pushDirection = CGVector(dx: 1, dy: 1)
        
        // 作用力中心偏移量设置，设置之后，将转圈推，因为不是推在中心上
        // 作用力点发生偏移，在受到推动作用后产生自旋
        $0.setTargetOffsetFromCenter(UIOffset(horizontal: -25, vertical: 0), for: bluePointV)
        
        self.animator.addBehavior($0)
    }
    
    private lazy var pushInstantaneousBehavior:UIPushBehavior = UIPushBehavior(items: [self.redPointV], mode: .instantaneous).ys.then{
        // continuous：连续推力(一直在推)
        // instantaneous：瞬间推力(只推一下)
        // let push = UIPushBehavior(items: [birdImgV], mode: .instantaneous)
        
        // 设置推力大小和方向
        $0.pushDirection = CGVector(dx: -1, dy: 1)
        
        // 作用力中心偏移量设置，设置之后，将转圈推，因为不是推在中心上
        // 作用力点发生偏移，在受到推动作用后产生自旋
        $0.setTargetOffsetFromCenter(UIOffset(horizontal: -25, vertical: 0), for: redPointV)
        
        self.animator.addBehavior($0)
    }
    
    // MARK: - 添加边界碰撞检测，否则小球会落到屏幕之外
    private lazy var collision:UICollisionBehavior = UICollisionBehavior(items: [bluePointV, redPointV]).ys.then{
        $0.translatesReferenceBoundsIntoBoundary = true
    }
    
    private lazy var animator:UIDynamicAnimator = UIDynamicAnimator(referenceView: self.view)
    
    override func viewDidLoad(firstTime: Bool) {
        super.viewDidLoad(firstTime: firstTime)
        setupUI()
    }
    
    private func setupUI(){
        view.ys.addSubviews(navBar, continuousBtn, instantaneousBtn, bluePointV, redPointV)
        continuousBtn.snp.makeConstraints { (make) in
            make.top.equalTo(navBar.snp.bottom).offset(20)
            make.centerX.equalTo(view).offset(80)
            make.size.equalTo(CGSize(width: 100, height: 40))
        }
        instantaneousBtn.snp.makeConstraints { (make) in
            make.top.equalTo(navBar.snp.bottom).offset(20)
            make.centerX.equalTo(view).offset(-80)
            make.size.equalTo(CGSize(width: 100, height: 40))
        }
        bluePointV.snp.makeConstraints { (make) in
            make.top.equalTo(continuousBtn.snp.bottom).offset(20)
            make.centerX.equalTo(view).offset(80)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
        redPointV.snp.makeConstraints { (make) in
            make.top.equalTo(instantaneousBtn.snp.bottom).offset(20)
            make.centerX.equalTo(view).offset(-80)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
    }
}

extension VC_uk_physics_push{
    
    @objc private func continuousBtnClick(){
        // 推动行为是否处于活跃状态
        // 在添加一个push behavior到animator时，使用这个属性来激活或禁用推力作用，而不是通过重新添加behavior来实现
        pushContinuousBehavior.active.toggle()
        if pushContinuousBehavior.active, !animator.behaviors.contains(collision){
            animator.addBehavior(collision)
        }
    }
    
    @objc private func instantaneousBtnClick(){
        // 推动行为是否处于活跃状态
        // 在添加一个push behavior到animator时，使用这个属性来激活或禁用推力作用，而不是通过重新添加behavior来实现
        pushInstantaneousBehavior.active.toggle()
        if pushInstantaneousBehavior.active, !animator.behaviors.contains(collision){
            animator.addBehavior(collision)
        }
    }
}
