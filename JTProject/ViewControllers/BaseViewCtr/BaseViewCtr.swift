//
//  BaseViewCtr.swift
//  JTProject
//
//  Created by comv on 2016/12/21.
//  Copyright © 2016年 comv. All rights reserved.
//

import UIKit

class BaseViewCtr: UIViewController {
    
    var code: String?
    var desc: String?
    var shouldPresent: Bool = true //防止多次弹出登录页面

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        print("deinit: \(type(of: self))")
    }

}

extension BaseViewCtr: CFRequestProtocol {
    func requestFailure(key: String, error: Error) {}
    
    func requestSuccess(key: String, data: [String : Any]) {
        code = (data["res_msg"] as! Dictionary<String,String>)["res_code"]
        desc = (data["res_msg"] as! Dictionary<String,String>)["res_desc"]
        if code=="200000" { //重新登录
            if !shouldPresent {
                return
            }
            shouldPresent = false
            let loginCtr = LoginViewCtr()
            self.present(loginCtr, animated: true, completion: nil)
            BannerView().show(des: desc)
            return
        }
        
        if !(code == "0000") {
            BannerView().show(des: desc)
            return
        }
    }
}
