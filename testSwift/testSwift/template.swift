//
//  template.swift
//  testSwift
//
//  Created by Sheng Yu on 2020/6/29.
//  Copyright © 2020 flame chen. All rights reserved.
//

import Foundation

func swapValues<T>(_ v1: inout T, _ v2: inout T) {
    (v1, v2) =  (v2, v1)
}


class Stack<E> {
    var elements = [E]()
    
    func push(_ element: E) {
        elements.append(element)
    }
    func pop() -> E {
        elements.removeLast()
    }
//    func top() -> E {
//        elements.last!
//    }
    func size() -> Int {
        elements.count
    }
}



