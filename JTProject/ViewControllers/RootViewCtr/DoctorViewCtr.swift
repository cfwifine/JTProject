//
//  DoctorViewCtr.swift
//  JTProject
//
//  Created by comv on 2016/12/21.
//  Copyright © 2016年 comv. All rights reserved.
//

/**
    医生主页
 */

import UIKit

class DoctorViewCtr: BaseViewCtr {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "医生"
        
        let webView = UIWebView(frame: self.view.bounds)
        let request = URLRequest(url: NSURL(string: "http://www.baidu.com") as! URL)
        webView.loadRequest(request)
        self.view.addSubview(webView)
    }
}

extension DoctorViewCtr {
    private func testEnum() {
        //枚举嵌套
        enum BigCompany {
            case Google
            enum Apple {
                case iphone
                case ipad
                case appwatch
                
                func introduce()->String {
                    switch self {
                    case .iphone:
                        return "2007"
                    case .ipad:
                        return "2010"
                    case .appwatch:
                        return "2012"
                    }
                }
            }
        }
        let des = BigCompany.Apple.introduce(.appwatch)
        print(des)
        
        
        //枚举关联值
        enum Trade {
            case Buy(stock: String, amount: Int)
            case Sell(stock: String, amount: Int)
        }
        let trade1 = Trade.Buy(stock: "APPLE", amount: 500)
        let trade2 = Trade.Sell(stock: "Google", amount: 600)
        if case let Trade.Buy(apprent, count) = trade1 {
            print("type:Buy, apprent:\(apprent), count:\(count)")
        }
        if case let Trade.Sell(apprent, count) = trade2 {
            print("type:Sell, apprent:\(apprent), count:\(count)")
        }
        
        //增加计算属性
        enum Device {
            case iphone, ipad
            var year: Int {
                switch self {
                case .iphone:
                    return 2007
                case .ipad:
                    return 2010
                }
            }
            
            //静态方法
            static func fromeSlang(term: String) -> Device? {
                if term=="iphon" {
                    return .iphone
                }else {
                    return nil
                }
            }
        }
        
        let year = Device.iphone.year
        print("year:\(year)")
        
        if let result = Device.fromeSlang(term: "iphon") {
            print(result)
        }
        
        
        ///协议
        enum Car: CustomStringConvertible {
            case BMW
            case Audi
            
            var description: String {
                switch self {
                case .BMW:
                    return "I am BMW"
                case .Audi:
                    return "I an Audi"
                }
            }
        }
        let car = Car.BMW
        print("car type:\(car)")
        
    }

}

