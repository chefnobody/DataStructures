//: Playground - noun: a place where people can play

import UIKit
import DataStructures

/* Sum Lists:
 You have two numbers represented by a linked list, where each node contains a single digit. The digits are stored in reverse order, such that the 1's digit is at the head of the list. Write a function that adds the two numbers and returns the sum as a linked list.
 
 Approach: collapse lists into strings, then cast to numbers, do the math, convert back to a string, then to an array then to a linked list.
 
 Approach: Since you're working backwards you can think of elementry school addition where you added the first two numbers and carried the remainder from 10, to the next add. Do that until you have no more remainder or numbers to add.
 
 Examples:
 Input (7 -> 1 -> 6) + (5 -> 9 -> 2)
  this is 617 + 295 = 912
 
 Output: 2 -> 1 -> 9
 
 Extra credit: suppose the numbers are stored in forward order. Repeat the above problem.
 
 Use second approach, but start from the tail and move forward? Requires a doubly-linked list.
 */

let left = LinkedList<Int>()
let leftHead = left.append(key: 8)
left.append(key: 7)
left.append(key: 4)
left.append(key: 9)
left.append(key: 3)
left.printKeys()

let right = LinkedList<Int>()
let rightHead = right.append(key: 7)
right.append(key: 1)
right.append(key: 9)
right.append(key: 8)
right.printKeys()

let sum = sumLists(lhs: leftHead, rhs: rightHead)
dump(sum)

