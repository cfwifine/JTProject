//
//  LoginUserObj.swift
//  JTProject
//
//  Created by comv on 2017/1/4.
//  Copyright © 2017年 comv. All rights reserved.
//

import UIKit

class LoginUserObj {
    var sessionID: String?
    var sessionMemberID: String?
    var memberID: String?
    var isLogin: Bool = false
    
    func operationData(data: Dictionary<String, Any>) {
        //这里赋值
        let body     = data["body"] as! Dictionary<String, Any>
        let memberID = (body["member"] as! Dictionary<String, Any>)["memberId"]
        
        self.memberID        = "\(memberID)"
        self.sessionID       = "\(data["sessionID"])"
        self.sessionMemberID = "\(data["sessionMemberID"])"
        
        //全局赋值
        GlobalVar.sharedInfo.sessionMemberID = self.sessionMemberID
        GlobalVar.sharedInfo.sessionID       = self.sessionID
        GlobalVar.sharedInfo.memberID        = self.memberID
        
        //保存数据
        self.saveUserObj(obj: self)
    }
    
    ///保存登录数据
    func saveUserObj(obj: LoginUserObj) {
        SaveData.saveToDefault(data:["sessionID":obj.sessionID ?? "",
                                     "sessionMemberID":obj.sessionMemberID ?? "",
                                     "memberID":obj.memberID ?? "",
                                     ])
    }
    
    ///读取登录数据
    func getUserObj() ->LoginUserObj {
        let obj = LoginUserObj()
        if let result = SaveData.getDataFromDefault(keys: ["sessionID",
                                                           "sessionMemberID",
                                                           "memberID"]) {
            obj.sessionID       = result["sessionID"] as! String?
            obj.sessionMemberID = result["sessionMemberID"] as! String?
            obj.memberID        = result["memberID"] as! String?
        }
        return obj
    }
}
