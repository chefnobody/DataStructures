//
//  Stack.swift
//  DataStructures
//
//  Created by Aaron Connolly on 11/15/17.
//  Copyright © 2017 Top Turn Software. All rights reserved.
//

import Foundation

public class StackNode<T: Comparable> {
    var key: T
    var next: StackNode<T>?
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
public class Stack<T: Comparable> {

    // MARK: - Public Properties
    
    public var count: Int {
        return counter
    }

    public var min: T? {
        return localMin
    }
    
    // MARK: - Stored Properties
    
    private var top: StackNode<T>?
    
    private var counter: Int
    
    private var localMin: T?
    
    public init() {
        top = nil
        counter = 0
        localMin = nil
    }
    
    // Adding items happens in O(1) "constant" time because we're
    // Always adding to the head of line.
    public func push(key: T) {
        
        counter += 1
        
        // Empty list, case
        guard !isEmpty() else {
            top = StackNode<T>(key: key)
            localMin = key
            return
        }
        
        // Swap the localMin value?
        if localMin != nil && key < localMin! {
            localMin = key
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
        
        // Find a new min, if we just popped it off the list.
        if localMin != nil && key <= localMin! {
            localMin = findMin()
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

    // This is called if we pop our current minimum value
    // off the stack and now need to find a new minimum value.
    private func findMin() -> T? {
        guard !isEmpty() else {
            return nil
        }
        
        var current: StackNode<T>? = top
        var currentMin = current?.key
        
        while current != nil {
            // Explicitly unwrapping these two values
            // should be safe. Current is never nil
            // inside the while loop, and currentMin
            // will never be nil, because the head/top
            // is never nil at this point.
            if current!.key < currentMin! {
                currentMin = current?.key
            }
            current = current?.next
        }
        
        return currentMin
    }
}

// From 3.3 SetOfStacks
class SetOfStacks<T: Comparable> {
    
    // MARK: - Public properties
    
    public var count: Int {
        get {
            return counter
        }
    }
    
    // MARK: - Stored properties
    
    // Keep small for testing.
    // Watch out for odd number fixed sizes.
    private let fixedSize: Int
    
    private var counter: Int
    
    // Stacks have a length of fixedSize.
    // Lets make the stacks hold integers for now.
    // As we
    private var stacks: [Stack<T>]
    
    init(fixedSize: Int) {
        
        // FYI: Fixed size should always be > 0
        
        self.fixedSize = fixedSize
        self.counter = 0
        
        // Add one stack
        self.stacks = [Stack<T>]()
    }
    
    // Figure out which stack to push onto.
    // Increment local counter
    func push(key: T) {
        
        // Which stack are we pushing on to?
        let stack = currentStack()
        stack.push(key: key)
        
        // Increment total items
        counter += 1
    }
    
    // Determine which stack to pop from.
    // Once that stack is empty, remove
    // it from storage.
    func pop() -> T? {
        // Important to decrememnt count
        // before determining current stack
        counter -= 1
        
        let stack = currentStack()
        let key = stack.pop()
        
        if stack.count == 0 {
            // since stacks are appended
            // this should be safe:
            print("stack is empty. clean it up.")
            stacks.removeLast()
            print("total stacks", stacks.count)
        }
        
        return key
    }
    
    // Watch out you could peek at an empty
    // stack that hasn't yet been cleaned.
    func peek() -> T? {
        let stack = currentStack()
        return stack.peek()
    }
    
    func popAt(index: Int) -> T? {
        return nil
    }
    
    // Takes the current count, the fixed size
    // and figures out which stack to return.
    // If no stack is found it allocates a new
    // stack.
    func currentStack() -> Stack<T> {
        // derive an index in our stack array
        // that corresponds to the current stack
        let index = counter / fixedSize
        
        if (0..<stacks.count).contains(index) {
            return stacks[index]
        }
        
        return allocateStack()
    }
    
    private func allocateStack() -> Stack<T> {
        let stack = Stack<T>()
        stacks.append(stack)
        return stack
    }
}

