//
//  pop.swift
//  testSwift
//
//  Created by Sheng Yu on 2020/6/30.
//  Copyright © 2020 flame chen. All rights reserved.
//

import Foundation

/// 前缀类型
struct MJ<Base> {
    var base: Base
    init(_ base: Base) {
        self.base = base
    }
    
//    var numberCount: Int {
//        var count = 0
//
//        for c in base where ("0"..."9").contains(c) {
//            count += 1
//        }
//        return count
//    }
    
}

/// 利用协议扩展前缀属性
protocol MJCompatible {
    
}
extension MJCompatible {
    var mj: MJ<Self> {
        set {}
        get { MJ(self) }
    }
    
    //类方法
    static var mj: MJ<Self>.Type {
        set {}
        get { MJ<Self>.self }
        
    }
}

extension String :MJCompatible {
//    func numberCount() -> Int {
//        var count = 0
//
//        for c in self where ("0"..."9").contains(c){
//            count += 1
//        }
//        return count
//    }
    
    //拓展成计算属性
//    var numberCount: Int {
//        var count = 0
//
//        for c in str where ("0"..."9").contains(c){
//            count += 1
//        }
//        return count
//    }
    
    
//    var mj: MJ<String> { MJ(self) }
//
//    //类方法
//    static var mj: MJ<String>.Type { MJ<String>.self }
}

extension Person :MJCompatible {
    
    
}



extension MJ where Base == String {
    var numberCount: Int {
        var count = 0
        for c in base where ("0"..."9").contains(c) {
            count += 1
        }
        return count
    }
    
    static func test() {
        
    }
    
    mutating func run() {
        
    }
}



//Base == Person 只能是Person  : Person 可以是Person的子类
extension MJ where Base : Person {
    
    func run() {
        print("person.extension run")
    }
    
    static func runrunrun() {
        
    }
}





