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
<<<<<<< HEAD
    
    func saveValueToPlist(param: Dictionary<String, Any>) {
        for (key, value) in param {
            SaveData.saveToDefault(key: key, data: value)
        }
    }
    
    func readValueFromPlist(keys: Array<String>) -> Dictionary<String, Any> {
        var resultDict = Dictionary<String, Any>()
        for key in keys {
            let data = SaveData.getDataFromDefault(key: key)
            resultDict[key] = data
        }
        return resultDict
    }
=======
>>>>>>> f98437913bb009e970cc3720ace378d03c6c8bc9
}
