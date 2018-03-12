//: Playground - noun: a place where people can play

import UIKit

/*
 String Rotation
 - Assume you have a method isSubstring which checks if one word is a substring of another.
 - Given two strings s1 and s2, write code to check if s2 is a rotation of s1 using only one call to isSubstring.
 
 What is a rotated string? How would you define it?
   - A string is rotated if the _all_ the characters are offset by some common distance (Int)
   - and the characters that would otherwise fall off the end of the list after being offset,
     are pre-pended onto the front of the string. This causes a visual effect of rotating

 Another way of thinking about this is removing a substring of the last characters in the list matching the offset-length, and pre-prending that substring on the front of the chopped list. Yeah that's nicer.
 
 This seems simple enough to me:
 Yet another way could be to pop the last element off M-times where M == offset length, then push them on the front of the string in the order they were popped.
 
 considerations:
   - will this work w/ multi-code Unicode characters?
 
 Back to the problem:
  - we have a function that tells us if a string is a substring of another string.
   - that means the all the ch's in the one string are in the other string (in the same sequence)
  - define a function that tells if a string is a _rotation_ of another string.
 
 - rotated strings have the same length as their original un-rotated string.
 - rotated strings have all the same characters as their original un-rotated string.
 - the rotation is some common offset.
 - take the thing being compared to and grab its first character.
 - find that first character in the rotated string
   - if its not there we can't be a rotation
   - if it is there note the position it's at. 0 + that index is the rotation off-set.
 
 */

extension String {

    mutating func rotate(by offset: Int) {
        // Avoid unecessarily rotating more than we need:
        let cappedOffset = offset % self.count
        
        for _ in 0..<cappedOffset {
            let char = self.removeLast()
            self.insert(char, at: self.startIndex)
        }
    }
    
    func isSubstring(of other: String) -> Bool {
        // Does stuff to check if self is a substring
        // of the provided string.
        
        // Ex:
        // self == "pizza"
        // other == "I love good pizza and good beer."
        // return -> true because "pizza" is a substring of other.
        guard let range = other.range(of: self) else { return false }
        print("found range:", range)
        
        return true
    }
    
    // Return true is other is a rotation of self.
    func isRotation(of other: String) -> Bool {
        
        // Edge cases?
        // Lengths must be greater than 0.
        // Lengths must be also be equal.
        guard other.count > 0 && self.count > 0 else { return false }
        guard other.count == self.count else { return false }
        
        let first = other.first!
        
        // find first in self, return false if its not there.
        guard let index = self.index(of: first) else { return false }
        
        // The encoded offset is our spot.
        let offset = index.encodedOffset
        print(offset)

        // Hint: use the isSubstring for help?

        // ideas:
        // 1 - compare substring of other offset..<count
        // to self 0..<count-offset ?
        
        // 2 - rotate other back into place then do a string compare on stitched together string?
        
        /*
         var otherCopy = other
        otherCopy.rotate(by: offset)
        print("rotated other", otherCopy)
        
        return self == otherCopy
         */
        
        /* 3 - from the book:
         given s1 = waterbottle and s2 = erbottlewat
         
         s1 = xy = waterbottle
         x = wat
         y = erbottle
         then...
         s2 = yx = erbottlewat
         
         Check if there's a way to split s1 into x and y such that xy = s1 and yx = s2. Regardless of where the division between x and y is, we can easily see that yx will always be a substring of xyxy (see it? x[yx]y). That is s2 will always be a substring of s1s1.
         */
        
        return isSubstring(of: other + other)
    }
}

// Let's test some rotating
var p = "pizza"
p.rotate(by: 4)
print(p)

// Seems right.
var trucks = "2013 Toyota Tacoma Off Road TRD Sport"
trucks.rotate(by: 15)
print(trucks)

"izzap".isRotation(of: "pizza")
" Road TRD Sport2013 Toyota Tacoma Off".isRotation(of: "2013 Toyota Tacoma Off Road TRD Sport")

