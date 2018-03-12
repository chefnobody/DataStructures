//: Playground - noun: a place where people can play

import UIKit
import DataStructures

/*
 Partition:
 Write code to partition a linked list around a value X:
 - such that all nodes whose keys are less than X come before all nodes greater than or equal to X.
 - if X is contained within the list, the values of X only need to be after the elements less than X (example below).
 - The partition can appear anywhere in the "partition"; it does not need to appear between the left and right partitions."
 Ex:
 Input:         3 -> 5 -> 8 -> 5 -> 10 -> 2 -> 1 (partition = 5)
 Output:        3 -> 1 -> 2 -> 10 -> 5 -> 5 -> 8
 
 Definition of partition:
 - to divide into parts; break-up; split or sub divide.

 Ideas:
 - Partition value is sort of an axis?
 
 Approach 1:
 - Create a List A for all elements less than the pivot.
 - Create a List B for all elements greater than the pivot, including the pivot if available.
 - Join the two lists A -> B ?
 */

let list = LinkedList<Int>()
list.append(key: 3)
list.append(key: 5)
list.append(key: 8)
list.append(key: 5)
list.append(key: 10)
list.append(key: 2)
list.append(key: 1)
list.printKeys()

let partitionedList = list.partition2(around: 5)
dump(partitionedList)
