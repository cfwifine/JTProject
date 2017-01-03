//
//  DefaultValueConstant.swift
//  JTProject
//
//  Created by comv on 2016/12/22.
//  Copyright © 2016年 comv. All rights reserved.
//

/**
    保存项目中的一些常量值
 */


///网络请求默认参数
public let loadForm = "1000299"
public let version  = "46"
public var systerm: String {
   return UIDevice.current.systemVersion
}
public var uuid: String {
    return (UIDevice.current.identifierForVendor?.uuidString)!
}



///屏幕适配相关
import UIKit

public let pFont = getScaleProption(type: .font)
public let pSize = getScaleProption(type: .size)

private enum ScaleType {
    case size
    case font
}

private func getScaleProption(type: ScaleType)-> CGFloat{
    var scale = 1.0
    if type==ScaleType.font {
        switch kScreenWidth {
        case 320:
            scale = 1.000
            break
        case 375:
            scale = 1.1
            break
        case 414:
            scale = 1.125
            break
        default:
            scale = 1.000
            break
        }
    }else if type==ScaleType.size {
        switch kScreenWidth {
        case 320:
            scale = 1.000
            break
        case 375:
            scale = 375/320
            break
        case 414:
            scale = 414/320
            break
        default:
            scale = 1.000
            break
        }
    }
    
    return CGFloat(scale)
}
