//
//  CFClient.swift
//  JTProject
//
//  Created by comv on 2016/12/28.
//  Copyright © 2016年 comv. All rights reserved.
//

import UIKit

class CFClient {
    static let shared = CFClient()
    
    ///保存所有的delegate,防止回调漏掉
    public var delegates = Dictionary<String,Any>()
    
    ///单例
    let request: CFRequest
    private init() {
        request = CFRequest()
    }
    
    ///取消请求,key==nil,全部取消
    public func cancelRequest(withKey key: String?) {
        if let _ = key {
            request.cancelRequest(key: key!)
        }else {
            request.cancleAllRequest()
        }
    }
    
    ///拼接默认参数
    fileprivate func addDefaultParams(desParam: [String: Any]?) ->[String: Any] {
        let now = Date()
        let cal = Calendar.current
        let dc = cal.dateComponents([.year,.month,.day,.hour,.minute,.second], from: now)
        let value = arc4random()%1000000
        let req_num = "\(dc.year)\(dc.month)\(dc.day)\(dc.hour)\(dc.minute)\(dc.second)\(value)"
        let valid = req_num+"comveeiPhone"
        
        var parameters:Dictionary<String, Any> = [
            "dev_type"       : "iphone",
            "join_id"        : "comveeiPhone",
            "loadFrom"       : loadForm,
            "req_num"        : req_num,
//                        "sessionID"      : GlobalVar.sharedInfo.sessionID!,
//                        "sessionMemberID": GlobalVar.sharedInfo.sessionMemberID!,
            "sessionID"      : "0833e0d18f4f417e45811824e570018f",
            "sessionMemberID": "0833e0d18f4f417e0b06905d7fa08459",
            "sys"            : systerm,
            "ver"            : version,
            "dev"            : uuid,
            "valid"          : valid.md5()
        ]
 
//        if let sessionID = GlobalVar.sharedInfo.sessionID {
//            parameters.updateValue(sessionID, forKey: "sessionID")
//        }
//        if let sessionMemberID = GlobalVar.sharedInfo.sessionMemberID {
//            parameters.updateValue(sessionMemberID, forKey: "sessionMemberID")
//        }
        
        if let addParams = desParam {
            for (key, value) in addParams {
                parameters.updateValue(value, forKey: key)
            }
        }
        return parameters
    }
}

extension CFClient: CFRequestDelegate {
    func requestSuccess(request: CFRequest, key: String, data: [String : Any]) {
//        print("\n##############URL#############\n\(key)"+"\n############ResultData#########\n\(data)")
        
        //回调成功后从delegates移除
        if let desDlegate = delegates.removeValue(forKey: key){
            (desDlegate as! CFRequestProtocol).requestSuccess(key: key, data: data)
        }
<<<<<<< HEAD
        print("\n##############URL#############\n\(key)"+"\n############ResultData#########\n\(data)")
        
//        print("\n##############URL#############\n\(key)"+"\n############ResultJSonString#########\n\(self.toJSONString(dict: data))")
=======
>>>>>>> f98437913bb009e970cc3720ace378d03c6c8bc9
    }
    
    func requestFailure(request: CFRequest, key: String, error: Error) {
//        print("\n###############URL#############\n\(key)"+"\nError:###########Error##########\n\(error.localizedDescription)")
        
        if let desDlegate = delegates.removeValue(forKey: key){
            (desDlegate as! CFRequestProtocol).requestFailure(key: key, error: error)
        }
    }
    
    func toJSONString(dict:Dictionary<String, Any>)->NSString{
        let data = try?JSONSerialization.data(withJSONObject: dict, options: [])
        let strJson=NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
        return strJson!
    }
}

//MARK: /////////////登录、注册等接口
extension CFClient {
    ///登录
    func loginClient(params: [String: Any], delegate: CFRequestProtocol?) {
        delegates[loginUrl] = delegate
        let _ = CFRequest().request(url: loginUrl, requstType: .post, params: self.addDefaultParams(desParam: params), dlt: self)
    }
    
    ///注册
    func registerClient(params: [String: Any], delegate: CFRequestProtocol?) {
        
    }
    
    
    ///闪屏页
    public func splashClient() {
        
    }
}

//MARK: /////////////首页接口
extension CFClient {
    //推荐阅读
    public func recomendPaper(params: [String : Any], delegate: CFRequestProtocol?) {
        delegates[recomendUrl] = delegate
        let _ = CFRequest().request(url: recomendUrl, requstType: .post, params: self.addDefaultParams(desParam: params), dlt: self)
    }
    
    //血糖数据
    public func sugarData(delegate: CFRequestProtocol?) {
        delegates[sugarUrl] = delegate
        let _ = CFRequest().request(url: sugarUrl, requstType: .post, params: self.addDefaultParams(desParam: nil), dlt: self)
    }
}

//MARK: /////////////医生模块接口
extension CFClient {
    
}

//MARK: /////////////个人中心模块接口
extension CFClient {
    
    
}

//MARK: /////////////商城模块接口
extension CFClient {
    
    
}
