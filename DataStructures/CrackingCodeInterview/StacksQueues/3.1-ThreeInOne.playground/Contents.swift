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
 
 Approach 3:
 - Keep each stack's items at the 0, 1, 2 places respectively.
 - Keep track of the length of each stack.
 - Items from stack1 will never been in a position mod 2 == 0
 - Items from stack2 will never be in a position
 something like this:
 
 let arr = [
    stack1Index0, stack2Index0, stack3Index0,           // 0th index takes slots 0-2
    stack1Index1, stack2Index1, stack3Index1, ...       // 1st index takes slots 3-5
                                                        // 2nd index takes slots 6-8
    ... ]
 
 - This let's us pop with 0(1) speed and if we know the length we can easily
 move the 2nd through N items in the stack to the stack's places in the array
 - Each time we add a value to any stack, we should increase the capacity by 3 slots
 but we know if this is wasteful.
 - Periodically we may want to clean up the empty memory left allocated in the array
 by the pushing and popping.
 
 */

enum AbstractStack {
    case one
    case two
    case three
}

struct StackWrapper<T: Hashable> {
    
    private var stack1Count: Int
    private var stack2Count: Int
    private var stack3Count: Int
    
    // Memory buffer for our 3 abstract stacks
    private var memory: [T?]
    
    init() {
        
        stack1Count = 0
        stack2Count = 0
        stack3Count = 0

        // Memory has 3 slots
        // Bah! Fixed-length arrays are not supported in Swift
        // Let's take 1024 slots (whatever that looks like).
        memory = [T?](repeatElement(nil, count: 1024))
    }
    
    // MARK: - Public methods
    
    mutating func pushStack1(key: T) {
        let offset = 0
        let insertionIndex = (stack1Count * 3) + offset
        memory[insertionIndex] = key
        stack1Count += 1
    }
    
    mutating func popStack1() -> T? {
        let extractionIndex = (stack1Count - 1) * 3
        let key = memory[extractionIndex]
        memory[extractionIndex] = nil
        stack1Count -= 1
        return key
    }
    
    mutating func pushStack2(key: T) {
        let offset = 1
        let insertionIndex = (stack2Count * 3) + offset
        memory[insertionIndex] = key
        stack2Count += 1
    }
    
    mutating func popStack2() -> T? {
        let offset = 1
        let extractionIndex = (stack2Count - 1) * 3 + offset
        let key = memory[extractionIndex]
        memory[extractionIndex] = nil
        stack2Count -= 1
        return key
    }
    
    mutating func pushStack3(key: T) {
        let offset = 2
        let insertionIndex = (stack3Count * 3) + offset
        memory[insertionIndex] = key
        stack3Count += 1
    }
    
    mutating func popStack3() -> T? {
        let offset = 2
        let extractionIndex = (stack3Count - 1) * 3 + offset
        let key = memory[extractionIndex]
        memory[extractionIndex] = nil
        stack3Count -= 1
        return key
    }
    
    mutating func push(key: T, stack: AbstractStack) {
        // refactor 
    }
    
    mutating func pop(stack: AbstractStack) -> T? {
        return nil
    }
    
    // This is super inefficient now with our crazy large allocation.
    func printMemory() -> String {
        return memory.map{ $0 == nil ? "nil" : String(describing: $0!) }.joined(separator: ",")
    }
}

var threeStacks = StackWrapper<Int>()
threeStacks.printMemory()
threeStacks.pushStack1(key: 31)
threeStacks.pushStack2(key: 7)
threeStacks.pushStack2(key: 19)
threeStacks.printMemory()
var popped = threeStacks.popStack1() // 31
threeStacks.printMemory()
popped = threeStacks.popStack2()    // 19
threeStacks.printMemory()
popped = threeStacks.popStack2()    // 7
threeStacks.printMemory()           // empty
threeStacks.pushStack3(key: 45)
threeStacks.printMemory()
threeStacks.pushStack3(key: 99)
popped = threeStacks.popStack3()
threeStacks.printMemory()

