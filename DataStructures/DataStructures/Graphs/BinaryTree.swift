//
//  Tree.swift
//  DataStructures
//
//  Created by Aaron Connolly on 2/28/18.
//  Copyright © 2018 Top Turn Software. All rights reserved.
//

import Foundation

public class BinaryTreeNode<T> {
    var key: T
    var left: BinaryTreeNode<T>?
    var right: BinaryTreeNode<T>?
    init (key: T) {
        self.key = key
    }
}

public class BinaryTree<T> {
    private var root: BinaryTreeNode<T>?
    
    init() {}
    
    func inOrderTraverse(node: BinaryTreeNode<T>?) {
        guard let node = node else { return }
        
        inOrderTraverse(node: node.left)
        print(node.key)
        inOrderTraverse(node: node.right)
    }
    
    func preOrderTraverse(node: BinaryTreeNode<T>?) {
        guard let node = node else { return }

        print(node.key)
        preOrderTraverse(node: node.left)
        preOrderTraverse(node: node.right)
    }
    
    func postOrderTraverse(node: BinaryTreeNode<T>?) {
        guard let node = node else { return }
        
        postOrderTraverse(node: node.left)
        postOrderTraverse(node: node.right)
        print(node.key)
    }
}
