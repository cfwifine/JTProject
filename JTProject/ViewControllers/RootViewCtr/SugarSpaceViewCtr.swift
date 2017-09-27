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
        self.tabBarController?.title = "糖人街"
        
        let block = {() in
            print(Thread.current)
        }
        DispatchQueue.main.async {
            block()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.title = "糖人街"
    }
}
