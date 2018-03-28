//
//  LinkedList.swift
//  DataStructures
//
//  Created by Aaron Connolly on 2/24/18.
//  Copyright © 2018 Top Turn Software. All rights reserved.
//

import Foundation

public class ListNode<T: Comparable>: Equatable {
    public var key: T
    public var next: ListNode<T>?
    
    public init(key: T) {
        self.key = key
        self.next = nil
    }

    // MARK: - Equatable Conformance
    public static func == <T>(lhs: ListNode<T>, rhs: ListNode<T>) -> Bool {
        return lhs.key == rhs.key && lhs.next == rhs.next
    }
}

public class LinkedList<T: Comparable> {
    
    // MARK: - Public properties
    
    public var length: Int {
        return counter
    }
    
    // MARK: - Stored properties
    
    private var head: ListNode<T>?
    private var counter: Int
    
    // MARK: - Inintializer
    
    public init() {
        head = nil
        counter = 0
    }
    
    // Consumer could fudge w/ the length. Would be safer to
    // calculate the length ourselves. We'll be trusting for now.
    public init(head: ListNode<T>, length: Int) {
        self.head = head
        self.counter = length
    }
    
    // MARK: - Public methods
    
    /*
     - Walks to end of list, appends new node
     - Increments counter
     */
    @discardableResult public func append(key: T) -> ListNode<T> {
        
        // Create a new node and increment the counter
        let newNode = ListNode<T>(key: key)
        
        // Guard the empty list case.
        guard !isEmpty() else {
            head = newNode
            counter += 1

            return newNode
        }
        
        // Head will never be empty at this point.
        var current: ListNode<T>? = head
        
        // Walk current pointer to end.
        // You're at the end when current.next == nil
        while current?.next != nil {
            current = current?.next
        }
        
        // Attach the new node, increment counter.
        current?.next = newNode
        counter += 1

        return newNode
    }
    
    public func contains(key: T) -> Bool {

        // Empty list case.
        guard !isEmpty() else { return false }
        
        var current: ListNode<T>? = head
        
        // Walk current and next to the end
        // Until we hit the value we're looking for.
        while current != nil {
            if current!.key == key {
                return true
            }
            current = current!.next
        }
        
        // We walked completely down the list
        // and didn't find our value.
        return false
    }
    
    public func insert(key: T, at index: Int) {
        
        // Note: Don't explicitly check for
        // empty list. Handle this in edge cases.
        
        // Check index bounds.
        switch index {
        case 0:
            // Make new node.
            let newNode = ListNode<T>(key: key)
            counter += 1
            
            newNode.next = head
            head = newNode
            break
        case length + 1:
            // Inserting after tail should append.
            append(key: key)
            break
        case length...Int.max:
            fatalError("FAIL: Out of bounds. Seriously, how am I supposed to know where to put this?")
        default:
            // Insert somewhere between 1 and length
            let newNode = ListNode<T>(key: key)
            counter += 1
            
            var currentIndex = 1
            var current: ListNode<T>? = head?.next
            var trailing: ListNode<T> = head!
            
            while current != nil {
                
                if currentIndex == index {
                    // Need to keep a trailing pointer
                    // so as to set the new node
                    newNode.next = current
                    trailing.next = newNode
                    break
                }

                // Keep track of the trailing node
                // and move current down the list
                trailing = current!
                current = current?.next
                
                currentIndex += 1
            }
            
            break
        }
    }
    
    public func remove(at index: Int) {
        fatalError("FAIL: Not implemented yet.")
        // check index bounds
        
        // A few cases to consider:
        // - removing at the head
        // - removing after the head but before the tail
        // - removing at the tail
        // - removing at length + x should crash with out of bounds error
    }
    
    // Prints each key with an arrow between them.
    public func printKeys() -> String {
        guard !isEmpty() else { return "List is empty!" }
        
        var current: ListNode<T>? = head
        var keyString: String = ""
        
        while current != nil {
            
            if keyString.count > 0 {
                keyString.append(" -> \(String(describing: current!.key))")
            } else {
                keyString.append("\(String(describing: current!.key))")
            }
            
            current = current!.next
        }
        
        return keyString
    }
    
    // MARK: - Private methods
    
    private func isEmpty() -> Bool {
        return head == nil
    }

    /*
     Traverses the list of nodes until
     it hits one whose next pointer is nil.
     This should always be the last node.
     */
    private func walkToEnd() -> ListNode<T>? {
        
        guard !isEmpty() else {
            return nil
        }
        
        // Head will never be empty at this point.
        var current: ListNode<T>? = head
        
        // Walk current pointer to end.
        // Will kick out when the current pointer's
        // next is nil.
        while current?.next != nil {
            current = current!.next
        }
        
        return current
    }
}

// Extensions for solving test questions ...
extension LinkedList where T: Hashable {
    
    // Returns true for success cases. Returns false otherwise.
    //
    // Follow up?
    // To do this in 0(1) space (w/o a hash or buffer) you could
    // keep two pointers, one for each index and a second to run
    // the lenght of the list checking for dupes of the key at the
    // current pointer. That would be 0(n^2) though.
    // Each time you move the main index you iterate only through
    // the remaining nodes.
    public func removeDupes() -> Bool {
        
        // Empty lists and 1-length lists won't have dupes.
        guard !isEmpty() && self.length > 1 else { return false }
        
        var prev: ListNode<T>? = head
        var current: ListNode<T>? = head
        var uniques: Set<T> = Set<T>()          // temp buffer
        var foundDupes: Bool = false
        
        while current != nil {
            
            if uniques.contains(current!.key) {
                
                // Remove node key found in set.
                // moving pointers.
                prev?.next = current!.next
                
                // Think: delete current?
                // Are we leaking a node object?
                foundDupes = true
            } else {
                // Add new node key to set.
                uniques.insert(current!.key)
                
                // move prev
                prev = current
            }
            
            current = current!.next
            
        }
        
        return foundDupes
    }
    
    // Given K, find the Kth to last element.
    // ex: K == 2, return the 2nd to last element.
    // ex: K == 5, return the 5th to last element.
    public func findKthToLast(k: Int) -> ListNode<T>? {
        
        // K is not zero-based. Needs to be converted.
        
        // Empty list?
        guard !isEmpty() else { return nil }
        
        // Ensure k is in bounds of our list's length (inclusively)
        // because k is not a zero-based input.
        guard (0...length).contains(k) else { return nil }
        
        let targetIndex = length - k
        var currentIndex: Int = 0
        var current: ListNode<T>? = head
        
        // Walk the list until you find the target index.
        while current?.next != nil {
            if targetIndex == currentIndex {
                break
            }
            current = current?.next
            currentIndex += 1
        }
        
        return current
    }
    
    // Takes an index, and slices off each node from that index
    // through the end of the list.
    public func sliceRight(from sliceIndex: Int) -> ListNode<T>? {
        
        // Can't slice an empty list.
        guard !isEmpty() else { return nil }
        
        // Can't slice outside the bounds of our list.
        guard (0..<length).contains(sliceIndex) else { return nil }
        
        // Low hanging fruit.
        if sliceIndex == 0 { return head }
        
        var currentIndex: Int = 0
        var previous: ListNode<T>? = head
        var current: ListNode<T>? = head
        
        while current?.next != nil {
            
            if currentIndex == sliceIndex {
                // current will be at slice point
                // sever the pointer from previous to current
                previous?.next = nil
                break
            }
            
            previous = current
            current = current!.next
            currentIndex += 1
        }
        
        return current
    }
    
    // Deletes a node in the middle (i.e. any node but the first
    // or last node, and not necessarily in the middle.).
    // Given: a -> b -> c -> d -> e -> f
    // Ex: Input "c"
    // Result: a -> b -> d -> e -> f
    // Returns true if succeeded, false otherwise.
    //
    // Assume all keys in the list are unique
    // Assumes key is not at the head or tail.
    public func deleteFromMiddle(key: T) -> Bool {
        
        guard !isEmpty() else { return false }
        
        guard head?.key != key else { return false }
        
        // check 1..<n for matching key, remove that node.
        var previous: ListNode<T>? = head
        var current: ListNode<T>? = head
        
        while current?.next != nil {
            if current!.key == key {
                // key found somewhere in the middle.
                // chop it out of the list.
                previous?.next = current!.next
                return true
            }
            
            previous = current
            current = current!.next
        }
        
        // no key found in the middle
        return false
    }
    
    // Partitions the list around a key value such that:
    // - All nodes < key come before all nodes >= key.
    // - If key exists in the list, the values of key only need to be
    //   after the elements < key.
    // - The partition element key can appear anywhere in the "right partition";
    //   it does not need to appear between the left and right partitions.
    //
    // Considerations:
    //  - What if all the keys are less than the partition?
    //  - What if the partition key exists in the list. Where do you put it?
    //
    // Approaches:
    //  - 1. create two lists, greaterThan and lessThan, add appropriate values to those
    //    new lists. merge the lists and return the final merge.
    //
    //  - 2. keep a head/tail pointer and prepend less than K values to the head. append
    //    greater than values to the tail. This only works if the original order of the keys
    //    doesn't matter.
    //
    public func partition(around key: T) -> LinkedList<T>? {
        
        // Empty case.
        guard !isEmpty() else {
            return nil
        }
        
        let originalLength = length
        
        var node = head
        var partitionHead: ListNode<T>? = node
        var partitionTail: ListNode<T>? = node
        
        // walks down the given node
        // prepending or appending the current node.
        while node != nil {
            let next = node!.next
            
            if node!.key < key {
                node!.next = partitionHead
                partitionHead = node
            } else {
                partitionTail!.next = node
                partitionTail = node
            }

            // move node down the list.
            node = next
        }
        
        partitionTail?.next = nil
        
        return LinkedList<T>(head: partitionHead!, length: originalLength)
    }

    // Lots of explicitly unwrapping of things happening.
    public func partition2(around key: T) -> LinkedList<T>? {
    
        // Empty case.
        guard !isEmpty() else {
            return nil
        }
        
        let originalLength = length
        
        var beforeStart: ListNode<T>? = nil
        var beforeEnd: ListNode<T>? = nil
        var afterStart: ListNode<T>? = nil
        var afterEnd: ListNode<T>? = nil
        var node = head
        
        while node != nil {
            let next: ListNode<T>? = node!.next
            node!.next = nil
            
            if node!.key < key {
                // insert node into end of before
                if beforeStart == nil {
                    beforeStart = node
                    beforeEnd = beforeStart
                } else {
                    beforeEnd?.next = node
                    beforeEnd = node
                }
                
            } else {
                if afterStart == nil {
                    afterStart = node
                    afterEnd = afterStart
                } else {
                    afterEnd?.next = node
                    afterEnd = node
                }
            }

            node = next
        }
        
        // There were no values found to be less than the key.
        if beforeStart == nil {
            return LinkedList<T>(head: afterStart!, length: originalLength)
        }
        
        // Connect the lists.
        beforeEnd!.next = afterStart
        
        return LinkedList<T>(head: beforeStart!, length: originalLength)
    }

    // Returns true if the list is a palindrome false otherwise.
    // Approaches:
    // - iterate through the list and put each key into an array.
    // - reverse the array. (using a stack means you don't have to reverse, I think)
    // - iterate again through the list and compare each element
    //   against its companion in the list.
    //
    public func isPalindrome() -> Bool {
        
        guard !isEmpty() else { return false }
        
        let stack = Stack<T>()
        
        // head pointer
        var current: ListNode<T>? = head
        
        // Push things onto stack.
        while current != nil {
            stack.push(key: current!.key)
            current = current!.next
        }
        
        print(stack)
        
        // start over at head again.
        current = head
        
        while current != nil {
            // if any key in the stack
            // doesn't match the key in the list
            // this can't be a palindrome
            if stack.pop() != current!.key {
                return false
            }
            
            current = current!.next
        }

        
        return true
    }

    /*
    Returns true if the current linked list intersects with the provided
    list at any point. The lists intersect if they connect with one another
    at some point, forming a Y shape. Put another way, they each have two
    nodes in common that point at the same node reference.

    Issues:
    - Lists may not be the same length, so we can't walk reliably
      down them each one node a time.
    - What if the lists don't store the same type key?
    - What if they intersect at the head?
    - What if they intersect at the tail?

     Notes:
     - Intersecting linked lists will always have the same last nodes
       because of their being intersected. That's one way to tell quickly.
       No common tail node? No intersection.
     - Can optimize my advancing the pointer of the longer list by the
       difference of the lengths. This is safe and they are not intersections
       because there aren't nodes in the other list that can be compared
       against.
     
    Approaches:
    - Walk down self's list and compare each node's next pointer,
      with each of the pointers in the other list, one at a time.
      this is 0(n^2) complexity. Not awesome.
    
     Hash?
    - use a hash of the list, its count and position in the list?
       the hash would be a storage of all the unique pointers and where
     they intersect or are duped, you'll have count == 2.
     
     Set?
     - Put each node in the list into a set, the just walk down the second
     list checking for nodes in the set, the first match you find is the intersecting node.
     
    */
    public func intersects(with otherHead: ListNode<T>) -> ListNode<T>? {
        
        // Guard the two empty cases.
        guard !isEmpty() else { return nil }
        guard otherHead.next != nil else { return nil }
        
        // Guard the head intersection case.
        guard head != otherHead else { return head }
        
        var current: ListNode<T>? = head
        var currentOther: ListNode<T>? = otherHead
        
        // Walk down self O(n)
        while current != nil {
            
            // Walk down the other list O(n)
            while currentOther != nil {
                
                // Compare current and current other's memory addresses.
                // If they're the same, we've got a match.
                if current === currentOther {
                    return current
                }
                
                currentOther = currentOther?.next
            }
            
            // Move currentOther back to the head
            currentOther = otherHead
            
            current = current?.next
        }
        
        // No match found :-(
        return nil
    }
}

// Making this a global func because it doesn't make sense to hang this off LinkedList, atm.
/*
 Considerations:
 - What if lhs is longer than rhs? What if rhs is longer than lhs? Figure out which is longer?
 - Move them both into arrays, from there you know their lengths and don't have to muck w/ pointers.
 */
public func sumLists(lhs: ListNode<Int>, rhs: ListNode<Int>) -> LinkedList<Int>? {
    
    // Important to know which is longer for mathings.
    // Walk down each list with pointers 0(n) + 0(m) time and 0(n) and 0(m) space.
    // Copying into longer/shorter is a bit wasteful.
    
    var leftCurrent: ListNode<Int>? = lhs
    var left = [Int]()

    while leftCurrent != nil {
        left.append(leftCurrent!.key)
        leftCurrent = leftCurrent!.next
    }
    
    // now the right...
    var rightCurrent: ListNode<Int>? = rhs
    var right = [Int]()
    
    while rightCurrent != nil {
        right.append(rightCurrent!.key)
        rightCurrent = rightCurrent!.next
    }
    
    // Which is longer/shorter/
    let longer: [Int] = left.count >= right.count ? left : right
    let shorter: [Int] = left.count < right.count ? left : right
    
    var sum: [Int] = [Int]()
    var localSum: Int = 0
    var carryOne: Bool = false
    
    // Add the items at each index. Carrying the one if necessary.
    for i in 0..<longer.count {
        
        // Check out of bounds on shorter list
        if i < shorter.count {
            localSum = longer[i] + shorter[i]
            
            // Check for carried one digit.
            if carryOne {
                localSum += 1
                carryOne = false
            }
            
            // This might be >= 10, but we just want the ten's digit
            // and to flag the fact that we're "carrying" the one
            // to the next add operation.
            // Hint: remember elementary school addition
            if localSum >= 10 {
                carryOne = true
                localSum = abs(10 - localSum)
            }
            
        } else {
            localSum = longer[i]
            
            // Check for carried one digit.
            if carryOne {
                localSum += 1
                carryOne = false
            }
        }
        
        sum.append(localSum)
    }
    
    print("longer", longer)
    print("shorter", shorter)
    print("sum", sum)

    // return sum as LinkedList
    let result = LinkedList<Int>()
    sum.forEach { n in
        result.append(key: n)
    }

    return result
}



