//
//  AFError.swift
//  JTProject
//
//  Created by comv on 2017/5/28.
//  Copyright © 2017年 comv. All rights reserved.
//

import UIKit

public enum AFError: Error {
    public enum AFError1 {
        case af1One1
        case af2One2
    }
    
    public enum AFError2 {
        case af2One1
        case af2One2
    }
    
    public enum AFError3 {
    
    }
}

extension AFError.AFError1 {
    var description: String {
        switch self {
        case .af1One1:
            return "af1One1"
        case .af2One2:
            return "af1One2"
        }
    }
}

extension AFError.AFError2 {
    var description: String {
        switch self {
        case .af2One1:
            return "af2One1"
        case .af2One2:
            return "af2One2"
        }
    }
}

public protocol AFErrorProtocol {
    func asError()->Error
}

extension AFErrorProtocol {
    var afError: Error? {
        return asError()
    }
}

