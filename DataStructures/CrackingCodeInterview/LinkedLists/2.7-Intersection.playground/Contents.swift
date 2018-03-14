//: Playground - noun: a place where people can play

import UIKit
import DataStructures

/*
 Intersection:
 - Given two (singly) linked lists, determine if the two lists intersect.
 - Return the intersecting node.
 - Note that the intersection is defined based _on reference, not value_.
   That is, if the Kth node of the first linked list is the exact same node (by reference)
   as the Jth node of the second linked list, then they are intersecting.
 
 Helpful image?
    - A zipper meeting at some point is the point where it intersects. Think: Y
    - Intersection is not a cross X, or like the intersection of a street.
 */

// Build a list
let list = LinkedList<Int>()
list.append(key: 44)
list.append(key: 71)
list.append(key: 189)

let thirtyOne = list.append(key: 31)
let ninety = list.append(key: 90)
let eight = list.append(key: 8)
let fifteen = list.append(key: 15)
let fourty = list.append(key: 40)

// Build a list by hand
let otherHead = ListNode<Int>(key: 31)
otherHead.next = thirtyOne

// Ensure they intersect
list.intersects(with: otherHead) === thirtyOne

// Ensure chain pointers are also the same
thirtyOne.next === ninety
ninety.next === eight
eight.next === fifteen
fifteen.next === fourty
