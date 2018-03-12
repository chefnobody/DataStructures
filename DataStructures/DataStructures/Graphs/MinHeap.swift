//
//  MinHeap.swift
//  DataStructures
//
//  Created by Aaron Connolly on 2/28/18.
//  Copyright © 2018 Top Turn Software. All rights reserved.
//

import Foundation

public class MinHeap<T> {
    var root: BSTNode<T>?
    
    /*
     - Inserting should always start at the bottom all the way to the right.
       This helps maintain's the COMPLETE binary tree.
     - Next "fix" the tree by swapping the new element with its parent, until
       an appropriate spot is found for the element. Bubble it up into place.
     */
    func insert(key: T) {
        
    }
    
    func extractMin() -> T? {
        return root?.key
    }
}
