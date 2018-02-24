//
//  TrieTests.swift
//  DataStructuresTests
//
//  Created by Aaron Connolly on 11/17/17.
//  Copyright © 2017 Top Turn Software. All rights reserved.
//

import XCTest
@testable import DataStructures

class TrieTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Initialized state
    
    // append
    
    func testAppendEmptyWordThrowsError() {
        let trie = Trie()
        try XCTAssertThrowsError(trie.append(word: ""))
    }
    
    func testAppendWordCreatesTrieWithHeightMatchingWordLength() throws {
        let trie = Trie()
        try trie.append(word: "pizza")
//        XCTAssert(trie.)
        dump(trie)
    }
    
}
