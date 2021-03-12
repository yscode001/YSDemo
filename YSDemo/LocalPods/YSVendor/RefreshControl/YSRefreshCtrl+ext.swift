//
//  YSRefreshCtrl+ext.swift
//  YSAssist
//
//  Created by yaoshuai on 2021/1/1.
//

import Foundation
import YSKit

// MARK: - 创建刷新控件对象

public extension YSOriginalObjectProtocol where OriginalObjectType == YSRefreshCtrl{
    
    /// 创建只有下拉刷新
    static func create(pulldown: @escaping(() -> ())) -> YSRefreshCtrl{
        return YSRefreshCtrl(pulldownClosure: pulldown)
    }
    
    /// 创建下拉刷新和上拉加载
    static func create(pulldown: @escaping(() -> ()), pullup: @escaping(() -> ())) -> YSRefreshCtrl{
        return YSRefreshCtrl(pulldownClosure: pulldown, pullupClosure: pullup)
    }
}

// MARK: - 扩展属性

public extension YSOriginalObjectProtocol where OriginalObjectType == YSRefreshCtrl{
    
    /// 是否正在下拉刷新
    var isPulldownRefreshing:Bool{
        return originalObject.pulldownV.isRefreshing
    }
    
    /// 是否正在上拉加载
    var isPullupRefreshing:Bool{
        return originalObject.pullupV.isRefreshing
    }
}

// MARK: - 设置给tableView

public extension YSOriginalObjectProtocol where OriginalObjectType == YSRefreshCtrl{
    
    /// 把刷新控件设置给tableView
    func setupToTableView(tbv: UITableView){
        if originalObject.settedPullUpV{
            tbv.mj_header = originalObject.pulldownV
            tbv.mj_footer = originalObject.pullupV
        } else{
            tbv.mj_header = originalObject.pulldownV
        }
    }
}

public extension YSOriginalObjectProtocol where OriginalObjectType: UITableView{
    
    /// 设置刷新控件
    @discardableResult func setupRefreshCtrl(ctrl: YSRefreshCtrl) -> OriginalObjectType{
        ctrl.ys.setupToTableView(tbv: originalObject)
        return originalObject
    }
}

// MARK: - 自动刷新、结束刷新
public extension YSOriginalObjectProtocol where OriginalObjectType == YSRefreshCtrl{
    
    /// 自动刷新
    func autoPulldownRefresh(){
        if originalObject.pullupV.isRefreshing{
            originalObject.pulldownV.endRefreshing()
            return
        }
        originalObject.pulldownV.beginRefreshing()
    }
    
    /// 结束刷新
    func endRefresh(pulldown: Bool, hasMore: Bool = false){
        if pulldown{
            originalObject.pulldownV.endRefreshing()
        } else{
            if originalObject.settedPullUpV{
                if hasMore{
                    originalObject.pullupV.endRefreshing()
                } else{
                    originalObject.pullupV.endRefreshingWithNoMoreData()
                }
            }
        }
    }
}

// MARK: - 设置标题
public extension YSOriginalObjectProtocol where OriginalObjectType == YSRefreshCtrl{
    
    /// 设置标题属性
    func setupData(title: YSRefreshTitleInfo){
        originalObject.setupData(title: title)
    }
    
    /// 设置标题样式
    func setupData(style: YSRefreshStyle){
        originalObject.setupData(style: style)
    }
}
