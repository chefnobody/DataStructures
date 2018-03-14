//: Playground - noun: a place where people can play

import UIKit
import DataStructures

/*
 Palindrome:
 Implement a function to check if a linked list is a palindrome.
 */

var list = LinkedList<String>()
list.append(key: "p")
list.append(key: "i")
list.append(key: "z")
list.append(key: "z")
list.append(key: "a")
list.append(key: "!")
list.printKeys()
list.isPalindrome() // false

list = LinkedList<String>()
list.append(key: "t")
list.append(key: "a")
list.append(key: "c")
list.append(key: "o")
list.append(key: "c")
list.append(key: "a")
list.append(key: "t")
list.printKeys()
list.isPalindrome()     // true


