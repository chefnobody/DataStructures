//
//  HashTable.swift
//  DataStructures
//
//  Created by Aaron Connolly on 2/26/18.
//  Copyright © 2018 Top Turn Software. All rights reserved.
//

import Foundation

// Determines hash table hashing
// conformance
public protocol Keyable {
    var keyString: String { get }
    func hashIndex<T>(for key: String, using buckets:[T]) -> Int
}

public enum HashTableResult {
    case success
    case collision
    case notFound
    case notSupported
    case fail
}

public class HashTableNode<T> {
    var key: T?
    var next: HashTableNode?
}

public class HashTable<T: Keyable> {
    
    private var buckets: [HashTableNode<T>?]
    
    public init(capacity: Int) {
        // Collection size needed at a initialization
        self.buckets = [HashTableNode<T>?].init(repeating: nil, count: capacity)
    }
    
    public func append(_ element: T) -> HashTableResult {
        let result: HashTableResult
        
        // compute hash
        let hashIndex = element.hashIndex(for: element.keyString, using: buckets)
        
        // if a valid hash exists ...
        if hashIndex != -1 {
            let childToUse = HashTableNode<T>()
            childToUse.key = element
            
            if buckets[hashIndex] == nil {
                buckets[hashIndex] = childToUse
                result = .success
                
            } else {
                var head = buckets[hashIndex] as HashTableNode<T>?
                childToUse.next = head
                head = childToUse
                buckets[hashIndex] = head
                result = .collision
            }
        } else {
            // If a valid hash couldn't be computed
            // we call that "not supported"
            result = .notSupported
        }
        
        return result
    }

    public func contains<T: Keyable>(_ element: T) -> Bool {
        
        let hashIndex = element.hashIndex(for: element.keyString, using: buckets)
        
        guard hashIndex != -1 else { return false }
        
        if buckets[hashIndex] != nil {
            // check the chained list for a match
            var current = buckets[hashIndex]
            while current != nil {
                if let item: Keyable = current?.key {
                    if item.keyString == element.keyString {
                        return true
                    }
                }
                
                current = current?.next
            }
        }
        
        return false
    }
}

extension Keyable {
    
    // Computes a table index.
    // Using the key's unicode values and modular math.
    func hashIndex<T>(for key: String, using buckets:[T]) -> Int {
        return unicodeModularHash(key: key, bounds: buckets.count)
    }
}




