//
//  GlobalVar.swift
//  JTProject
//
//  Created by comv on 2016/12/22.
//  Copyright © 2016年 comv. All rights reserved.
//

/**
    用单例来共享数据，用来保存全局变量，也可用来传值
 */

import Foundation

class GlobalVar {
    var refreshHomePage: Bool = false
    
    var sessionID: String?
    var sessionMemberID: String?
    var memberID: String?
    
    static let sharedInfo = GlobalVar()
    //初始化一些值
    private init() {
        
    }
}
