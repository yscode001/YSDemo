//
//  Cell_uk_main.swift
//  YSDemo
//
//  Created by 姚帅 on 2021/1/23.
//

class Cell_uk_main: YSBaseCell_tbv_default{
    
    func setupData(model: M_uk_main){
        textLabel?.text = model.title
    }
}
