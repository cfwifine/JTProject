//
//  DictionaryExtention.swift
//  JTProject
//
//  Created by comv on 2016/12/27.
//  Copyright © 2016年 comv. All rights reserved.
//

import UIKit

public extension Dictionary{
    static func += <KeyType, ValueType> ( left: inout Dictionary<KeyType, ValueType>, right: Dictionary<KeyType, ValueType>) {
        for (k, v) in right {
            left.updateValue(v, forKey: k)
        }
    }
}
