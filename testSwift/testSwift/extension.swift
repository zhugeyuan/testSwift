//
//  extension.swift
//  testSwift
//
//  Created by Sheng Yu on 2020/6/29.
//  Copyright © 2020 flame chen. All rights reserved.
//

import Foundation

class PPP {
    fileprivate var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}
//拓展便捷初始化器
extension PPP {
    convenience init(p: PPP) {
        self.init(p.x, p.y)
    }
}

//拓展协议
extension BinaryInteger {
    func odd() -> Bool {
        self%2 != 0
    }
}

//扩展中依然可以使用原类型中的泛型类型
extension Stack {
    func top() -> E {
        elements.last!
    }
}
