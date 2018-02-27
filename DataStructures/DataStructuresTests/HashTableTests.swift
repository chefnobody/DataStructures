//
//  HashTableTests.swift
//  DataStructuresTests
//
//  Created by Aaron Connolly on 2/26/18.
//  Copyright © 2018 Top Turn Software. All rights reserved.
//

import XCTest

class HashTableTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    
    func testUnicodeModularHashReturnsIndexLessThanBounds() {
        let hashValue = unicodeModularHash(key: "pizza", bounds: 50)
        XCTAssert(hashValue < 50)
    }
    
    func testUnicodeModularHashReturnsForCraftBeer() {
        let hashValue = unicodeModularHash(key: "Craft Beer", bounds: 50)
        XCTAssert(hashValue == 10)
    }
    
    func testUnicodeModularHashReturnsMatchingValuesForScalarlyEquivalentKeys() {
        let hashValue1 = unicodeModularHash(key: "Andrew Collins", bounds: 50)
        let hashValue2 = unicodeModularHash(key: "Albert Einstein", bounds: 50)
        XCTAssert(hashValue1 == hashValue2)
    }
}
