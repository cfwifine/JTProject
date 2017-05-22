//
//  SaveData.swift
//  JTProject
//
//  Created by comv on 2017/1/3.
//  Copyright © 2017年 comv. All rights reserved.
//

import UIKit

class SaveData: NSObject {

}

//MARK: ///plist保存
extension SaveData {
    class func saveToDefault(data: Dictionary<String, Any>) {
        let defaults = UserDefaults.standard
        for (key, value) in data {
            defaults .setValue(value, forKey: key)
        }
    }
    
    class func getDataFromDefault(keys: Array<String>) -> Dictionary<String, Any>? {
        let defaults = UserDefaults.standard
        var result = Dictionary<String, Any>()
        for (_, key) in keys.enumerated() {
            let value = defaults.value(forKey: key)
            print("value::::::\(value), key:::::\(key)")
            result[key] = value
        }
        return result
    }
}

//MARK: ///Archive保存
extension SaveData {
    
}

//MARK: ///数据库保存
extension SaveData {

}
