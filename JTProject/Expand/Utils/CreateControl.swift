//
//  CreateControl.swift
//  JTProject
//
//  Created by comv on 2016/12/23.
//  Copyright © 2016年 comv. All rights reserved.
//

import UIKit

public class CreateControl: NSObject {
    
    public class func createTextFiled(frame:CGRect, placeholder:String="请输入", textColor:UIColor=UIColor.black, bgColor:UIColor=UIColor.clear,font:UIFont=UIFont.systemFont(ofSize: 16)) ->UITextField {
        
        let textFiled             = UITextField(frame: frame)
        textFiled.placeholder     = placeholder
        textFiled.textColor       = textColor
        textFiled.backgroundColor = bgColor
        textFiled.font            = font
        return textFiled
    }
    
    public class func createButton(frame:CGRect, title:String="", bgColor:UIColor=UIColor.cyan, titleColor:UIColor=UIColor.white, font:UIFont=UIFont.systemFont(ofSize: 16)) ->UIButton {
        
        let button = UIButton(frame: frame)
        button.setTitle(title, for: .normal)
        button.backgroundColor = bgColor
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = font
        return button
    }
    
    public class func createLabel(frame:CGRect, text:String="title", bgColor:UIColor=UIColor.white, textColor:UIColor=UIColor.black, font:UIFont=UIFont.systemFont(ofSize: 16)) ->UILabel {
        
        let label = UILabel(frame: frame)
        label.text = text
        label.backgroundColor = bgColor
        label.textColor = textColor
        label.font = font
        return label
    }
    
    public class func createView(frame:CGRect, bgColor:UIColor=UIColor.cyan) ->UIView {
        
        let view = UIView(frame: frame)
        view.backgroundColor = bgColor
        return view
    }
    
    public class func createCorneRadius(view:UIView, radius:CGFloat=10.0, borderWidth:CGFloat=0.0, borderColor:UIColor=UIColor.clear) {
        view.layer.cornerRadius = radius
        view.layer.borderColor = borderColor.cgColor
        view.layer.borderWidth = borderWidth
        view.layer.masksToBounds = true
    }
    

    
    
}
