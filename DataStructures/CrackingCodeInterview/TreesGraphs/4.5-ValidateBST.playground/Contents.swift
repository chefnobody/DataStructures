//: Playground - noun: a place where people can play

import UIKit
import DataStructures

/*
 Validate BST
 Implement a function to check if a binary tree is a Binary Search Tree
 
 What makes a Binary Tree a Binary Search Tree?
 Left Node <= Current Node < Right Node
 
 Approach 1:
 - Copy tree to array, then ensure the array is sorted in ascending order.
 - This doesn't account for dupe values in the tree some of which could be ordered such
 that you indeed have an invalid BST but your array ordering can't tell the difference.
 
 Approach 2:
 - Do an in-order traversal and keep track of the last node value you looked at.
 - In order will visit left, current then right nodes of a subtree, so keeping the
 left <= current < right should be sufficient.
 
 
 */

var nums = [3, 4, 5, 6, 8, 10, 12, 16]
var lastSeen: Int? = nil

// Creates a wonky left leaning BST because of
// the order of the numbers
var root = BST<Int>.prepareTree(with: &nums)
BST<Int>.height(root: root)
BST<Int>.isValidBST(root: root, lastSeen: &lastSeen)
BST<Int>.isValidBSTMinMax(root: root)

// Creates a BST by definition.
root = BST<Int>.createMinimalBST(from: nums)
BST<Int>.height(root: root)
lastSeen = nil
BST<Int>.isValidBST(root: root, lastSeen: &lastSeen)
BST<Int>.isValidBSTMinMax(root: root)

// Create an invalid BST by hand.
var node8 = BSTNode<Int>(key: 8)
var node2 = BSTNode<Int>(key: 2)
var node7 = BSTNode<Int>(key: 7)
var node10 = BSTNode<Int>(key: 10)
var node31 = BSTNode<Int>(key: 31)
var node4 = BSTNode<Int>(key: 4)
var node5 = BSTNode<Int>(key: 5)
var node1 = BSTNode<Int>(key: 1)

// Node 8 will be root.
node8.left = node2
node8.right = node10

node2.left = node1
node2.right = node31

/*
        8
       / \
      2   10
     / \
    1   31
 
 */

BST<Int>.height(root: node8)
lastSeen = nil
BST<Int>.isValidBST(root: node2, lastSeen: &lastSeen)    // should be false because 31 is to the left of 8.
BST<Int>.isValidBSTMinMax(root: node8)

