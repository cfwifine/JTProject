//
//  SugarSpaceViewCtr.swift
//  JTProject
//
//  Created by comv on 2016/12/21.
//  Copyright © 2016年 comv. All rights reserved.
//

/**
 糖人街主页
 */

import UIKit

class SugarSpaceViewCtr: BaseViewCtr {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purple
<<<<<<< HEAD
        self.tabBarController?.title = "糖人街"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.title = "糖人街"
=======
        self.tabBarController?.navigationItem.title = "糖人街"
     
//        
//        let dic1 = ["name":"James", "age":"30"]
//        var dic2 = ["address":"America", "work":"NBA"]
//        dic2+=dic1
>>>>>>> f98437913bb009e970cc3720ace378d03c6c8bc9
    }
}
