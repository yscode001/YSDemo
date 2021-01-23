//
//  UICollectionView+placeholder.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/24.
//

import Foundation

private extension UICollectionView{
    
    func hasItem() -> Bool{
        for section in 0..<self.numberOfSections{
            if self.numberOfItems(inSection: section) > 0{
                return true
            }
        }
        return false
    }
}

// MARK: - 决定placeholderView是否显示

extension YSOriginalObjectProtocol where OriginalObjectType: UICollectionView{
    
    /// 如果无数据显示某种类型的placeholderView，有数据隐藏所有的placeholderView
    public func placeholder_show_ifHasNoData(type: YSPlaceholderType){
        DispatchQueue.main.async { [weak originalObject] in
            guard let originalView = originalObject else{ return }
            if originalView.hasItem(){
                placeholder_hide()
            } else{
                placeholder_show(type: type)
            }
        }
    }
}
