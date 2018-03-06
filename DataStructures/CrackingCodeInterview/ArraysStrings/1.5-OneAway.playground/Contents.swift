//: Playground - noun: a place where people can play

import UIKit

/*
 One Away:
 - There are three types of edits that can be performed on strings:
   - insert a character
   - remove a character
   - replace a character
 - Given two strings, write a function to check if they are one edit (or zero edits) away.
 
 example:
 pale,  ple  -> true
 pales, pale -> true
 pale,  bale -> true
 pale,  bake -> false
 
 Ideas:
 - Smells like a levenshtein string distance algorithm problem. Probably best solution. Maybe wasteful? Definitely n^2 expensive
 - Sorting the inputs would put their diffs at the same places. Right?
 -
 */

// Subscript with an integer that returns the character
extension String {
    subscript(index: Int) -> Character {
        return self[String.Index(encodedOffset: index)]
    }
}

func oneAway(_ first: String, _ second: String) -> Bool {
    
    // If the difference of their lengths > 1 return false.
    let lengthDiff = abs(first.count - second.count)
    guard lengthDiff <= 1 else { return false }
    
    if first.count == second.count {
        return oneEditReplace(first, second)
    } else if first.count + 1 == second.count {
        return oneEditInsert(first, second)
    } else if first.count - 1 == second.count {
        return oneEditInsert(second, first)
    }
    return false
}

func oneEditReplace(_ first: String, _ second: String) -> Bool {
    var foundDiff = false
    for i in 0..<first.count {
        if first[i] != second[i] {
            if foundDiff {
                return false
            }
            // Haven't yet found a difference
            // so let's flag that case.
            foundDiff = true
        }
    }
    return true
}

// Check if you can insert a character in first string to make the second.
func oneEditInsert(_ first: String, _ second: String) -> Bool {
    var index1 = 0
    var index2 = 0

    // Increment indexes in each string and walk down the list
    while index2 < second.count && index1 < first.count {
        if first[index1] != second[index2] {
            // Characters are not the same
            if index1 != index2 {
                // Are the index the same?
                // We can't insert to make them the same
                // So....
                return false
            }
            
            // Indexes are the same so move down string 2
            index2 += 1
        } else {
            // Characters are the same
            // move both pointers.
            index1 += 1
            index2 += 1
        }
    }
    
    return true
}


oneAway("Pizza", "Ale")
oneAway("pale", "ple")
oneAway("pales", "pale")
oneAway("pale", "bale")
oneAway("pale", "bake")

