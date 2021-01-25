//
//  VC_base.swift
//  YSDemo
//
//  Created by 姚帅 on 2021/1/23.
//

class VC_base: YSBaseVC {
    
    private(set) lazy var navBar:YSNavBar = YSNavBar.ys.create().ys.then{
        $0.ys.setupNavBGView(setup: { [weak self] (bgv) in
            guard let `self` = self else{ return }
            bgv.backgroundColor = self.view.backgroundColor
        })
        $0.ys.setupNavBar(setup: { [weak self] (bar) in
            guard let `self` = self else{ return }
            bar.setBackgroundImage(UIImage.ys.create(color: self.view.backgroundColor ?? Color.background, size: CGSize(width: 10, height: 10)), for: .default)
        })
        $0.ys.setupNavItem(setup: { [weak self] (item) in
            guard let `self` = self else{ return }
            item.leftBarButtonItem = UIBarButtonItem.ys.create(alignment: .left, style: .image, content: UIBarButtonItemContent.ys.create(imageName: "nav_back", title: "", titleColor: .clear), target: self, action: #selector(self.popAction))
        })
    }
    
    private(set) lazy var disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad(firstTime: Bool) {
        super.viewDidLoad(firstTime: firstTime)
        setupUI()
    }
    
    private func setupUI(){
        view.backgroundColor = Color.background
    }
    
    deinit {
        Tool_print.print("VC-deinit：\(description)")
    }
}

extension VC_base{
    
    /// pop
    @objc func popAction(){
        ys.pop(animated: true)
    }
    
    /// dismiss
    @objc func dismissAction(){
        dismiss(animated: true, completion: nil)
    }
}
