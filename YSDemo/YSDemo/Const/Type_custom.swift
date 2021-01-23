//
//  Type_custom.swift
//  YSDemo
//
//  Created by 姚帅 on 2021/1/23.
//

/// 性别
enum Type_gender: Int {
    
    /// 女0
    case female = 0
    
    /// 男1，默认
    case male = 1
    
    static func get(value: Int) -> Type_gender{
        return value == 0 ? .female : .male
    }
}
