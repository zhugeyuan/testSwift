//
//  fp.swift
//  testSwift
//
//  Created by Sheng Yu on 2020/6/24.
//  Copyright © 2020 flame chen. All rights reserved.
//

import Foundation

func add(_ v1: Int, _ v2: Int) -> Int {
    v1 + v2
}
func add(_ v1: Int, _ v2: Int, _ v3: Int) -> Int {
    v1 + v2 + v3
}

//柯里化 currying
func add1(_ v1: Int) -> (Int) -> Int {
    
    return { v2 in
        v2 + v1
    }
}

func add2(_ v1: Int) -> (Int) -> (Int)->Int {
    
    return { v2 in
        return { v3 in
            v3 + v2 + v1
            
        }

    }
}

var ddd = add1(2)(4)
var ddd2 = add2(2)(4)(6)


func sub(_ v1: Int, _v2: Int) -> Int {
    return v1 - v2
}
func sub1(_ v1: Int) -> (Int) -> Int {
    return { (v2: Int) -> Int in
            return v2 - v1
    }
}

//函数合成
func composite(_ fn1: @escaping (Int) -> Int, _ fn2: @escaping (Int) -> Int) -> (Int) -> Int {
    
    {fn2(fn1($0))}
    
}
var com = composite(add1(2), sub1(3))

//最终版本
infix operator >>> : AdditionPrecedence
func >>> <A,B,C>(_ fn1: @escaping (A)->B, _ fn2: @escaping (B)->C) -> (A)->C {
    {fn2(fn1($0))}
}

var com1 = add1(2) >>> sub1(3) >>> sub1(3) >>> add1(3)


//函数 currying
func currying<A,B,C>(_ fn1: @escaping (A, B) -> C) -> (A) -> (B) -> C {
    
    return { a in
        return { b in
           return fn1(a, b)
        }
    }
}
var re = currying(add)(1)(2)
var re2 = currying(sub)(1)(2)

prefix func ~<A,B,C>(_ fn1: @escaping (A, B) -> C) -> (B) -> (A) -> C {
    
    return { b in
        return { a in
           return fn1(a, b)
        }
    }
}
var re3 = (~add)(1)(2)
var re4 = (~sub)(1)(2)

//保留原函数 不用手写currying函数 add1 sub1
var com2 = (~add)(2) >>> (~sub)(3) >>> (~sub)(3) >>> (~add)(3)
