//
//  VM_sk_main.swift
//  YSDemo
//
//  Created by yaoshuai on 2021/1/24.
//

class VM_sk_main {
    
    private(set) lazy var list:Observable<[SectionModel]> = Observable.just([
        SectionModel(model: "SKAction", items: [
            M_sk_main(identifier: "id1-1", title: "平移、缩放、旋转"),
            M_sk_main(identifier: "id1-2", title: "纹理集")
        ])
    ])
}
