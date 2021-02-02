//
//  VC_uk_present.swift
//  YSDemo
//
//  Created by 姚帅 on 2021/2/2.
//

/// 连续present测试
class VC_uk_present: VC_base{
    
    private lazy var presentBtn:UIButton = UIButton.ys.create(titlec: .black, title: "Present", target: self, action: #selector(presentBtnClick))
    
    private lazy var dismissBtn:UIButton = UIButton.ys.create(titlec: .black, title: "Dismiss", target: self, action: #selector(dismissBtnClick))
    
    override func viewDidLoad(firstTime: Bool) {
        super.viewDidLoad(firstTime: firstTime)
        setupUI()
    }
    
    private func setupUI(){
        view.ys.addSubviews(presentBtn, dismissBtn)
        presentBtn.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 100, height: 40))
        }
        dismissBtn.snp.makeConstraints { (make) in
            make.top.equalTo(presentBtn.snp.bottom).offset(15)
            make.centerX.size.equalTo(presentBtn)
        }
    }
}

extension VC_uk_present{
    
    @objc private func presentBtnClick(){
        present(VC_uk_present(), animated: true, completion: nil)
    }
    
    @objc private func dismissBtnClick(){
        dismiss(animated: true, completion: nil)
    }
}
