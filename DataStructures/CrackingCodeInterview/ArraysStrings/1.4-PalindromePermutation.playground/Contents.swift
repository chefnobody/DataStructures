//: Playground - noun: a place where people can play

import Foundation

let pizza = "Pizza & Craft Beer"
if let range = pizza.rangeOfCharacter(from: NSCharacterSet.whitespaces,
                                      options: .caseInsensitive,
                                      range: pizza.startIndex..<pizza.endIndex) {
    pizza.replacingCharacters(in: range, with: "")
}

let filtered = pizza.filter { character in
    return NSCharacterSet.whitespaces.contains(character.unicodeScalars.first!) == false
}

let filtered2 = pizza.components(separatedBy: .whitespaces).joined()

/*
 Palindrom Permutation
 Given a string, write a function to check if it is a permutation of a palindrome.
 A palindrome is a word or phrase that is the same forward and backwards.
 A permutation is a rearrangement of letters.
 The Palindrome does not need to be limited to just dictionary words. It could be garbage.
 
 INPUT: "Tact Coa"
 OUTPUT: Permutations: "taco cat", "atco cta"
 OUTPUT: Yes, this is a permutation of a palindrome.

 Another way to describe the problem:
 - can you rearrange the characters in the input into palindrome?
 - how many pairs of characters do you have?
   - if the pairs of characaters == n/2 (for an even lengthed string) you can build a palindrome
   - if the pairs of characters == n/2 + 1 (for an odd lengthed string) you can build a palindrome
 
 Notes:
 - What do you do about spaces?
 - What do you do about dupe characters? Their unique count needs to be divisble evently by 2. (x % 2 == 0)
 - In the odd-lengthed case you need at least one unique count == 1
 - In the even-lengthed case you need all unique count totals to be divisble evenly by 2.
 - How else might you define, technically what a palindrome is?
 - What about counting the number of unique chars in the string?
 - Given an n-length string ("tact coa") you'd get the following unique counts:
    t = 2
    a = 2
    c = 2
    space = 1
    o = 1
 - ignoring white space, we see that the number of characters whose unique
    count must == 2 is equal to n-1. 1 being the character to use for the very middle
    of the palindrome or ignore it altogether.
 - put another way:
   - you need at least one non-space character (whose count == 1)
   - you need all the remaining characters count total to be divisible by 2.
 */
func isPalindromePermutation(input: String) -> Bool {
    // counts of characters.
    var hash: [Character:Int] = [Character:Int]()
    
    // remove spaces perhaps?
    
    // iterate once over the input
    for ch in input.components(separatedBy: .whitespaces).joined() {
        if hash[ch] == nil {
            hash[ch] = 1
        } else {
            let count = hash[ch]!
            hash[ch] = count + 1
        }
    }
    
    print(hash)
    
    // iterate over the keys in the hash
    for key in hash.keys {
        print(key)
        if let count = hash[key] {
            if count != 1 && count % 2 == 1 {
                // odd numbered count? no way
                // this could be a palindrome
                return false
            }
        }
    }
    
    return true
}

// just for giggles:
func isPalindrome(input: String) -> Bool {
    return input == String(input.reversed())
}

isPalindrome(input: "tacocat")
isPalindrome(input: "tact coa")
isPalindromePermutation(input: "tact coa")



