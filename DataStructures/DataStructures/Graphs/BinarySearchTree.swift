//
//  Tree.swift
//  DataStructures
//
//  Created by Aaron Connolly on 2/28/18.
//  Copyright © 2018 Top Turn Software. All rights reserved.
//

import Foundation

public class BSTNode<T> {
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
    
    // Finds the right place for this key to hang in the tree.
    static public func insert(root: BSTNode<T>?, key: T) -> BSTNode<T>? {
    
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
    
    // Pretty prints a binary tree.
    // Think of the tree as stored in an array (this is how a heap works):
    // https://en.wikipedia.org/wiki/Binary_heap#Heap_implementation
    // - Array stores tree in breadth first order. [Parent, Left Child, Right Child, ...],
    // - How would you find the place in the array for a given level and then which is the left and which is the right node at that level?
    static public func prettyPrint() -> String {
        return "Pizza!"
    }
}
