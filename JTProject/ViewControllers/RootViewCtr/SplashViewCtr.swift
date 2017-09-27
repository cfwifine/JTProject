//
//  SplashViewCtr.swift
//  JTProject
//
//  Created by comv on 2016/12/21.
//  Copyright © 2016年 comv. All rights reserved.
//

/**
    闪屏页
 */

import UIKit

class SplashViewCtr: BaseViewCtr {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orange
        
        
    }
    
    struct rect {
        var width: Float = 0
        var height: Float = 0
        var x: Float = 0
        var y: Float = 0
        
        func getMsg() {
            print(width, height, x, y)
        }
    }
    
    let rt = rect(width: 10, height: 20, x: 10, y: 30)
    
}


