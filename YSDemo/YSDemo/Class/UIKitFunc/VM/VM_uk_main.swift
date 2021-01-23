//
//  VM_uk_main.swift
//  YSDemo
//
//  Created by 姚帅 on 2021/1/23.
//

import Foundation

class VM_uk_main {
    
    private(set) lazy var list:Observable<[SectionModel]> = Observable.just([
        SectionModel(model: "物理引擎", items: [
            M_uk_main(identifier: "id3", title: "物理引擎：重力行为(UIGravityBehavior)"),
            M_uk_main(identifier: "id4", title: "物理引擎：捕获行为(UISnapBehavior)"),
            M_uk_main(identifier: "id5", title: "物理引擎：推动行为(UIPushBehavior)"),
            M_uk_main(identifier: "id6", title: "物理引擎：吸附行为(UIAttachmentBehavior)"),
            M_uk_main(identifier: "id7", title: "物理引擎：碰撞检测(UICollisionBehavior)")
        ]),
        SectionModel(model: "遮罩", items: [
            M_uk_main(identifier: "id2", title: "找美女")
        ])
    ])
    
    //    private(set) lazy var list:Observable<[M_uk_main]> = Observable.just([
    //        HomeM(identifier: "id8", title: "SpriteKit：简单例子"),
    //        HomeM(identifier: "id9", title: "SpriteKit：纹理"),
    //        HomeM(identifier: "id10", title: "SpriteKit：纹理集"),
    //        HomeM(identifier: "id11", title: "SpriteKit：打怪兽")
    //    ])
}
