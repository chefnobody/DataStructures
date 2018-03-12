//: Playground - noun: a place where people can play

import UIKit
import DataStructures

/*
 Delete Middle Node:
 Implement an algorithm to delete a node in the middle (i.e., any node but the first and last node, not necessarily the exact middle) of a singly linked list, given only access to that node.
 
 */

let list = LinkedList<Int>()
list.append(key: 1)
list.append(key: 2)
list.append(key: 3)
list.append(key: 4)
list.append(key: 5)
list.append(key: 6)
list.append(key: 7)
list.append(key: 8)

list.deleteFromMiddle(key: 1)   // false
list.deleteFromMiddle(key: 8)   // false

list.deleteFromMiddle(key: 4)   // true
print(list.printKeys())
// 1 -> 2 -> 3 -> 5 -> 6 -> 7 -> 8

