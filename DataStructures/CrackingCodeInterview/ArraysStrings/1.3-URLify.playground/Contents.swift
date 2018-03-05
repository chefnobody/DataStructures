//: Playground - noun: a place where people can play

import Foundation

/* URLify
 
    Write a method that replaces all spaces in a string w/ '%20'. You may assume the string has sufficient space at the end to hold the additional characters, and that you are given the "true" length of the string. (Note if implementing in Java, please use a character array so that you can perform this operation in place.)
 Example:
 INPUT:  "Mr John Smith    ", 13
 OUTPUT: "Mr%20John%20Smith"
 */

func swapSpacesForPercentEncoding(input: String) -> String {
    let swapped = input.map { ch -> String in
        return ch == " " ? "%20" : String(ch)
    }
    
    return swapped.joined()
}

swapSpacesForPercentEncoding(input: "PIZZA AND BEER")

/* Notes from answer:
 - to do this in place, take one pass over the string and count the spaces
 - use the spaces count to calculate the size of the array if spaces are added. (original length + (space count * 2))
 - do a second pass over the newly sized array of characters starting from the end and working toward zero.
   - this allows us to add new characters to the resized array w/o having to worry about what we're over writing.
 - replacing spaces with 0,2,% respectively.
 - moving over non-spaces to their place.
 -
 
 - OR: we could cheat and use encoding API instead... 
 
 */

/*
 input is a string "Mr John Smith    "
 trueLength is the length of the substring in the input "Mr John Smith"
 */
func replaceSpaces(input: inout [Character], trueLength: Int) -> String {
    
    let validRange = 0..<trueLength
    
    // count the spaces in the substring, not the entire string.
    var spacesCount = 0
    for i in validRange {
        if input[i] == " " {
            spacesCount += 1
        }
    }
    
    var index = trueLength + spacesCount * 2 // *2 because the space is already taking up one spot of the 3 we need to add.
    
    // Insert a linebreak character if possible
    if trueLength < input.count { input[trueLength] = "\0" }
    
    // work backwards
    for i in validRange.reversed() {
        if input[i] == " " {
            input[index - 1] = "0"
            input[index - 2] = "2"
            input[index - 3] = "%"
            index = index - 3
        } else {
            input[index - 1] = input[i]
            index -= 1
        }
    }
    
    return String(input)
}

let phrase = "PIZZA AND BEER IS GREAT!        " // length of this is trueLength + (2 * number of spaces)
var phraseChars = phrase.map { $0 }
print(replaceSpaces(input: &phraseChars, trueLength: 24))



let phrase2 = "Mr John Smith    "
var phrase2Chars = phrase2.map { $0 }
print(replaceSpaces(input: &phrase2Chars, trueLength: 13))




