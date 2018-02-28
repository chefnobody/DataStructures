//: Playground - noun: a place where people can play

import Foundation

/* 1.1 Is Unique
 Implement an algorithm to determine if a string has all unique characters.
   - What if you cannot use additional data structures?
 
 Extra credit?
   - What if you have emoji or other multiple codes for each character?
 */

/*
 Technique:
  - Use a Dictionary/Hash to store the character by "key" and the number of times that character is seen in the string as the "value"
  - If there exists a value in the hash for that "key" return false because there are duped keys.
  - If you never find a dupe value in the hash return true.
 */
func isUniqueWithHash(source: String) -> Bool {
    
    // Is an empty string considered to contain unique characters?
    guard source.count > 0 else {
        return false
    }
    
    var hash:[Character:Int?] = [:]
    
    for ch in source {
        if hash[ch] != nil {
            return false
        } else {
            hash[ch] = 1
        }
    }
    
    return true
}

// Simple tests
isUniqueWithHash(source: "")
isUniqueWithHash(source: "salad")
isUniqueWithHash(source: "String")
isUniqueWithHash(source: "ksjybxmna,gtque")

/* Technique:
 - Check each character against all the other characters in the string.
 - If a match is found the string doesn't contain any unique characters
 - If no match is found, remove that character from the string and continue
   comparing the next character against all the other characters.
 - Repeat until you've exhausted the list
 
 Special notes:
  - mutates the string
 
*/
func isUnique(source: inout String) -> Bool {
    
    guard source.count > 0 else {
        return false
    }
    
    while source.count > 1 {
        let removed = source.removeFirst()
        for ch in source {
            if removed == ch {
                return false
            }
        }
    }
    
    return true
}

var input = ""
isUnique(source: &input)

input = "salad"
isUnique(source: &input)

input = "String"
isUnique(source: &input)

input = "ksjybxmna,gtque"
isUnique(source: &input)

/* Questions:
  - Does our input contain only ASCII or could it contain Unicode?
  - What if we sorted the input string?
  - If we assume the possible input strings contain only [a-z] we could use a bit vector to shift against for comparison. I don't fully grok that though.
 
 */



