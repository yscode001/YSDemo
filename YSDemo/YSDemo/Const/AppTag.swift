//
//  AppTag.swift
//  YSDemo
//
//  Created by 姚帅 on 2021/1/23.
//

/// App标签
class AppTag{
    
    /// 运行环境
    static var env:Type_env{
        return .develop
    }
    
    /// 是否是测试环境
    static var isDevelop:Bool{
        return env == .develop
    }
    
    /// 是否是正式环境
    static var isAdHoc:Bool{
        return env == .adhoc
    }
    
    /// 是否是线上环境
    static var isAppStore:Bool{
        return env == .appStore
    }
}
