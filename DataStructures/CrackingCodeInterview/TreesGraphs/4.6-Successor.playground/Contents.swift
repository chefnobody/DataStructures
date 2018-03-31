//: Playground - noun: a place where people can play

import UIKit
//import DataStructures

/*
 Successor
 Write an algorithm to find the "next" node (i.e. in-order successor) of a given node in a Binary Search Tree. You may assume that each node has a link to its parent.
 
 In-order means the next node whose value is closest and greater to the node in question. Don't confuse in-order with traversing.
 
 */

//var nums = [6, 4, 7, 19, 20, 2, 5, 9, 8, 10, 13]
//var root = BST.prepareTree(with: &nums)     // BST<Int>.createMinimalBST(from: nums)
//var height = BST.height(root: root)
//
//// Given this tree ....
//print(BST<Int>.treeString(root!, using: { ("\($0.key)", $0.left, $0.right) }))
//print(BST<Int>.inOrderTraverse(node: root))
//
////minValue(root: root)
//
//// The in-order successor of 5, is 6.
//// The in-order successor of 6, is 7
//// The in-order successor of 7, is 8.
//// Etc... etc...
//
///*
// To find an in-order successor you need to know the node whose in-order you need to find.
// In-order traversal should walk through the tree the way we want.
// 
// We have found the in-order successor to our target node if we've reached the left-most node
// of the right subtree.
// 
// Put another way, the node w/ the smallest key greater than the target key, is the in-order successor.
// 
// Approach:
// - search the right subtree of our target node for it's left-most leaf-node.
// - if there is no right subtree, search back up the list using the parent until you find
//   the node above that's greater than the target node.
// */
//
//func minValue(root: BSTNode<Int>?) -> BSTNode<Int>? {
//    guard let node = root else {
//        return nil
//    }
//    
//    if node.left == nil {
//        return node
//    }
//    
//    // recurse down the left
//    return minValue(root: node.left)
//}
//
//func findInOrderSuccessor(root: BSTNode<Int>?) -> BSTNode<Int>? {
//    guard let node = root else {
//        return nil
//    }
//    
//    // If the right side of the node is not nil
//    // Find the minimum value there.
//    if node.right != nil {
//        return minValue(root: node.right)
//    }
//    
//    // Otherwise, walk back up the list with the node's parent
//    // reference and as soon as you find a key value, greater
//    // the current node, that's your successor.
////    while
////    var parent = node.parent
//    
//    return nil
//}

