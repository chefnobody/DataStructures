//: Playground - noun: a place where people can play

import Foundation

/*
 1.2 Given two strings write a method to decide if one is a permutation of another.
 */

// Sort the strings and compare the sorted results for equality.
// - kick out early with empty inputs
// - kick out early if inputs are not the exact same length.
//
func isPermutation(string1: String, string2: String) -> Bool {
    // This assumes empty strings are not permutations of one another
    // and checks for either input being empty.
    guard string1.count > 0 && string2.count > 0 else {
        return false
    }
    
    // if either string is a permutation of the other then,
    // by definition their lengths must be the same.
    // If they are not we can't have a permutation.
    guard string1.count == string2.count else {
        return false
    }
    
    return string1.sorted() == string2.sorted()
}

isPermutation(string1: "", string2: "")
isPermutation(string1: "foo", string2: "")
isPermutation(string1: "", string2: "bar")
isPermutation(string1: "pizza", string2: "beer")
isPermutation(string1: "pizza", string2: "plaza")
isPermutation(string1: "pizza", string2: "zzipa")
isPermutation(string1: "uniquenewyork", string2: "eeunqiykwnrou")

/*
 Another solution:
 - Create a hash table with the character and frequency count for the first string.
 - As you iterate through the second string _decrement_ the counts.
 - Kick out early if any count goes below 0
 - Return true if counts of all character's == 0 otherwise false....

 */
func isPermutation2(string1: String, string2: String) -> Bool {
    // This assumes empty strings are not permutations of one another
    // and checks for either input being empty.
    guard string1.count > 0 && string2.count > 0 else {
        return false
    }
    
    // if either string is a permutation of the other then,
    // by definition their lengths must be the same.
    // If they are not we can't have a permutation.
    guard string1.count == string2.count else {
        return false
    }
    
    var hash:[Character:Int] = [:]
    
    // Create hash of counts for string1:
    for ch in string1 {
        if let count = hash[ch] {
            hash[ch] = count + 1
        } else {
            hash[ch] = 1
        }
    }
    
    // Important:
    // - decrement counts for string2
    // - kick out when a ch is found in this string
    //   that is not in the first
    for ch in string2 {
        if let count = hash[ch] {
            let newCount = count - 1
            
            if newCount < 0 {
                // Special optimization case
                // where string2 clearly had more of this
                // ch than the first and is thus not a
                // permutation
                return false
            }
            
            hash[ch] = newCount
            
        } else {
            // Special otimization:
            // If we encounter a ch in the second
            // string that is not in the first.
            // by definition they can't be permutations
            return false
        }
    }
    
    // finally reduce over the key values in the hash
    // returning the reduced value == 0
    return hash.values.reduce(0) { $0 + $1 } == 0
}

isPermutation2(string1: "", string2: "")
isPermutation2(string1: "foo", string2: "")
isPermutation2(string1: "", string2: "bar")
isPermutation2(string1: "pizza", string2: "beer")
isPermutation2(string1: "pizza", string2: "plaza")
isPermutation2(string1: "pizza", string2: "zzipa")
isPermutation2(string1: "uniquenewyork", string2: "eeunqiykwnrou")

/*
 Questions to consider:
 - Is whitespace significant? i.e. is "god    " _NOT_ a permutation of "dog"?
 - Do we care about case? i.e. is "God" a permutation of "dog"?
 */
