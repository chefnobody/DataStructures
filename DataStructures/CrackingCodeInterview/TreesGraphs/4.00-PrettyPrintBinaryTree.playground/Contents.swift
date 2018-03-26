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
 
 A 1-level deep tree will have:
 - 5 total characters (2 padding chars on the left and right)
 - 1 line tall.
 
 What if the paddings were factors of 2, then you could use power's of the level to know how wide to make it.
 
 (level = 1, max height = 1, spacing = 3 ^ 1 = 3)
 ---6---
 
 (level = 1, max height = 2, spacing = 3 ^ 2 = 9)
 ---------6---------
 
 (level = 1, max height = 3, spacing = 3 ^ 3 = 27)
 ---------------------------6---------------------------
 
 --__6__--  level 1, max height 2, spacing = 4
 -/-----\-
 4-------9  level 2, max height 2, spacing = 0
 
 A 3-level deep tree will have:
 
 ------____6____------  level 1, max height 3, spacing 12 (diff of 0)
 -----/---------\-----
 --__4__-------__9__--  level 2, max height 3, spacing 6 (diff of -6)
 -/-----\-----/-----\-
 2-------5---8------10  level 3, max height 3, spacing 2 (diff of -4)

 At level 1, you have the widest spacing.
 At higher levels you subtract spacings.
 
 
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
var nums = [6]
var root: BSTNode<Int>? = BST.prepareTree(with: &nums)
var height = BST.height(root: root)
var pretty = BST.prettyPrint(root: root)
print(pretty)

nums = [6, 4, 2, 5, 9, 8, 10]
root = BST.prepareTree(with: &nums)
height = BST.height(root: root)
pretty = BST.prettyPrint(root: root)
print(pretty)

// Really tall tree, leaning left.
nums = [8, 7, 6, 5, 4, 3, 2, 1]
root = BST.prepareTree(with: &nums)
height = BST.height(root: root)

// Unit tests:
BST<Int>.paddingSpaces(for: 1, totalHeight: 1)      // 3
BST<Int>.paddingSpaces(for: 1, totalHeight: 2)      // 9
BST<Int>.paddingSpaces(for: 1, totalHeight: 3)      // 27

BST<Int>.paddingSpaces(for: 2, totalHeight: 1)      // bad data
BST<Int>.paddingSpaces(for: 1, totalHeight: 2)      // 9
BST<Int>.paddingSpaces(for: 2, totalHeight: 2)      // 3

// Simplest case:
nums = [6]
root = BST.prepareTree(with: &nums)
height = BST<Int>.height(root: root)
BST<Int>.createLine(for: 1, nodes: [root], totalHeight: height)
BST<Int>.createLine(for: 2, nodes: [root], totalHeight: height)  // bork

// Simpler case:
nums = [6, 2]
root = BST.prepareTree(with: &nums)
height = BST.height(root: root)
BST.createLine(for: 1, nodes: [root], totalHeight: height)
BST.createLine(for: 2, nodes: [root], totalHeight: height)
BST.createLine(for: 3, nodes: [root], totalHeight: height)  // bork




