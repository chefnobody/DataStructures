//
//  UnicodeModularHash.swift
//  DataStructures
//
//  Created by Aaron Connolly on 2/26/18.
//  Copyright © 2018 Top Turn Software. All rights reserved.
//

import Foundation

func unicodeModularHash(key: String, bounds: Int) -> Int {
    var remainder: Int = 0
    var divisor: Int = 0
    
    // The string's value as unicode scalar values.
    for item in key.unicodeScalars {
        print(item.value)
        divisor += Int(item.value)
    }
    
    // Mod w/ buckets count for a position capped by bounds
    remainder = divisor % bounds
    return remainder
}
