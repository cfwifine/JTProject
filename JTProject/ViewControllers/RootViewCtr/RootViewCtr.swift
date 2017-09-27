//
//  RootViewCtr.swift
//  JTProject
//
//  Created by comv on 2016/12/21.
//  Copyright © 2016年 comv. All rights reserved.
//


/** 
 
    该类负责整个根视图的切换
 */

import UIKit

class RootViewCtr: BaseViewCtr {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        
        let titles = ["主页","闪屏页","引导页"]
        var lastButton: UIButton?
        for i in 0..<3 {
            let button = CreateControl.createButton(frame: .zero, title: titles[i], bgColor: .orange, titleColor: .white, font: UIFont.systemFont(ofSize: 20))
            button.tag = 200+i
            button.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
            self.view.addSubview(button)
            button.snp.makeConstraints({ (make) in
                make.top.equalTo(self.view).offset(100)
                if let last = lastButton {
                    make.left.equalTo(last.snp.right).offset(10)
                }else {
                    make.left.equalTo(self.view).offset(10)
                }
            })
            lastButton = button
        }
        
        //是否需要重新登录
        if GlobalVar.sharedInfo.sessionID==nil {
            self.switchRootViewToLoginViewCtr()
        }else {
            self.switchRootViewToTabBarViewCtr()
        }
    }
    
    @objc private func buttonClicked(sender: UIButton) {
        if sender.tag==200 {
            self.switchRootViewToTabBarViewCtr()
        }else if sender.tag == 201 {
            self.switchRootViewToSplashViewCtr()
        }else {
            self.switchRootViewToGuidUserViewCtr()
        }
    }
    
    //切到主页
    public func switchRootViewToTabBarViewCtr() {
        let tabBarViewCtr = TabBarViewCtr();
        let naviViewCtr = BaseNaviCtr(rootViewController: tabBarViewCtr)
        let appDelegate = UIApplication.shared.delegate!
        appDelegate.window??.rootViewController = naviViewCtr
    }
    
    //切到闪屏页
    public func switchRootViewToSplashViewCtr() {
        let splashViewCtr = SplashViewCtr()
        let appDelegate = UIApplication.shared.delegate!
        appDelegate.window??.rootViewController = splashViewCtr
    }
    
    //切到引导页
    public func switchRootViewToGuidUserViewCtr() {
        let guidViewCtr = GuidUserViewCtr()
        let appDelegate = UIApplication.shared.delegate!
        appDelegate.window??.rootViewController = guidViewCtr
    }
    
    //切到登录页
    public func switchRootViewToLoginViewCtr() {
        let loginCtr = LoginViewCtr()
        let appDelegate = UIApplication.shared.delegate!
        appDelegate.window??.rootViewController = loginCtr

    }
    
}

