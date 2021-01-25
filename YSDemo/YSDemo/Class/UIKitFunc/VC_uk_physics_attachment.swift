/*
 属性解析：
 damping: 阻尼，要和阻力做区分，当此值设置为1时，达到临界阻尼，到达临界阻尼后我们的动画便不再会有回弹的效果
 frequency: 频率，行为的频率，单位Hz，值越大，频率越高，动画过程越快，动画效果越不明显
 length: 关联的两个对象(view 和 view 或者 view 和 anchorPoint) 动画结束后两者锚点(anchor)之间的距离长度
 frictionTorque: 摩擦力矩，作用暂时不详
 attachmentRange: 作用暂时不详
 */

/// 物理引擎：吸附
class VC_uk_physics_attachment: VC_base {
    
    private lazy var redPointV:UIImageView = UIImageView.ys.create(imgName: "cp_red")
    
    private lazy var bluePointV:UIImageView = UIImageView.ys.create(imgName: "cp_blue")
    
    private lazy var animator:UIDynamicAnimator = UIDynamicAnimator(referenceView: self.view)
    
    override func viewDidLoad(firstTime: Bool) {
        super.viewDidLoad(firstTime: firstTime)
        setupUI()
    }
    
    private func setupUI(){
        view.ys.addSubviews(navBar, redPointV, bluePointV)
        redPointV.snp.makeConstraints { (make) in
            make.top.equalTo(navBar.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
        bluePointV.snp.makeConstraints { (make) in
            make.top.equalTo(redPointV.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        animator.removeAllBehaviors()
        guard let loc = touches.first?.location(in: view) else{ return }
        
        // 重力
        let gravity = UIGravityBehavior(items: [redPointV, bluePointV])
        gravity.gravityDirection = CGVector(dx: 0, dy: 1)
        
        // 刚性吸附
        let attachmentRed = UIAttachmentBehavior(item: redPointV, attachedToAnchor: loc)
        attachmentRed.length = 200
        attachmentRed.damping = 1
        attachmentRed.frequency = 110
        attachmentRed.frictionTorque = 1000
        
        // 弹性吸附
        // 默认是和物体的中心点附着，修改中心点的偏移量，附着左上角
        let size = bluePointV.bounds.size
        let offset = UIOffset(horizontal: -size.width * 0.5, vertical: -size.width * 0.5)
        let attachmentBlue = UIAttachmentBehavior(item: bluePointV, offsetFromCenter: offset, attachedToAnchor: loc)
        attachmentBlue.damping = 0.8
        attachmentRed.frequency = 2.5
        
        animator.addBehavior(gravity)
        animator.addBehavior(attachmentRed)
        animator.addBehavior(attachmentBlue)
    }
}
