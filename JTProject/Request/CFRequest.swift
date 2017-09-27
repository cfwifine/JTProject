//
//  CFRequest.swift
//  JTProject
//
//  Created by comv on 2016/12/22.
//  Copyright © 2016年 comv. All rights reserved.
//

import Foundation
import Alamofire

protocol CFRequestDelegate {
    func requestSuccess(request: CFRequest, key: String, data: [String:Any]);
    func requestFailure(request: CFRequest, key: String, error: Error);
}

class CFRequest {
    static let shared = CFRequest()
    
    enum RequestType {
        case post, get
    }
    
    ///delegate
    public var delegate: CFRequestDelegate?
    ///发起的请求
    public var requests: Dictionary<String, Any>?
    
    ///发起请求
    public func request(url: String, requstType: RequestType, params: [String: Any], dlt: CFRequestDelegate) ->Request?{
        assert(url.lengthOfBytes(using: .utf8)>0, "url不能为空!")
        delegate = dlt
        var request: Request!
        if requstType == .post {
            let postRequest = Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.httpBody).responseJSON(completionHandler: {response in
                if let error = response.result.error {
                    self.cancelRequest(key: url)
                    self.protocolSendData(data: error, key: url, success: false)
                }
                if let data = response.result.value {
                    self.cancelRequest(key: url)
                    self.protocolSendData(data: data, key: url, success: true)
//                    let utfText = String(data: response.data!, encoding: .utf8)
//                    print("\n>>>>>>>>>>>>>>>>>>utfText>>>>>>>>>>>>>>>\n\(utfText)")
                }
            })
            request = postRequest
            
        }else if requstType == .get {
            let getRequest = Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.httpBody).responseJSON(completionHandler: {response in
                if let error = response.result.error {
                    print(error.localizedDescription)
                    self.cancelRequest(key: url)
                    self.protocolSendData(data: error, key: url, success: false)
                }
                if let data = response.result.value {
                    print(data)
                    self.cancelRequest(key: url)
                    self.protocolSendData(data: data, key: url, success: true)
                }
            })
            request = getRequest
        }else {return nil}
        requests?[url] = request
        return request
    }
    
    ///取消指定的请求
    public func cancelRequest(key: String) {
        assert(key.lengthOfBytes(using: .utf8)>0, "request key not be nil")
        if let _ = requests?.keys.contains(key) {
            let request = requests?.removeValue(forKey: key) as! Request
            request.cancel()
        }
    }
    
    ///取消全部请求
    public func cancleAllRequest() {
        for(_, value) in requests! {
            let req = value as! Request
            req.cancel()
        }
    }
    
    private func protocolSendData(data: Any, key: String, success: Bool) {
        if success {
            if let dlt = delegate {
                dlt.requestSuccess(request: self, key: key, data: data as! [String : Any])
            }
        }else {
            if let dlt = delegate {
                dlt.requestFailure(request: self, key: key, error: data as! Error)
            }
        }
    }
}



