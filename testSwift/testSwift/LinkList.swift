//
//  Node.swift
//  testSwift
//
//  Created by Sheng Yu on 2020/8/3.
//  Copyright © 2020 flame chen. All rights reserved.
//

import Foundation

class Node<Value> {
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
    
}
struct LinkList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?
    
    init() {
        
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    //添加一个值到链表的最前面
    mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head // 创建新节点，没有尾节点，头节点和尾节点指向同一个新节点
        }
    }
    
    mutating func append(_ value: Value) {
         // 1
         guard !isEmpty else {
             push(value)
             return
         }
         // 2
         tail?.next = Node(value: value)
         // 3
         tail = tail?.next
    }
    
    
    mutating func insertAt(_ value: Value, _ index: Int) {
        if index == 0 {
            head = Node(value: value, next: head)
        } else{
            var preNode  = node(index-1)
            preNode?.next = Node(value: value, next: preNode?.next)
        }
        
    }
    
    mutating func reooveAt( _ index: Int) {
        if index == 0 {
            head = head?.next
        } else{
            var preNode  = node(index-1)
            preNode?.next = preNode?.next?.next
        }
        
    }
    
    func node(_ index: Int) -> Node<Value>? {
        var currentNode = head
        
        for _ in 0..<index {
            currentNode = currentNode?.next
        }
        return currentNode
        
    }
    
}
