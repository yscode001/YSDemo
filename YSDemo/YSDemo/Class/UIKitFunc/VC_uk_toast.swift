//
//  VC_uk_toast.swift
//  YSDemo
//
//  Created by 姚帅 on 2021/2/2.
//

/// Toast-Swift练习
class VC_uk_toast: VC_base{
    
    private lazy var testBtn:UIButton = UIButton.ys.create(titlec: .black, title: "测 试", target: self, action: #selector(testBtnClick))
    
    private lazy var dismissBtn:UIButton = UIButton.ys.create(titlec: .black, title: "消 失", target: self, action: #selector(dismissBtnClick))
    
    override func viewDidLoad(firstTime: Bool) {
        super.viewDidLoad(firstTime: firstTime)
        setupUI()
    }
    
    private func setupUI(){
        view.ys.addSubviews(testBtn, dismissBtn)
        testBtn.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 100, height: 40))
        }
        dismissBtn.snp.makeConstraints { (make) in
            make.top.equalTo(testBtn.snp.bottom).offset(15)
            make.centerX.size.equalTo(testBtn)
        }
    }
}

extension VC_uk_toast{
    
    @objc private func testBtnClick(){
        view.makeToast("message", duration: 2, position: .center, title: "title", image: UIImage(named: "girl"), style: .init()) { (suc) in
            print(suc)
        }
        
        //        view.makeToast("message", duration: 2, point: CGPoint(x: 100, y: 200), title: "title", image: UIImage(named: "girl"), style: .init()) { (suc) in
        //            print(suc)
        //        }
        
        //        ToastManager.shared.style.activitySize = view.bounds.size
        //        ToastManager.shared.style.activityIndicatorColor = .orange
        //        ToastManager.shared.style.activityBackgroundColor = UIColor.brown.withAlphaComponent(0.8)
        //        view.makeToastActivity(ToastPosition.center)
    }
    
    @objc private func dismissBtnClick(){
        //        view.hideToastActivity()
    }
}
