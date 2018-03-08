//: Playground - noun: a place where people can play

import Foundation
import DataStructures

/*
 Remove Dupes:
 Write code to remove duplicates from an unsorted linked list.
 
 Follow up:
    - How could you solve this problem if a temporary buffer were not allowed?
 */

// Build a linked list with unsorted numbers.
// Dupes are 0, 10, 4.
let numbers = [0, 10, 8, 10, 5, 6, 9, 0, 1, 2, 4, 3, 4]
let list = LinkedList<Int>()
numbers.forEach { list.append(key: $0) }
print(list.printKeys())

/*
 - Considerations:
   - What if there are no dupes? Can we optimize out of that scenario?
   - What if there are more than two dupes? Like 3 or 4 dupes?
 
 - if list is unsorted we need to keep a set of only the uniques
 - each time we hit a new node if that node's key exists in the set
   this is a dupe and it needs to be removed.
 - if its not in the set, we add it.
 
 */
