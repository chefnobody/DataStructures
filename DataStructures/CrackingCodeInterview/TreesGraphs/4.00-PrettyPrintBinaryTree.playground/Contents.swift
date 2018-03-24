//: Playground - noun: a place where people can play

import Foundation


/*
 Pretty Print a Binary Tree
 
 --------6---------
 ------/---\-------
 -----/-----\------
 ----4-------8-----
 --/---\---/---\---
 -2-----5--9-------
 
 * With backslashes and forward slashes you run out of
   room really quickly.
 * Can we do better w/ underscores to push the levels with
   fewer nodes, wider?
 
 Lets look for a pattern...
 
 When pretty-printed:
 
 A 2-level deep tree will have:
   - 13 characters wide (only accounts for single digit keys, btw)
   - 2 lines tall which is (2 * height) - 1
 
 ----__6__----          // 2 underscores on either side.
 ---/-----\---
 --4-------9--          // 0 understcores on either side.
 
 A 3-level deep tree will have:
  - 25 characters wide? (only accounts for single digit keys, btw)
  - 5 lines tall. That is ((2 * height) - 1) lines tall?
 
 --------____6____--------            // 4 underscores either side
 -------/---------\-------
 ----__4__-------__9__----            // 2 underscores either side
 ---/-----\-----/-----\---
 --2-------5---8------10--            // 0 underscores on last level
 
 Concerns:
 - Padding the printing from the left edge. How do you do this?
 - What do you do about large numbers with 2, 3 and 4 characters? We need to consider the character count for a given number.
 - How do you calculate the back slash/forward slash placements? Do you want multiple layers of those?
 - How wide do the slash-levels need to be to accomodate all the sub-trees?
 
 - Given a tree with N nodes, how many characters wide should each level K be? This will probably be constant for each level K.
 - A binary tree w/ K levels will have at most 2^K + 1 nodes.
 
 Required inputs:
 - Height of tree. How many levels are there?
 
 */

import DataStructures
var nums = [6, 4, 2, 5, 9, 8, 10]
let root: BSTNode<Int>? = BST.prepareTree(with: &nums)
let height = BST.height(root: root)
print("yes! Pizza!")

//
//func prettyPrintSlashes() -> String {
//    return "slashes"
//}

