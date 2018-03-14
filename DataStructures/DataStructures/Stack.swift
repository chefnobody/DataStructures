//
//  Stack.swift
//  DataStructures
//
//  Created by Aaron Connolly on 11/15/17.
//  Copyright © 2017 Top Turn Software. All rights reserved.
//

import Foundation

public class StackNode<T: Hashable> {
    var key: T
    var next: StackNode?
    init(key: T) {
        self.key = key
    }
}

// Generic stack structure for ordering things. Rules: First in, last out.
// Think: stack of dirty dishes
// Useful for reversing a string or an array.
// - or managing the nodes that have been visited in a tree/graph, perhaps?
//
// Adding items 0(1) constant time. Why? You're always pushing onto the the head.
// Removing items 0(1) constant time. Why? You're always popping off the head.
//
public class Stack<T: Hashable> {

    // MARK: - Public Properties
    
    public var count: Int {
        return counter
    }

    // MARK: - Stored Properties
    
    private var top: StackNode<T>?
    private var counter: Int
    
    public init() {
        top = nil
        counter = 0
    }
    
    // Adding items happens in O(1) "constant" time because we're
    // Always adding to the head of line.
    public func push(key: T) {
        
        counter += 1
        
        // Empty list, case
        guard !isEmpty() else {
            top = StackNode<T>(key: key)
            return
        }
        
        let newNode = StackNode<T>(key: key)
        
        // Swap the new node with the top node.
        newNode.next = top
        top = newNode
    }
    
    // Also happens in O(1) "constant" time.
    @discardableResult public func pop() -> T? {
        
        guard let key = top?.key else {
            return nil
        }
        
        counter -= 1
        
        // Move the head to the next node
        if let nextNode = top?.next {
            top = nextNode
        } else {
            // Otherwise, nil out the head's key.
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
            return "Stack is empty!"
        }
        
        var keys = [T]()
        var current: StackNode<T>? = top
        
        while current != nil {
            keys.append(current!.key)
            current = current?.next
        }
        
        return keys
            .map({ String(describing: $0) })
            .joined(separator: ",")
    }
}
