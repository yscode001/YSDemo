//
//  Color.swift
//  YSDemo
//
//  Created by 姚帅 on 2021/1/23.
//

class Color {
    
    static var _333333:UIColor{ return UIColor.ys.create(hex: 0x333333) }
    static var _666666:UIColor{ return UIColor.ys.create(hex: 0x666666) }
    static var _999999:UIColor{ return UIColor.ys.create(hex: 0x999999) }
    
    static var _f5f5f5:UIColor{ return UIColor.ys.create(hex: 0xf5f5f5) }
    static var _eeeeee:UIColor{ return UIColor.ys.create(hex: 0xeeeeee) }
    
    static var _000000:UIColor{ return UIColor.ys.create(hex: 0x000000) }
    static var _ffffff:UIColor{ return UIColor.ys.create(hex: 0xffffff) }
    
    static var _7d7d7d:UIColor{ return UIColor.ys.create(hex: 0x7d7d7d) }
    static var _3c69e6:UIColor{ return UIColor.ys.create(hex: 0x3c69e6) }
}

extension Color{
    
    /// 常用背景(浅灰)
    static var background:UIColor{ return UIColor.ys.create(hex: 0xf5f5f5) }
    
    /// 遮罩背景
    static var mask:UIColor{ return UIColor.ys.create(hex: 0x000000, alpha: 0.5) }
    
    /// 分割线
    static var separator:UIColor{ return UIColor.ys.create(hex: 0xeeeeee) }
}
