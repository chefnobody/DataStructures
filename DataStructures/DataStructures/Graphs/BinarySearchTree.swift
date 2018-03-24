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
    init (key: T) {
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
            // when we run out of nodes.
            
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
                let nextNode = queue.deQueue()
                
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
                print("queue:", queue.printKeys())
            }
        }        
    }
    
    // MARK: - Insertion
    
    // Finds the right place for this key to hang in the tree.
    @discardableResult static public func insert(root: BSTNode<T>?, key: T) -> BSTNode<T>? {
    
        guard let root = root else {
            // Root is nil so, we hit an empty spot recursing to our spot.
            // return new node.
            return BSTNode<T>(key: key)
        }
        
        // root is not nil
        if key < root.key {
            // recurse left if key is less than current node.
            root.left = insert(root: root.left, key: key)
            
        } else {
            // otherwise recurse right.
            root.right = insert(root: root.right, key: key)
        }
        
        return root
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
        
        return "pizza"
    }
}
