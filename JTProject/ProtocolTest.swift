//
//  ProtocolTest.swift
//  JTProject
//
//  Created by comv on 2017/4/1.
//  Copyright © 2017年 comv. All rights reserved.
//

import Foundation
import UIKit

protocol Student {
    var name: String{get set}
    var birthPlace: String{get}
    static var qulification: String{get}
}

class XiaoMine: Student {
    
    var age = 10
    var name: String = "小米"
    var birthPlace: String = "北京"
    static var qulification: String = "小学三年级"
    
    init(){
        
    }
    
    init(age: Int, name: String, birthPlace: String, qulification: String) {
        self.age = age
        self.name = name
        self.birthPlace = birthPlace
        XiaoMine.qulification = qulification
    }
}

protocol oneProtocol {
    func oneMethod()
}

protocol twoProtocol {
    func twoMethod()
}

protocol threeProtocol: oneProtocol, twoProtocol {
    var name: String {get set}
}

extension threeProtocol where Self: UIViewController {
    
}

class protocloTest: threeProtocol {
    var name: String = "testThree"
    
    func oneMethod() {
        print("i am oneProtocol...")
    }
    
    func twoMethod() {
        print("i am twoProtocol...")
    }
}

class TestClass {
    func testMethod() {
        let test = protocloTest()
        test.oneMethod()
        test.twoMethod()
    }
}

///测试计算型属性
protocol testCountProtocol {
    var squre: Float { get }
}

struct testCountStruc: testCountProtocol {
    var squre: Float {
        return 5*10
    }
}

struct dataResponse<Value> {
    var name: Value
}

class test {
    func test() {
        let count = testCountStruc()
        let _ = count.squre
        
        let arr: [testCountProtocol] = [count]
        for obj in arr {
            let _ = obj.squre
        }
        
        let _ = dataResponse(name: 2445)
    }
}

public enum Result {
    case success
    case failure
    
    var isSuccess: Bool {
        switch self {
            case .success:
                return true
            case .failure:
                return false
        }
    }
}

public enum Shap {
    case ractange(rect: CGRect)
    case circle(p: CGPoint, r: Int)
}

public enum Week: String {
    case monday = "one"
    case thsday = "two"
}

class TestEnum {
    func testEnum() {
        let rp = Result.success
        let _ = rp.isSuccess
  
        
        let wk = Week.monday
        let _ = wk.rawValue
    }
}










