//
//  Queue.swift
//  DataStructures
//
//  Created by Aaron Connolly on 11/16/17.
//  Copyright © 2017 Top Turn Software. All rights reserved.
//

import Foundation

public class QueueNode<T> {
    var key:T
    var next:QueueNode?
    init(key: T) {
        self.key = key
    }
}

// Generic queue structure for ordering things. Rules: First in, first out.
// Think: People waiting in line at the movies.
//
// Adding items 0(n) time because you have to traverse the entire list to append the new item.
// Removing items 0(1) time becuase you always take the top item off the list.
//
public class Queue<T> {
    
    // MARK: - Public properties
    
    public var count: Int {
        return counter
    }
    
    // MARK: - Stored Properties
    
    private var top: QueueNode<T>?
    private var counter: Int
    
    public init() {
        top = nil
        counter = 0
    }
    
    // Add some key to the back of the line.
    public func enQueue(key: T) {
        
        counter += 1
        
        // Empty line, case.
        guard !isEmpty() else {
            top = QueueNode<T>(key: key)
            return
        }
        
        var current = top
        
        // Walk to the end of the line
        while current?.next != nil {
            current = current?.next
        }
        
        let newNode = QueueNode<T>(key: key)
        
        // Append new child
        current?.next = newNode
    }
    
    // Happens in 0(1) "constant" time because we're always ever
    // popping the first item off the head of the line.
    @discardableResult public func deQueue() -> T? {
        
        // Empty line, case. You get nothing!
        guard !isEmpty() else {
            return nil
        }
        
        counter -= 1
        
        // Get the head of the line's key
        let key: T? = peek()
        
        // Move top to the next item, otherwise
        // nil the top because we emptied the line.
        if let nextItem = top?.next {
            top = nextItem
        } else {
            top = nil
        }
        
        return key
    }
    
    public func peek() -> T? {
        return top?.key
    }
    
    public func isEmpty() -> Bool {
        return peek() == nil
    }
    
    public func printKeys() -> String {
        
        guard !isEmpty() else {
            return "Queue is empty!"
        }
        
        var keys = [T]()
        var current: QueueNode<T>? = top
        
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


/*
 Frin 3.4 Queue Via Stacks
 */
class MyQueue<T: Comparable> {
    
    public var count: Int {
        get {
            return stack.count
        }
    }
    
    private var stack: Stack<T>
    
    init() {
        self.stack = Stack<T>()
    }
    
    func enqueue(key: T) {
        stack.push(key: key)
    }
    
    // Fairly expensive
    // - 0(n) to reverse that takes 2n space.
    // - Does this twice.
    func dequeue() -> T? {
        // reverse main stack
        let tempStack = reverse(stack)
        let popped = tempStack.pop()
        
        // reverse it back
        stack = reverse(tempStack)
        return popped
    }
    
    // This is 0(n) time complexity
    // and 0(2n) space complexity, but thats
    // where the second stack comes in.
    func reverse(_ stack: Stack<T>) -> Stack<T> {
        let temp = Stack<T>()
        while !stack.isEmpty() {
            if let key = stack.pop() {
                temp.push(key: key)
            }
        }
        return temp
    }
}
