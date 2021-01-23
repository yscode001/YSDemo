//
//  M_uk_main.swift
//  YSDemo
//
//  Created by 姚帅 on 2021/1/23.
//

class M_uk_main{
    
    private(set) lazy var identifier: String = ""
    
    private(set) lazy var title: String = ""
    
    private init() {}
    
    convenience init(identifier: String, title: String) {
        self.init()
        self.identifier = identifier
        self.title = title
    }
}
