//: Playground - noun: a place where people can play

import UIKit
import DataStructures

/*
 Check Balanced
 Implement a function to check if a binary tree is balanced. For the purposes of this question, a balanced tree is defined to be a tree such that the heights of the two substrees of any node never differ by more than one.
 
 Need to define exactly what a balanced means.
 
 A Balanced Binary Tree:
 -----------------------
 - Usually means not overly imbalanced.
 - Usually means you can reasonably guaranatee a 0(log n) insertion, deletion and searching. Logarithmic time.
 - Usually means that the depths of the subtrees do not differ by more than 1
 */

var nums = [3, 4, 5, 6, 8, 10, 12, 16]
var root = BST<Int>.createMinimalBST(from: nums)
BST<Int>.height(root: root)
BST<Int>.isBalanced(root: root)

