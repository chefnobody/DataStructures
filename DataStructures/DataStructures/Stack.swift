//
//  Stack.swift
//  DataStructures
//
//  Created by Aaron Connolly on 11/15/17.
//  Copyright © 2017 Top Turn Software. All rights reserved.
//

import Foundation

fileprivate class Node<T> {
    var key:T?
    var next:Node?
}

// Generic stack structure for ordering things. Rules: First in, last out.
// Think: stack of dirty dishes
//
// Adding items 0(1) constant time. Why? You're always pushing onto the the head.
// Removing items 0(1) constant time. Why? You're always popping off the head.
//
class Stack<T> {
    
    private var top: Node<T>
    private var counter: Int
    
    public var count: Int {
        return counter
    }
    
    init() {
        top = Node()
        counter = 0
    }
    
    // Adding items happens in O(1) "constant" time because we're
    // Always adding to the head of line.
    func push(key: T) {
        
        counter += 1
        
        // Empty list, case
        guard !isEmpty() else {
            top.key = key
            return
        }
        
        let newNode = Node<T>()
        newNode.key = key
        
        // Swap the new node with the top node.
        newNode.next = top
        top = newNode
    }
    
    // Also happens in O(1) "constant" time.
    @discardableResult func pop() -> T? {
        
        guard let key = top.key else {
            return nil
        }
        
        counter -= 1
        
        // Move the head to the next node
        if let nextNode = top.next {
            top = nextNode
        } else {
            // Otherwise, nil out the head's key.
            top.key = nil
        }
        
        return key
    }
    
    func peek() -> T? {
        return top.key
    }
    
    func isEmpty() -> Bool {
        return peek() == nil
    }

    func printKeys() -> String {
        guard !isEmpty() else {
            return "Stack is empty!"
        }
        
        var keys = Array<T>()
        var current: Node<T>? = top
        
        while current != nil {
            keys.append(current!.key!)
            current = current?.next
        }
        
        return keys
            .map({ String(describing: $0) })
            .joined(separator: ",")
    }
}
