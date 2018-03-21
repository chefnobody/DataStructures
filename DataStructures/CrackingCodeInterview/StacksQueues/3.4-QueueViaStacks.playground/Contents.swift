//: Playground - noun: a place where people can play

import Foundation
import DataStructures

/*
 Queue via Stacks:
 Implement a MyQueue class which implements a queue using two stacks.
 
 Remember: Queue's are First In First Out (enqueue, dequeue)
           Stacks are First In Last Out (push, pop)
 
 Approach 1:
 - The two stacks are a reverse of one another, such that enqueuing happens on the first dequeuing on the reverse.
 - use the first stack to enqueue items.
    - create a second stack at the same time, but in reverse order of the first.
    - unfortunately this requires copying the input and reversing it.
    - OR keeping some bit flag that says we've flipped the stacks, signaling that you need to reverse them again before pushing or popping. This sounds confusing.
 
 
 Approach 2:
 
 - Only use a second stack when you have to pop.
   - Reverse the first stack, pop off the reversed stack,
   - then reverse it again to get back to the.
   - This should only require at most a second stack.
 
 Issues:
 - When enqueing you need to push to stack1, but then push to stack2 from the tail.
 - When dequeuing you need to pop from stack2 (because its a reverse) and then pop from stack 1's tail.
 
 Questions:
 - Can I use more than 2 stacks?
 - Can I use another data structure to store my master list of pushed and popped things?
 - Is there a way to represent the next queued thing and the next thing to dequeue?
 - Can I add a method to a stack that automatically reverses it?
 */

// You can reverse a stack into another stack
// by pushing a bunch of keys, then popping them.
let input = Stack<Int>()
input.push(key: 31)
input.push(key: 44)
input.push(key: 7)
input.printKeys()

let output = Stack<Int>()
while !input.isEmpty() {
    if let key = input.pop() {
        output.push(key: key)
    }
}

output.printKeys()

/*
 s1
 s2
 
 enqueue(1)
 s1 = {1}
 s2 = {1}
 
 enqueue(5)
 s1 = {1, 5}

 enqueue(31)
 s1 = {1, 5, 31}
 
 dequeue() -> 1
 s1 = {1, 5, 31}
 
 
 s2 = {31, 5}
 
 
 */


















