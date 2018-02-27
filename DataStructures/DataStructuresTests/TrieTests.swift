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
    
    func testAppendedWordCanBeFound() throws {
        let trie = Trie()
        try trie.append(word: "pizza")
        
        // Is it a valid test of one function to use another function?
        // Is this a test of both .append and .find?
        let results = trie.find("pizza")
        XCTAssert(results?.count == 1)
        XCTAssert(results?.first == "pizza")
    }
    
    func testAppendedDisimilarWordsCanBeFound() throws {
        let trie = Trie()
        try trie.append(word: "pizza")
        try trie.append(word: "beer")
        
        var results = trie.find("pizza")
        XCTAssert(results?.first == "pizza")
        
        results = trie.find("beer")
        XCTAssert(results?.first == "beer")
    }
    
}
