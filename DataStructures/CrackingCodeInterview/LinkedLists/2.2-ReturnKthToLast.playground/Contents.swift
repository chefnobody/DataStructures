//: Playground - noun: a place where people can play

import Foundation
import DataStructures

/*
 Return Kth to last. Implement an algorithm to return the kth-to-last element of a singly linked list.
 example: K == 2, return the second to last element in the list.
 */

let list = LinkedList<Int>()
list.append(key: 31)
list.append(key: 35)
list.append(key: 37)
list.append(key: 38)
list.append(key: 39)
list.append(key: 40)
let kth: ListNode<Int>? = list.findKthToLast(k: 3)      // key == 38
if let k = kth {
    print(k.key)
} else {
    print("no key found")
}

//print(kth)


