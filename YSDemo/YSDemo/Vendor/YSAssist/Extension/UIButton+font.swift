//
//  UIButton+font.swift
//  YSAssist
//
//  Created by yaoshuai on 2021/1/1.
//

import Foundation
import YSKit

// MARK: - UIButton字体扩展

extension YSOriginalObjectProtocol where OriginalObjectType: UIButton{
    
    @discardableResult func font(_ ofSize: CGFloat) -> OriginalObjectType{
        originalObject.titleLabel?.font = UIFont.ys.create(ofSize)
        return originalObject
    }
    
    @discardableResult func font(_ ofSize: CGFloat, type: UIFont.Weight) -> OriginalObjectType{
        originalObject.titleLabel?.font = UIFont.ys.create(ofSize, type: type)
        return originalObject
    }
}
