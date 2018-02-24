//: Playground - noun: a place where people can play

import UIKit
import DataStructures

var queue = Queue<Int>()
queue.enQueue(key: 5)
queue.enQueue(key: 7)
queue.printKeys()

var stack = Stack<String>()
stack.push(key: "Sausage")
stack.push(key: "Pepperocinis")
stack.push(key: "Black Olives")
stack.printKeys()

var trie = Trie()
try trie.append(word: "Ball")
try trie.append(word: "Biscuit")
try trie.append(word: "Battery")
try trie.append(word: "Bill")
try trie.append(word: "Barn")
dump(trie)
