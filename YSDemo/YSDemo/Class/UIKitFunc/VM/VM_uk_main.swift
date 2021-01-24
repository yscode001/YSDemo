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
            M_uk_main(identifier: "id1-1", title: "重力行为(UIGravityBehavior)"),
            M_uk_main(identifier: "id1-2", title: "捕获行为(UISnapBehavior)"),
            M_uk_main(identifier: "id1-3", title: "推动行为(UIPushBehavior)"),
            M_uk_main(identifier: "id1-4", title: "吸附行为(UIAttachmentBehavior)"),
            M_uk_main(identifier: "id1-5", title: "碰撞检测(UICollisionBehavior)")
        ]),
        SectionModel(model: "遮罩", items: [
            M_uk_main(identifier: "id2-1", title: "找美女")
        ])
    ])
}
