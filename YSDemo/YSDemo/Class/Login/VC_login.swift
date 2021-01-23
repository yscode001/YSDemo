//
//  VC_login.swift
//  YSDemo
//
//  Created by 姚帅 on 2021/1/23.
//

class VC_login: VC_base {
    
    private lazy var bgImgV:UIImageView = UIImageView.ys.create(fileName: "login_bg").ys.then{
        // 重力视觉差(场景：背景图随手机方向而滑动)
        
        // x轴偏移
        let effectx = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        effectx.maximumRelativeValue = 150
        effectx.minimumRelativeValue = -150
        
        // y轴偏移
        let effecty = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        effecty.maximumRelativeValue = 150
        effecty.minimumRelativeValue = -150
        
        // 添加偏移量
        $0.addMotionEffect(effectx)
        $0.addMotionEffect(effecty)
    }
    
    private lazy var loginBtn:UIButton = UIButton.ys.create(titlec: .white, title: "登 录", target: self, action: #selector(loginBtnClick)).ys.then{
        $0.setBackgroundImage(UIImage.ys.create("btn_bg1"), for: .normal)
    }
    
    override func viewDidLoad(firstTime: Bool) {
        super.viewDidLoad(firstTime: firstTime)
        setupUI()
    }
    
    private func setupUI(){
        view.ys.addSubviews(bgImgV, loginBtn)
        bgImgV.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: -150, left: -150, bottom: -150, right: -150))
        }
        loginBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(-120)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(40)
        }
    }
    
    @objc private func loginBtnClick(){
        CurrentUser.shared.login { [weak self] in
            guard let _ = self else{ return }
            UIApplication.ys.keyWindowSwitchRootVC(TabC())
        }
    }
}
