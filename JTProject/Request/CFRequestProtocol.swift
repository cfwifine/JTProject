//
//  CFRequestProtocol.swift
//  JTProject
//
//  Created by comv on 2016/12/27.
//  Copyright © 2016年 comv. All rights reserved.
//

import UIKit

protocol CFRequestProtocol {
    func requestSuccess(key: String, data: [String: Any]);
    func requestFailure(key: String, error: Error);
}
