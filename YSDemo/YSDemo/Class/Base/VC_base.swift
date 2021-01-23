//
//  VC_base.swift
//  YSDemo
//
//  Created by 姚帅 on 2021/1/23.
//

class VC_base: YSBaseVC {
    
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
