//: Playground - noun: a place where people can play

import UIKit

/*
 String Compression:
 Implement a method to perform basic string compression using the counts of repeated characters.
 For example: the string aabcccccaaa would become a2b1c5a3. If the "compressed" string would not
 become smaller than the original string, your method should return the original string.
 You can assume the string has only upper case and lowercase letters a-z.
 
 Note: Order of characters + count matters. Hash
 */

func compress(input: String) -> String {
    
    // Guard for an empty string.
    guard input.count > 0 else { return input }
    
    var characters = input.map { $0 }
    var result: String = ""
    var currentChar: Character = characters.first!      // should be safe
    var currentCount: Int = 0
    
    for i in 0..<characters.count {
        
        // Did the character change or did we walk off the end of the list?
        if characters[i] != currentChar || i == characters.count - 1 {
            
            // Build the result
            result += "\(currentChar)\(String(describing: currentCount))"
            
            // Reset current char and count
            currentChar = characters[i]
            currentCount = 1
            
        } else {
            // character did not change...
            currentCount += 1
        }
        
        if result.count > input.count {
            // Return if we're not compressing
            // to a size smaller than our original input.
            return input
        }
    }
    
    return result
}

compress(input: "aabcccccaaa")
compress(input: "abcdefgggggggggjkl")

