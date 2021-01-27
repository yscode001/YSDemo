//
//  VM_sk_main.swift
//  YSDemo
//
//  Created by yaoshuai on 2021/1/24.
//

class VM_sk_main {
    
    private(set) lazy var list:Observable<[SectionModel]> = Observable.just([
        SectionModel(model: "SKAction", items: [
            M_sk_main(identifier: "id1-1", title: "位置动作"),
            M_sk_main(identifier: "id1-2", title: "纹理集"),
            M_sk_main(identifier: "id1-3", title: "转场")
        ]),
        SectionModel(model: "SKPhysics", items: [
            M_sk_main(identifier: "id2-1", title: "物理世界")
        ]),
        SectionModel(model: "Game", items: [
            M_sk_main(identifier: "id3-1", title: "打怪兽")
        ]),
        SectionModel(model: "Node节点", items: [
            M_sk_main(identifier: "id4-1", title: "相机"),
            M_sk_main(identifier: "id4-2", title: "光照")
        ])
    ])
}
