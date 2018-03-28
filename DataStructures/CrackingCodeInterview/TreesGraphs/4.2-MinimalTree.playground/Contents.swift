//: Playground - noun: a place where people can play

import Foundation
import DataStructures

/*
 Minimal Tree:
 Given a sorted (increasing order) array with unique integer elements, write an algorithm to create a binary search tree with minimal height.
 
 Issues:
 - After each insert, the increasing values are going to make the tree, right-leaning.
 - So you need to balance after each insert.
 
 To create a tree of minimal height you need the nodes on the left subtree to be roughly the same as the nodes on the right.
 This means the root should be the middle.
 */

var nums = [3, 4, 5, 6, 8, 10, 12, 16]
var root = BST<Int>.prepareTree(with: &nums)
BST.height(root: root)

nums = [3, 4, 5, 6, 8, 10, 12, 16]
root = BST<Int>.createMinimalBST(from: nums)
BST<Int>.height(root: root)
