//
//  M_sk_main.swift
//  YSDemo
//
//  Created by yaoshuai on 2021/1/24.
//

class M_sk_main {
    
    private(set) lazy var identifier: String = ""
    
    private(set) lazy var title: String = ""
    
    private init() {}
    
    convenience init(identifier: String, title: String) {
        self.init()
        self.identifier = identifier
        self.title = title
    }
}
