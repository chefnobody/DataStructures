//
//  LinkedList.swift
//  DataStructures
//
//  Created by Aaron Connolly on 2/24/18.
//  Copyright © 2018 Top Turn Software. All rights reserved.
//

import Foundation

public class ListNode<T: Hashable> {
    var key: T
    var next: ListNode<T>?
    
    public init(key: T) {
        self.key = key
        self.next = nil
    }
}

public class LinkedList<T: Hashable> {
    
    // MARK: - Public properties
    
    public var length: Int {
        return counter
    }
    
    // MARK: - Stored properties
    
    private var head: ListNode<T>?
    private var counter: Int
    
    // MARK: - Inintializer
    
    public init() {
        head = nil
        counter = 0
    }
    
    // MARK: - Public methods
    
    /*
     - Walks to end of list, appends new node
     - Increments counter
     */
    @discardableResult public func append(key: T) -> ListNode<T> {
        
        // Create a new node and increment the counter
        let newNode = ListNode<T>(key: key)
        
        // Guard the empty list case.
        guard !isEmpty() else {
            head = newNode
            counter += 1

            return newNode
        }
        
        // Head will never be empty at this point.
        var current: ListNode<T>? = head
        
        // Walk current pointer to end.
        // You're at the end when current.next == nil
        while current?.next != nil {
            current = current?.next
        }
        
        // Attach the new node, increment counter.
        current?.next = newNode
        counter += 1

        return newNode
    }
    
    public func contains(key: T) -> Bool {

        // Empty list case.
        guard !isEmpty() else { return false }
        
        var current: ListNode<T>? = head
        
        // Walk current and next to the end
        // Until we hit the value we're looking for.
        while current != nil {
            if current!.key == key {
                return true
            }
            current = current!.next
        }
        
        // We walked completely down the list
        // and didn't find our value.
        return false
    }
    
    public func insert(key: T, at index: Int) {
        
        // Note: Don't explicitly check for
        // empty list. Handle this in edge cases.
        
        // Check index bounds.
        switch index {
        case 0:
            // Make new node.
            let newNode = ListNode<T>(key: key)
            counter += 1
            
            newNode.next = head
            head = newNode
            break
        case length + 1:
            // Inserting after tail should append.
            append(key: key)
            break
        case length...Int.max:
            fatalError("FAIL: Out of bounds. Seriously, how am I supposed to know where to put this?")
        default:
            // Insert somewhere between 1 and length
            let newNode = ListNode<T>(key: key)
            counter += 1
            
            var currentIndex = 1
            var current: ListNode<T>? = head?.next
            var trailing: ListNode<T> = head!
            
            while current != nil {
                
                if currentIndex == index {
                    // Need to keep a trailing pointer
                    // so as to set the new node
                    newNode.next = current
                    trailing.next = newNode
                    break
                }

                // Keep track of the trailing node
                // and move current down the list
                trailing = current!
                current = current?.next
                
                currentIndex += 1
            }
            
            break
        }
    }
    
    public func remove(at index: Int) {
        fatalError("FAIL: Not implemented yet.")
        // check index bounds
        
        // A few cases to consider:
        // - removing at the head
        // - removing after the head but before the tail
        // - removing at the tail
        // - removing at length + x should crash with out of bounds error
    }
    
    // Returns true for success cases. Returns false otherwise.
    public func removeDupes() -> Bool {
        
        // Empty lists and 1-length lists won't have dupes.
        guard !isEmpty() && self.length > 1 else { return false }
        
        var prev: ListNode<T>? = head
        var current: ListNode<T>? = head
        var uniques: Set<T> = Set<T>()
        var foundDupes: Bool = false
        
        while current != nil {
            
            if uniques.contains(current!.key) {
                
                // Remove node key found in set.
                // moving pointers.
                prev?.next = current!.next
                current = current!.next
                
                // Think: delete current?
                // Are we leaking a node object?
                foundDupes = true
            } else {
                // Add new node key to set.
                uniques.insert(current!.key)
                
                // move prev
                prev = current
                // move the current pointer
                current = current!.next
            }
        }
        
        return foundDupes
    }
    
    public func printKeys() -> String {
        guard !isEmpty() else { return "List is empty!" }
        
        var current: ListNode<T>? = head
        var keyString: String = ""
        
        while current != nil {
            
            if keyString.count > 0 {
                keyString.append(" -> \(String(describing: current!.key))")
            } else {
                keyString.append("\(String(describing: current!.key))")
            }
            
            current = current!.next
        }
        
        return keyString
    }
    
    // MARK: - Private methods
    
    private func isEmpty() -> Bool {
        return head == nil
    }

    /*
     Traverses the list of nodes until
     it hits one whose next pointer is nil.
     This should always be the last node.
     */
    private func walkToEnd() -> ListNode<T>? {
        
        guard !isEmpty() else {
            return nil
        }
        
        // Head will never be empty at this point.
        var current: ListNode<T>? = head
        
        // Walk current pointer to end.
        // Will kick out when the current pointer's
        // next is nil.
        while current?.next != nil {
            current = current!.next
        }
        
        return current
    }
}
