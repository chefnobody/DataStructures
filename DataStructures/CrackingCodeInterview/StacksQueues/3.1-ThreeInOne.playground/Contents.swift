//: Playground - noun: a place where people can play

import Foundation
import DataStructures

/*
 Three in One:
 Describe how you could use a single array to implement three stacks.

 This is a confusing question.
 
 Remember:
 - Stacks are structures where the most recently added item is removed first.
 
 Questions:
 - What values does this array hold? The same values that are in the stacks?
 - Are the three stacks just pointers thang hang out at index 0, 1, 2 of the array?
 - Must the each stack use the same contiguous space in memory of that array?
 - When you say implement three stacks, do you mean we have some API that has 3 different
   push/pop methods that interact w/ those underlying and independent "stack"s?
 
 Approach 1:
 - divide the array into three chunks, creating three 0-indexes for the root
   or head of each stack, and a length for each stack?
 - or dividing the array but keeping track of the various ranges of the stacks?
 instead of managing indexes and lengths.
   Upside: Keeps all the data for a given stack together.
   Downside: Means shifting data as you push things onto stacks.
 
 
 Approach 2:
 - let users of your API have access to 3 stacks via public varaiables
   or better yet just push/pop methods onto those stacks?
 - that way our struct could manage what memory is avaiable and where
   for pushing/popping from the specified stack.
 */

/*
 this is a structure whose memory allocated for each stack
 is bound by the array. One array for three stacks.
 */

fileprivate struct AbstractStack {
    var headIndex: Int
    var nextIndex: Int
    var length: Int
}

fileprivate struct StackWrapper<T: Hashable> {
    
    // Pointers to places within array.
    private var stack1: AbstractStack
    private var stack2: AbstractStack
    private var stack3: AbstractStack
    
    // Memory buffer for our 3 abstract stacks
    private var memory: [T]
    
    init() {
        // All three stack positions start at 0, 0
        stack1 = AbstractStack(headIndex: -1, nextIndex: -1, length: 0)
        stack2 = AbstractStack(headIndex: -1, nextIndex: -1, length: 0)
        stack3 = AbstractStack(headIndex: -1, nextIndex: -1, length: 0)
        
        // Memory is empty
        memory = [T]()
    }
    
    // MARK: - Public methods
    
    mutating func pushStack1(key: T) {
        
        // append key in memory, retaining the index
        let insertIndex = memory.count
        memory.insert(key, at: insertIndex)
        
        // Update stack state.
        stack1.length += 1
        stack1.nextIndex = stack1.headIndex
        stack1.headIndex = insertIndex
    }
    
    mutating func popStack1() -> T? {
        
        // Find position of stack1
        let extractionIndex = stack1.headIndex
        
        // Remove from memory. .. but doh' that jacks
        // with a buffer full of values....
        memory.remove(at: extractionIndex)
        
        let newHead = stack1.nextIndex
        // how do we find the next index after removing?
        
        stack1.length -= 1
        
        return nil
    }
    
    mutating func pushStack2(key: T) {
        
    }
    
    mutating func pushStack3(key: T) {
    
    }
}


