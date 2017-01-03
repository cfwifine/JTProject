//
//  TabBarViewCtr.swift
//  JTProject
//
//  Created by comv on 2016/12/21.
//  Copyright © 2016年 comv. All rights reserved.
//

import UIKit

class TabBarViewCtr: UITabBarController {

    private let mainViewCtr: MainViewCtr             = MainViewCtr()
    private let doctorViewCtr: DoctorViewCtr         = DoctorViewCtr()
    private let sugarSpaceViewCtr: SugarSpaceViewCtr = SugarSpaceViewCtr()
    private let meViewCtr: MeViewCtr                 = MeViewCtr()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initUI()
    }
    
    private func initUI() {
        self.viewControllers = [mainViewCtr, doctorViewCtr, sugarSpaceViewCtr, meViewCtr]
        let mainItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        mainViewCtr.tabBarItem = mainItem
        
        let doctorItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        doctorViewCtr.tabBarItem = doctorItem
        
        let sugarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
        sugarSpaceViewCtr.tabBarItem = sugarItem
        
        let meItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 3)
        meViewCtr.tabBarItem = meItem
    }
}
