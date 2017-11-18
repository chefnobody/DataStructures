//
//  Trie.swift
//  DataStructures
//
//  Created by Aaron Connolly on 11/17/17.
//  Copyright © 2017 Top Turn Software. All rights reserved.
//

import Foundation

class TrieNode {
    var key: String?
    var children: Array<TrieNode>
    var isFinal: Bool
    var level: Int
    
    init() {
        children = Array<TrieNode>()
        isFinal = false
        level = 0
    }
}

class Trie {
    private var root = TrieNode()
    
    func append(word keyword:String) {
    
        guard keyword.count > 0 else {
            return
        }
        
        var current: TrieNode = root
        
        while keyword.count != current.level {
            
            var childToUse: TrieNode?
            
            // Grab subscript from keyword upto and including
            // the length of the current level
            let endIndex = keyword.index(keyword.startIndex, offsetBy:current.level + 1)
            let searchKey = keyword[...endIndex]
            
            // iterate through children looking for the matching key for this search key
            for child in current.children {
                
                if let childKey = child.key, childKey == searchKey {
                    // Stop if we found our matching key.
                    childToUse = child
                    break
                }
            }
            
            // Didn't find a matching child node for this searchKey
            // in this set of children, so let's create one.
            if childToUse == nil {
                childToUse = TrieNode()
                childToUse!.key = String(searchKey)
                childToUse!.level = current.level + 1
                current.children.append(childToUse!)
            }
            
            current = childToUse!
            
        } // end while
    }
}


