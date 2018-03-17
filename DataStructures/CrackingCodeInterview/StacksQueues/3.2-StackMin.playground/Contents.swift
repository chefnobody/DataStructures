//: Playground - noun: a place where people can play

import Foundation
import DataStructures

/*
 Stack Min
 How would you design a stack which, in addition to _push_ and _pop_, has a function _min_ which returns the minimum element?
 push, pop and min should all operate in 0(1) time.
 
 Considerations:
 - What values is the stack holding? Strings? Integers? Person objects? If its not obvious,
   how would we determine the minimum value for an object?
 - What do you do with duplicate minimum values? Which do you return? [9, 10, 4, 1, 1, 1, 1] ?
 - Must the stack maintain its order? Or can I keep the minimum value node separate from the order of the stack?
 - When we call the min function, do I remove the node from that point in the stack?
    - If so, is this really a stack anymore? This scenario has implications.
 - When we call the min function can I just return the _value_ and leave the stack alone?
 - When I push I might need to reset this minimum value.
 - When I pop I might also need to reset this minimum value.
   - This might be 0(n) because we might have to traverse the entire stack to find a new min.
 
 Approaches:
 - Keep a local pointer to the minimum value.
 - During each push check if the locally stored minimum value is less than the value being pushed.
   - If it is less than the value being pushed push the new value.
   - If it is larger than the value being pushed, switch the local min pointer to point at this new value.
 - During each pop, check if we're popping the minimum value. If we are we need to reset the minimum to another place.
  
 */

let stack = Stack<Int>()
stack.push(key: 8)
stack.push(key: 18)
stack.push(key: 71)
stack.push(key: 91)
stack.push(key: 4)
stack.push(key: 8)
stack.push(key: 31)
stack.push(key: 20)
stack.push(key: 55)
if let min = stack.min {
    print(min) // 4
}
