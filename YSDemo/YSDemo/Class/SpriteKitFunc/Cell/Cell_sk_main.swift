//
//  Cell_sk_main.swift
//  YSDemo
//
//  Created by yaoshuai on 2021/1/24.
//

class Cell_sk_main: YSBaseCell_tbv_default {
   
    func setupData(model: M_sk_main){
        textLabel?.text = model.title
    }
}
