//
//  main.swift
//  testSwift
//
//  Created by Sheng Yu on 2020/6/8.
//  Copyright © 2020 flame chen. All rights reserved.
//

import Foundation

print("Hello, World!")



if true {
    
    let list = ["a","b","c"]
    for a in list {
        print(a)
    }
    
    for i in 1...3 {
        print(list[i-1])
    }
    
    let  a:Character =  "a"
    print(a)
    
    let range: ClosedRange<Int> = 1...4
    print(range)
    
    let range1: Range<Int> = 1..<4
    for i in range1 {
        print(i)
    }
    
//    let range2: PartialRangeThrough<String> = ..."aa"
//    for i in range2 {
//        print(i)
//    }
    
    let range3 = "aa"..."ff"
    
    print(range3.contains("fg"))
    print(range3.contains("ab"))
    
    for tickMark in stride(from: 1, through: 11, by: 2) {
        print(tickMark)
    }
    
    var number = 2

    switch number {
    case 1:
        fallthrough
        
    case 2:
        print("bb")
    default:
        break
    }
    
    outer: for i in 1...4 {
        for j in 1...4 {
            if j==3 {
                continue outer
            }
            
            if i==3 {
                break outer
            }
            
            print("j==\(j), i==\(i)")
        }
    }
    
    
    
    
    
    
}

let result = (cal(v1: 1, v2: 2))
result.sum



/// 12
/// - Parameters:
///   - v1: 方法
///   - v2: 付
/// - Returns: f
func cal(v1: Int, v2: Int) -> (sum: Int, anv: Int, aaa: Int) {
    return(v1-v2, v1+v2, (v1+v2)>>1)
}

//修改标签
func goToWrok(at time:String) -> Void {
    
}

let su = goToWrok(at: "100.0")


//省略标签
func sum(_ v1: Int, _ v2: Int) -> Int {
    return v1+v2
}

let su1 = sum(1, 2)


//默认参数
func check(age: Int = 10, name: String, job: String = "none") {
    
}

//let su3 = check(age: <#T##Int#>, name: <#T##String#>, job: <#T##String#>)

//省略标签 见print函数
print(1,"abc",3)


func swapValues(v1: inout Int, v2: inout Int) {
    let temp = v1
    v1 = v2
    v2 = temp
}

//跟上面等价
func swapValues2(v1: inout Int, v2: inout Int) {
    (v1, v2) = (v2, v1)
}

var v1 = 1
var v2 = 2
swapValues2(v1: &v1, v2: &v2)
print(v1, v2)


//函数类型

func sum2(v1: Int, v2: Int) -> Int {
    return v1+v2
}

let fn: (Int, Int) ->Int = sum2(v1:v2:)
let res: Int = fn(2,3)

func sum3(v1: Int, v2: Int) -> Int {
    return v1+v2
}

func diff3(v1: Int, v2: Int) -> Int {
    return v1-v2
}

func printResult(_ mathFunc: (Int, Int) -> Int, _ v1: Int, _ v2: Int) -> Int {
    return mathFunc(v1, v2)
}

print(printResult(sum3(v1:v2:), 5, 2))
print(printResult(diff3(v1:v2:), 5, 2))

typealias AAAA = (Int, Int) -> Int

//内联关键字 一般系统都会自动优化 不用手动加
@inline(never) func sum3(v1: Int, v2: Int) {
    
}


//枚举
enum Derection {
    case east
    case south
    case west
    case north
    
}

var de = Derection.east
de = .south
print(de)

switch de {
case .east:
    print("east")
case .south:
    print("south")
case .west:
    print("west")
case .north:
    print("north")

}

enum Score {
    case point(Int)
    case grade(String)
}
var score = Score.point(98)
score = Score.grade("A")
print(score)

switch score {
case let .point(i):
    print(i,"point")
case let .grade(i):
    print("grade \(i)")

}

enum Date {
    case digit(year: Int, month: Int, day: Int)
    case string(String)
}

var date = Date.digit(year: 2020, month: 6, day: 9)
date = Date.string("2020-6-9")

switch date {
case .digit(let year, let month, let day):
    print(year,month,day)
case .string(let s):
    print(s)
}

//关联值 原始值 区别
enum Season {
    case spring, summer, august, winter //原始值 占用1字节
}
enum PassWord {
    case digit(Int, Int, Int, Int)//关联值 占用实际关联值大小（32字节）
    case other//原始值
}

var pwd = PassWord.digit(4, 4, 2, 5)
pwd = .other
print(MemoryLayout.size(ofValue: pwd))//33

print(MemoryLayout<Season>.size)//1
print(MemoryLayout<Season>.stride)//1
print(MemoryLayout<Season>.alignment)//1
print(MemoryLayout<PassWord>.size)//33 同等上面pwd变量
print(MemoryLayout<PassWord>.stride)//40
print(MemoryLayout<PassWord>.alignment)//8


