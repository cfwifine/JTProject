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
        
        let values = GlobalVar.sharedInfo.readValueFromPlist(keys: ["sessionMemberID","sessionID"])
        GlobalVar.sharedInfo.sessionMemberID = values["sessionMemberID"] as! String?
        GlobalVar.sharedInfo.sessionID       = values["sessionID"] as! String?
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = rootViewCtr
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}
}

