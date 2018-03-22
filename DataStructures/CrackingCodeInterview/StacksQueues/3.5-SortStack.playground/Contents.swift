//: Playground - noun: a place where people can play

import Foundation
import DataStructures

/*
 Sort Stack:
 Write a program to sort a stack such that the smallest items are on the top. You can use an additional temporary stack, but you may not copy the elements into any other data structure (such as an array). The stack supports the following operations: push, pop, peek and isEmpty.
 
 Concerns:
 - We're sorting in ascending order. Will we ever need to sort in descending order?
 - Can use only one additional stack. Can not use an array.
 
 Approaches
 - Keep a second stack for swapping/reversing, that is used to preserve the ordering
 - When pushing check if the new item is less than the head of the ordered stack.
   - If its less you can push it onto the ascending ordered stack.
   - If its larger than the item in the ascending ordered stack, reverse the stack
     into descending order, then push on the reversed stack. Finally, reversed that
     stack back into ascending order before accepting.
     - Might be better to keep an enum of the current order of the internal stack, so we
       don't reverse too often. If we push two large numbers we'll reverse the stack 4 times.
     - So maybe reverse the stack only when you need to.
 This has a flaw, though: if you insert 100 onto 4,5,6 you get 4,5,6,100.
 Next, if you insert 1 you get 1,4,5,6,100.
 Then if you insert 2 you get 1,4,5,6,100,2 // doh. 2 should go between 1 and 4.
 
 */

let ss = SortedStack<Int>()
ss.push(key: 2)
ss.push(key: 3)
ss.push(key: 4)
ss.push(key: 0)
ss.push(key: 7)
ss.push(key: 12)
ss.push(key: 1) // DOH! 1 < 0, but > 12... need to put it between 0 and 2....
print(ss.printKeys())

//ss.push(key: 9)
//ss.push(key: 8)
// Sorted stack should always be sorted ascending order


