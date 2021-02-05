//
//  NetworkManager+AFDemo.swift
//  YSDemo
//
//  Created by 姚帅 on 2021/2/4.
//

import Foundation
import Alamofire

class AFDemo {
    
    static func get(){
        AF.sessionConfiguration.timeoutIntervalForRequest = 15
        AF.sessionConfiguration.timeoutIntervalForResource = 15
        AF.request("").responseJSON { (resp) in
            print(resp)
        }
    }
}
