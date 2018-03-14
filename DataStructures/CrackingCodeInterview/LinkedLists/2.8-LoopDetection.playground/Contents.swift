//: Playground - noun: a place where people can play

import UIKit
import DataStructures

/*
 Loop Detection:
 
 Given a circular linked list, implement an algorithm that returns the node at the beginning of the loop.
 
 DEFINITION:
 - Circular linked list: A (corrupt) linked list in which a node's next pointer points to an earlier node,
 so as to make a loop in the linked list.
 
 Example: A -> B -> C -> D -> E -> C [the same C node as earlier (by reference)]
 Output: C
 
 Approaches?
 - Can you use a Hash? Does that use reference semantics for determining equivalence?
 - Can you use a Set? Does that use reference semantics for determining equivalence?
 - The node will be equivalent if it shares the same key and has the same next pointer.
   You could check for that.
 - Loop down the list creating a new list at the same time, checking the new list to see
 if you already have that new item in it (by reference) if so, that new item is your dupe.

 A circular list has no tail :-)

 */

func findLoop(in head:ListNode<String>) -> ListNode<String>? {
    
    // Set
    var set = Set<String>()
    var current: ListNode<String>? = head
    
    while current != nil {
        
        // push things into set until you have a collision.
        if set.contains(current!.key) {
            return current
        } else {
            set.insert(current!.key)
        }
        
        current = current!.next
    }
    
    return nil
}

// Build list by hand.
let head = ListNode<String>(key: "A")
let b = ListNode<String>(key: "B")
let c = ListNode<String>(key: "C")
let d = ListNode<String>(key: "D")
let e = ListNode<String>(key: "E")

// Wire up the list.
head.next = b
b.next = c
c.next = d
d.next = e
e.next = c

let link = findLoop(in: head)
dump(link)

