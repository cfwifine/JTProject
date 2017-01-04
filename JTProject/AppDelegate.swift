//
//  AppDelegate.swift
//  JTProject
//
//  Created by comv on 2016/12/21.
//  Copyright © 2016年 comv. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let rootViewCtr: RootViewCtr = RootViewCtr()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        //全局session赋值
        let loginObj = LoginUserObj().getUserObj()
        GlobalVar.sharedInfo.sessionID       = loginObj.sessionID
        GlobalVar.sharedInfo.sessionMemberID = loginObj.sessionMemberID
        GlobalVar.sharedInfo.memberID        = loginObj.memberID
        
        self.window?.rootViewController = rootViewCtr
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}
}

