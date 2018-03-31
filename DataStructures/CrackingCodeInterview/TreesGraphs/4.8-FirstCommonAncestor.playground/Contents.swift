//: Playground - noun: a place where people can play

import UIKit

/*
 First Common Ancestor
 Design an algorithm and write code to find the first common ancestor of two nodes in a binary tree. Avoid storing additional nodes in a data structure: NOTE: This is _not_ necessarily a Binary Search Tree.
 
 Questions:
 - Would I know the root? If so I could calculate heights/distance from node A and Node B to root.
 - Would knowing the height of each node A, B make a difference?
   Height relative to what, though?We don't know the root node.
   You could, if you have a parent pointer walk backwards up the parent, counting each level
   until the parent is nil. That would be the height of the node.
 - Do nodes have pointers to their parents? There's no way to look "up" from a given node w/o this.
 
 Common Ancestor definition:
 - The Node X at which Node A and Node B's subtree splits apart.
 
 Ex:
 
        __9__
       /     \
      6       5

 commonAncestor(6, 5) -> 9
  - 6 and 5's common ancestor is 9.
 
 
 Possible Issues:
 - What if Node A and Node B are part of the same subtree? Do they have a common ancestor?
 
        __9__
       /
      7
     /
    4
 
 commonAncestor(4, 7) -> 9 ?
 - is accurate to say that 4 and 7 share the common ancestor -> 9
 - Yes.
 
            ____9____
           /         \
        __7__       __3__
       /     \     /     \
     _4_      5   1       10
    /    \
   6      8
 
 
 Approach 1 (meh):
 - do a DFS for Node A storing that path to Node A in a set A
 - do a DFS for Node B storing that path to Node B in a set B
 - determine if set A and set B
 
 Approach 2:
 - Take Node A and BFS for Node B. If Node B is in Node A's subtree, their first common ancestor must be Node A's direct parent. Done. If it wasn't found, then
 - Take Node B and BFS for Node A. If Node A is in Node B's subtree, their first common ancestor is Node B's direct parent. If it wasn't found, Node A and Node B are separate sub trees.
 - Compare Node A and Node B's parents until
 
 */
