//
//  UIFont+ext.swift
//  YSAssist
//
//  Created by yaoshuai on 2021/1/1.
//

import Foundation
import YSKit

extension YSOriginalObjectProtocol where OriginalObjectType == UIFont{
    
    static func create(_ ofSize: CGFloat) -> UIFont{
        return UIFont.systemFont(ofSize: ofSize)
    }
    
    static func create(_ ofSize: CGFloat, type: UIFont.Weight) -> UIFont{
        return UIFont.systemFont(ofSize: ofSize, weight: type)
    }
}
