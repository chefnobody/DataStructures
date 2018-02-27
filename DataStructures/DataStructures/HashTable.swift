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

enum HashTableResult {
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
}

extension Keyable {
    
    // Computes a table index.
    // Using the key's unicode values and modular math.
    func hashIndex<T>(for key: String, using buckets:[T]) -> Int {
        return unicodeModularHash(key: key, bounds: buckets.count)
    }
}




