//
//  protocal.swift
//  testSwift
//
//  Created by Sheng Yu on 2020/6/28.
//  Copyright © 2020 flame chen. All rights reserved.
//

import Foundation

protocol Drawble {
    var x: Int {get}
    var y: Int {get set}
    func test(index: Int) -> Int
    subscript(index: Int) -> Int {get set}
}

class drwa: Drawble {
    var x = 10
    var y = 20
    func test(index: Int) -> Int {
        10
    }
    
    subscript(index: Int) -> Int {
        get {index}
        
        set {}
    }
        
}
