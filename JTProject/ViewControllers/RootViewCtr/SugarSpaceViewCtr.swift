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
        self.tabBarController?.navigationItem.title = "糖人街"
        
    }
    
    public enum AFError {
        public enum AFSubError1 {
            
        }
        
        public enum AFSubError2 {
        
        }
        
        public enum AFSubError3 {
        
        }
    }
    
}

