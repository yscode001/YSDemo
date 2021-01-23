//
//  TabC.swift
//  YSDemo
//
//  Created by 姚帅 on 2021/1/23.
//

class TabC: UITabBarController {
    
    private lazy var ukMainVC:VC_uk_main = VC_uk_main()
    private lazy var skMainVC:VC_sk_main = VC_sk_main()
    private lazy var scnMainVC:VC_scn_main = VC_scn_main()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildVC()
    }
    
    private func setupChildVC(){
        addChildVC(title: "UIKit", iconImgName: "tabbar_home", chindVC: ukMainVC)
        addChildVC(title: "SpriteKit", iconImgName: "tabbar_msg", chindVC: skMainVC)
        addChildVC(title: "SceneKit", iconImgName: "tabbar_data", chindVC: scnMainVC)
    }
    
    private func addChildVC(title: String, iconImgName: String, chindVC: UIViewController){
        chindVC.tabBarItem.title = title
        chindVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Color._7d7d7d], for: .normal)
        chindVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Color._3c69e6], for: .selected)
        
        // image
        chindVC.tabBarItem.image = UIImage(named: iconImgName)?.withRenderingMode(.alwaysOriginal)
        chindVC.tabBarItem.selectedImage = UIImage(named: iconImgName + "_sel")?.withRenderingMode(.alwaysOriginal)
        
        // 偏移量
        if #available(iOS 13.0, *) {
            
        } else{
            chindVC.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
        }
        
        addChild(YSNavC.ys.create(allowNavEdgeGesture: true, rootVC: chindVC))
    }
}
