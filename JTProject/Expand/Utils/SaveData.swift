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
    class func saveToDefault(key: String, data: Any) {
        let defaults = UserDefaults.standard
        defaults.set(data, forKey: key)
    }
    
    class func getDataFromDefault(key: String) -> Any {
        let defaults = UserDefaults.standard
        let data = defaults.object(forKey: key)
        return data ?? ""
    }
}

//MARK: ///Archive保存
extension SaveData {
    
}

//MARK: ///数据库保存
extension SaveData {

}
