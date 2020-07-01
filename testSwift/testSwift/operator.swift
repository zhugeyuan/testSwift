//
//  operator.swift
//  testSwift
//
//  Created by Sheng Yu on 2020/6/29.
//  Copyright © 2020 flame chen. All rights reserved.
//

import Foundation

prefix operator +++
class Point6 {
    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
    
    static func + (p1: Point6, p2: Point6) -> Point6 {
        Point6(p1.x + p2.x, p1.y + p2.y)
    }
    
    static func - (p1: Point6, p2: Point6) -> Point6 {
        Point6(p1.x - p2.x, p1.y - p2.y)
    }
    
    static prefix func - (p: Point6) -> Point6 {
        Point6(-p.x, -p.y)
    }
    
    static func += (p1: inout Point6, p2: Point6) {
        p1 = p1 + p2
    }
    
    static prefix func +++ (p: inout Point6) -> Point6 {
        p += p
        return p
    }
    

}
