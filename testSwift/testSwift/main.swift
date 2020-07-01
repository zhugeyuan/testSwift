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

//原始值
enum PokerSuit : Character {
    case spade = "♠️"
    case heart = "♥️"
    case diamond = "♦️"
    case club = "♣️"
}
var suit = PokerSuit.spade
print(suit)//space
print(suit.rawValue)//"♠️"
print(PokerSuit.spade.rawValue)//"♠️"

//可选项
var arr = [1,15,40,29]
func get(_ index: Int) -> Int? {
    if index<0 || index>=arr.count {
        return nil
    }
    return arr[index]
}
print(get(1))
print(get(4))

//强制解包
var age: Int? = 10
let ageInt: Int = age!


let s = "123"

let number = Int(s)

if number != nil {
    print("number = \(number!)")
}else{
    print("number = nil")
}

//可选项绑定
//number 已经解绑了不需要加（！）
if let number = Int(s) {
    print("字符串转换整数成功：\(number)")
} else {
    print("字符串转换整数失败")
}

enum Season1 :Int {
    case spring = 1, summer, august, winter
}

if let season = Season1(rawValue: 1) {
    switch season {
    case .spring:
        print("spring")
    default:
        print("other")
    }
}else {
    print("no such reason")
}


if let first = Int("4") {
    if let second = Int("40") {
        if first<second && second<100 {
            print("\(first) < \(second) < 100")
        }
    }
}
//和上面完全等价
if let first = Int("4"),
    let second = Int("40"),
    first<second && second<100 {
    print("\(first) < \(second) < 100")
}

//正整数加起来，负数或非数字停止便利
let strs = ["10", "20", "abc", "-10", "30"]
var index = 0
var sum = 0

while let num = Int(strs[index]), num>0 {
    sum += num
    index += 1
}
print(sum)


//空合并运算符 a ?? b 之间需要空格
/*
 **作用**
如果a 不为nil,就返回 a
如果a 为nil,就返回 b
如果b 不是可选项，返回a时会自动解包
*/

let a: Int? = 1
let b: Int = 2
let c = a ?? b
print(c)

//下面这一串可以用 a??b 表示
let c1:Int
if let tmp = a {
    c1 = tmp
}else{
    c1 = b
}

let A: Int? = 1
let B: Int? = 2
// A != 0 || B != 0
if let C = A ?? B {
    print(C)
}

// A != 0 && B != 0
if let C = A,
    let D = B {
    print(C,D)
}

/*
 
 ✍当guard语句的条件为true时，就会跳过guard语句
 ✍guard语句特别适合用来 “提前退出”
 ✍当使用guard语句进行可选项绑定时，绑定的常量(let)、变量(var)也能在外层作用域中使用

 */
func login(_ info: [String : String]) {
//    let username: String
//    if let tmp = info["username"] {
//        username = tmp
//    }else{
//        print("no username")
//        return
//    }
//
//    let password: String
//    if let tmp = info["password"] {
//        password = tmp
//    }else{
//        print("no password")
//        return
//    }
    
    
    guard let username = info["username"] else {
        print("no username")
        return
    }
    
    guard let password = info["password"] else {
        print("no password")
        return
    }
    
    print("username is \(username), password is \(password)")
}

login(["username" : "zhuge", "password": "123"])

//隐式解包
/*
 ☼ 在某些情况下，可选项一旦被设定值之后，就会一直拥有值
 ☼ 在某些情况下，可以去掉检查，也不必每次访问的时候都进行解包，因为它能确定每次访问的时候都有值
 ☼ 可以在类型后面加个！定义一个隐式解包的可选项

 */
var num1: Int! = 10
let num2: Int = num1

if num1 != nil {
    num1 = 40
}
if let num3 = num1 {
    print(num3)
}


let Age: Int? = 10
print("age is \(Age!)")
print("age is \(String(describing: Age))")
print("age is \(Age ?? 0)")

//多重可选项
let number1: Int? = nil
let number2: Int?? = 10
let number3: Int?? = nil

print(number1 == number3)
//使用lldb指令 frame variable -R 或者fr v -R查看区别

//let stru = structAndClass()


struct Point {
    var x: Int = 0
    var y: Int = 0
}
struct Point1 {
    var x: Int
    var y: Int
    //自定义初始化器
    init() {
        self.x = 0
        self.y = 0
    }
}

struct Point2 {
    var x: Int
    var y: Int
    //自定义初始化器
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}
//初始化器 Point和Point1完全等效
//let p = Point()
//let p = Point1()

let p = Point2(x: 1, y: 2)


//编译器并没有为类自动生成可以传入参数的初始化器
//如果类的所有成员都给定初始值，编译器就会自动生成无参的初始化器
class Point3 {
    var x: Int = 0
    var y: Int = 0
}
class Point4 {
    private(set) var x: Int
    var y: Int
    //自定义初始化器
    init() {
        self.x = 0
        self.y = 0
    }
}

class Point5 {
    var x: Int
    var y: Int
    //自定义初始化器
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}
// Point3和Point4完全等效



//结构体和类的本质区别
//结构体是值类型（栈空间）类是引用类型（指针类型）（堆空间）

//值类型 深拷贝 所以p1不会改变
//值类型 swift标准库 String Array Dictionary Set 采用了Copy On Write 技术  即s2 = s1时是浅拷贝 当有“写”的操作的时候s2.append("_Tom") s2 才会深拷贝
//建议：不需要修改的尽量用 let
var p1 = Point2(x:10, y:20)
var p2 = p1
p2.x = 100
p2.y = 200

var s1 = "Jack"
var s2 = s1
s2.append("_Tom")
//s1 Jack
//s3 Jack_Tom



//引用类型 引用赋值给 let var 或者函数传参，是将内存地址拷贝一份，是浅拷贝
var s3 = Point5(x: 10, y: 20)
var s4 = s3


//值类型 引用类型 let
let p3 = Point2(x:10, y:20)
//p3 = Point2(x:11, y:22)//报错
//p3.x = 11//报错

let s5 = Point5(x: 10, y: 20)
//s5 = Point5(x: 10, y: 20)//报错
s5.x = 11//修改成员是可以的


//闭包
//通过func定义一个函数
func sum1(_ v1: Int,_ v2: Int) -> Int { return v1+v2 }

//通过闭包定义函数
var fnn = {
    (v1: Int, v2: Int) -> Int in
    return v1 + v2
}
//可以简写成
//var fnnn: (Int,Int)->Int = {$0+$1}
//var fnnn: (Int,Int)->Int = (+)

func exec(v1: Int, v2: Int, fn: (Int, Int)->Int ) {
    print(fn(v1,v2))
}
//之前需要定义一个函数 传函数名， 有了闭包可以直接传闭包
exec(v1: 10, v2: 20, fn: {
    //省略括号，参数类型，reture
    v1, v2 in v1 + v2
    
    //省略参数 in
//    $0+$1
})

//尾随闭包 省略fn:
exec(v1: 10, v2: 20) {
    $0+$1
}

//exec{$0+$1} 只有一个参数且是闭包 exec(){$0+$1} 可以省略()

//数组的排序
var array = [1,5,3,2]
//array.sort { (v1: Int, v2: Int) -> Bool in
//    return v1>v2
//}
array.sort {$0>$1}
print(array)



print("fnn---\(fnn(2,4))")

class Car {
    init() {
        print("car init")
    }
    
    func go()  {
        print("go")
    }
}

class Person {
    //懒加载
    lazy var car = Car()
    
    init() {
        print("person init")
    }
    
    func goOut() {
        self.car.go()
    }
}

let per = Person()
print("----")
per.goOut()


var v9 = 10



//fp.swift
print("----fp.swift-----")
//print(com(4))
//print(com1(4))


//template.swift
var ss = Stack<String>()
ss.push("abc")


//operator.swift
var p6 = Point6(2,4)
//+++p6
//p6+p6



//pop.swift
var str = "1234test1234"
//print(numberCount(str))
//print(str.numberCount())
//print(str.numberCount)
print(str.mj.numberCount)
Person().mj.run()
String.mj.test()
Person.mj.runrunrun()

str.mj.run()

//print(String() is String.self)//报错
//print(String() is String.Type)//写法错误
print(String() is String)
print(String.self is String.Type)
print(String.self is MJCompatible.Type)
