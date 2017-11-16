//
//  Queue.swift
//  DataStructures
//
//  Created by Aaron Connolly on 11/16/17.
//  Copyright © 2017 Top Turn Software. All rights reserved.
//

import Foundation

fileprivate class Node<T> {
    var key:T?
    var next:Node?
}

// Generic queue structure for ordering things. Rules: First in, first out.
// Think: People waiting in line at the movies.
//
// Adding items 0(n) time because you have to traverse the entire list to append the new item.
// Removing items 0(1) time becuase you always take the top item off the list.
//
class Queue<T> {
    
    private var top: Node<T>?
    private var counter: Int
    
    public var count: Int {
        return counter
    }
    
    init() {
        top = Node<T>()
        counter = 0
    }
    
    // Add some key to the back of the line.
    func enQueue(key: T) {
        
        counter += 1
        
        // Empty line, case.
        guard !isEmpty() else {
            top?.key = key
            return
        }
        
        var current = top
        
        // Walk to the end of the line
        while current?.next != nil {
            current = current?.next
        }
        
        let newNode = Node<T>()
        newNode.key = key
        
        // Append new child
        current?.next = newNode
    }
    
    // Happens in 0(1) "constant" time because we're always ever
    // popping the first item off the head of the line.
    @discardableResult func deQueue() -> T? {
        
        // Empty line, case. You get nothing!
        guard !isEmpty() else {
            return nil
        }
        
        counter -= 1
        
        // Get the head of the line's key
        let key: T? = peek()
        
        // Move top to the next item, otherwise
        // create a new blank node for the top because
        // we emptied the line.
        if let nextItem = top?.next {
            top = nextItem
        } else {
            top = Node<T>()
        }
        
        return key
    }
    
    func peek() -> T? {
        return top?.key
    }
    
    func isEmpty() -> Bool {
        return peek() == nil
    }
    
    func printKeys() -> String {
        
        guard !isEmpty() else {
            return "Queue is empty!"
        }
        
        var keys = Array<T>()
        var current: Node<T>? = top
        
        while current != nil {
            if let key = current?.key {
                keys.append(key)
            }
            
            current = current?.next
        }
        
        return keys
            .map({ String(describing: $0) })
            .joined(separator: ",")
    }
}
