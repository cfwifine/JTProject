//
//  UrlConstant.swift
//  JTProject
//
//  Created by comv on 2016/12/22.
//  Copyright © 2016年 comv. All rights reserved.
//


/**
    项目的url
 */

///url处理中文编码
private func operationUrl(withUrl url: String) -> String {
    let desUrl = (baseUrl+url).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    return desUrl!
}

//public let baseUrl         = "http://comvee.3322.org:8888/health/mobile/"
//private let baseUrl         = "http://192.168.20.77:8080/health/mobile/"
private let baseUrl         = "http://comvee.3322.org:8888/healthNew/mobile/"

public let loginUrl        = operationUrl(withUrl:"user/login")
public let recomendUrl     = operationUrl(withUrl:"index/loadIndexHotList")
public let sugarUrl        = operationUrl(withUrl:"index/member")

