//: Playground - noun: a place where people can play

import UIKit
import DataStructures

/*
 List of Depths
 Given a binary tree, design an algorithm which creats a linked list of all nodes at each depth (e.g. if you have a tree with depth D, you'll have D-linked lists)
 */

var nums = [3, 4, 5, 6, 8, 10, 12, 16]
var root = BST<Int>.createMinimalBST(from: nums)
BST<Int>.height(root: root)

var levelList = [LinkedList<BSTNode<Int>>]()
BST.createListOfLevels(root: root, levelsList: &levelList, level: 0)

levelList.forEach{ list in
    print(list.printKeys())
}
