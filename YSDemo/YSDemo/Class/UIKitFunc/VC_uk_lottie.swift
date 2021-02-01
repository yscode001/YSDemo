//
//  VC_uk_lottie.swift
//  YSDemo
//
//  Created by 姚帅 on 2021/2/1.
//

import Lottie

/// lottie动画
class VC_uk_lottie: VC_base {
    
    private lazy var aniV:AnimationView = AnimationView(filePath: Bundle.main.path(forResource: "lottie-demo2", ofType: "json")!)
    
    override func viewDidLoad(firstTime: Bool) {
        super.viewDidLoad(firstTime: firstTime)
        
        aniV.loopMode = .repeat(100)
        view.addSubview(aniV)
        aniV.snp.makeConstraints { (make) in
            make.center.equalTo(view)
            make.size.equalTo(CGSize(width: 200, height: 200))
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        aniV.play()
    }
}
