//
//  Tree.swift
//  DataStructures
//
//  Created by Aaron Connolly on 2/28/18.
//  Copyright © 2018 Top Turn Software. All rights reserved.
//

import Foundation

public class BSTNode<T>: CustomStringConvertible {
    
    // MARK: - Custom String Convertible Conformance
    
    public var description: String {
        return String(describing: key)
    }
    
    var key: T
    var left: BSTNode<T>?
    var right: BSTNode<T>?
    
    public init (key: T) {
        self.key = key
        self.left = nil
        self.right = nil
    }
}

// A Binary Search Tree
// All Left Descendents <= N < All Right Descendants
// where N is the key at a given Node.
//
// - Always ordered
// - Always balanced

public class BST<T: Comparable> {
    
    // MARK: - Tree Preparation
    
    static public func prepareTree(with items: inout [T]) -> BSTNode<T>? {
        // Setting up a tree is weird.
        
        // Remove first item in numbers, add to tree.
        let i = items.remove(at: 0)
        let root: BSTNode<T>? = BST.insert(root: nil, key: i)
        
        // Iterate over remaining nums building out the tree.
        for i in items {
            BST.insert(root: root, key: i)
        }
        
        return root
    }
    
    // MARK: - Determine Height
    
    static public func height(root: BSTNode<T>?) -> Int {
        
        // Base case for an empty tree.
        guard let node = root else {
            return 0
        }
        
        // keep a queue of all nodes at a given level.
        var height = 0
        let queue = Queue<BSTNode<T>>()
        queue.enQueue(key: node)
        
        while true {
            // Be sure to kick-out of this loop
            // when we run out of nodes in the queue
            
            // Keep a separate variable for count of the queue size.
            var nodeCount = queue.count
            
            if nodeCount == 0 {
                // Node count will be 0
                // when the queue is totally empty
                return height
            }
            
            // Incrementing the height means we've queued up
            // another set of nodes at a new level.
            height += 1
            
            // Queue up all the nodes in the tree.
            // Will kick out of this inner while loop
            // node count (which is fixed above) drops to 0.
            // This means we've dequeued all the nodes
            // that were previously enqueued in previous
            // passes through this inner while loop.
            while nodeCount > 0 {
                
                // Remove next node from queue.
                let nextNode: BSTNode<T>? = queue.deQueue()
                
                // Fills the queue with all nodes at this level.
                
                // Enqueue left node if it exists.
                if let left = nextNode?.left {
                    queue.enQueue(key: left)
                }
                
                // Enqueue right node if it exists.
                if let right = nextNode?.right {
                    queue.enQueue(key: right)
                }
                
                nodeCount -= 1
            }
        }        
    }
    
    // MARK: - Insertion
    
    // Finds the right place for this key to hang in the tree.
    @discardableResult static public func insert(root: BSTNode<T>?, key: T) -> BSTNode<T>? {
    
        guard let node = root else {
            // Root is nil so, we hit an empty spot recursing to our spot.
            // return new node.
            return BSTNode<T>(key: key)
        }
        
        // root is not nil
        if key < node.key {
            // recurse left if key is less than current node.
            node.left = insert(root: node.left, key: key)
            
        } else {
            // otherwise recurse right.
            node.right = insert(root: node.right, key: key)
        }
        
        return node
    }
    
    // MARK: - Traversing
    
    static public func inOrderTraverse(node: BSTNode<T>?) {
        guard let node = node else { return }
        
        inOrderTraverse(node: node.left)
        print(node.key)
        inOrderTraverse(node: node.right)
    }
    
    static public func preOrderTraverse(node: BSTNode<T>?) {
        guard let node = node else { return }

        print(node.key)
        preOrderTraverse(node: node.left)
        preOrderTraverse(node: node.right)
    }
    
    static public func postOrderTraverse(node: BSTNode<T>?) {
        guard let node = node else { return }
        
        postOrderTraverse(node: node.left)
        postOrderTraverse(node: node.right)
        print(node.key)
    }
    
    // MARK: - Display
    
    // Pretty prints a binary tree.
    // Think of the tree as stored in an array (this is how a heap works):
    // https://en.wikipedia.org/wiki/Binary_heap#Heap_implementation
    // - Array stores tree in breadth first order. [Parent, Left Child, Right Child, ...],
    // - How would you find the place in the array for a given level and then which is the left and which is the right node at that level?
    static public func prettyPrint(root: BSTNode<T>?) -> String {
        
        guard let node = root else {
            return "Tree is Empty"
        }
        
        // Main height of tree.
        let height = BST.height(root: node)
        
        // Use queues to walk through each level (like finding a height)
        var level = 0
        let queue = Queue<BSTNode<T>>()
        queue.enQueue(key: node)

        while true {
            // Be sure to kick-out of this loop
            // when we run out of nodes in the queue
            
            // Keep a separate variable for count of the queue size.
            var nodeCount = queue.count
            
            if nodeCount == 0 {
                // Node count will be 0
                // when the queue is totally empty
                break
            }
            
            // Add slashes?
            
            level += 1
            
            while nodeCount > 0 {
            
                // Remove next node from queue.
                let nextNode: BSTNode<T>? = queue.deQueue()
            
                // Enqueue left node if it exists.
                if let left = nextNode?.left {
                    queue.enQueue(key: left)
                }
                
                // Enqueue right node if it exists.
                if let right = nextNode?.right {
                    queue.enQueue(key: right)
                }
                
                nodeCount -= 1
            }
        }

        return "pizza"
    }
    
    // Creates line with node value inserted in the string.
    static public func createLine(for level: Int, nodes: [BSTNode<T>?], totalHeight: Int) -> String {
        
        guard level <= totalHeight else {
            return "Can't do that."
        }
        
        guard nodes.count > 0 else {
            return "Can't create a line w/o a any nodes."
        }
        
        // Number of nodes should be no more than pow(2, level)
        // Recipe: padding + node + padding (odd)
        // Recipe: padding + node + padding + node + padding (even)
        
        // Padding for this level and height:
        let padding = paddingSpaces(for: level, totalHeight: totalHeight)
        
        // Expensive-ish
        // 0(n) for map
        // 0(n-1) for joining ?
        let result = nodes
            .map { String(describing: $0!) }
            .joined(separator: padding)
        
        return padding + result + padding
    }
    
    static public func paddingSpaces(for level: Int, totalHeight: Int) -> String {
        guard level <= totalHeight else {
            return "Can't do that."
        }
        
        // You must treat level as a 0-based index
        // in relation to the total height.
        let exponent = abs(totalHeight - (level - 1))
        
        // pow returns a Decimal which needs to be converted twice
        // to get it back as an integer.
        let length = NSDecimalNumber(decimal: pow(3, exponent)).intValue
        
        return String(repeatElement("-", count: length))
    }
}
