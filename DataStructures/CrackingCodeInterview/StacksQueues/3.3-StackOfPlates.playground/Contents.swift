//: Playground - noun: a place where people can play

import Foundation
import DataStructures

/*
 Stack of Plates
 Imagine a (literal) stack of plates. If the stack gets too high, it might topple. Therefore in real life, we would likely start a new stack when the previous stack exceeds some threshold. Implement a data structure `SetOfStacks` that mimics this. `SetOfStacks` should be composed of several stacks and should create a new stack once the previous one exceeds capacity. `SetOfStacks.push()` and `SetOfStacks.pop()` should behave identically to a single stack (that is, pop() should return the same values as it would if there were just a single stack.)
 
 Extra Credit:
 Implement a function `popAt(index: Int) -> Node<T>` which performs a pop operation on a specific sub-stack.
 
 Considerations:
 - What is the "treshold" that forces new stacks to be created?
 - Need some sort of interal way of knowing which stack we're working on right now.
 */


let stacks = SetOfStacks<Int>(fixedSize: 2)
stacks.push(key: 31)
stacks.push(key: 5)     // stack is full.
stacks.push(key: 91)
stacks.push(key: 78)    // stack is full.
stacks.push(key: 7)
stacks.push(key: 100)   // stack is full.
stacks.push(key: 62)
stacks.count

stacks.pop()        // 62   should remove the empty stack
stacks.peek()
//stacks.pop()        // 100
//stacks.pop()        // 7
//stacks.peek()       // 78

//
// pop should return 2

