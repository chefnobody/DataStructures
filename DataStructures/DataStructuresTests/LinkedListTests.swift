//
//  LinkedListTests.swift
//  DataStructuresTests
//
//  Created by Aaron Connolly on 2/25/18.
//  Copyright © 2018 Top Turn Software. All rights reserved.
//

import XCTest

class LinkedListTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: - Public API tests
    
    func testNewListLengthIsZero() {
        let list = LinkedList<Int>()
        XCTAssert(list.length == 0)
    }
    
    func testAppendReturnsNodeWithMatchingKey() {
        let list = LinkedList<Int>()
        let result = list.append(key: 7)
        XCTAssert(result.key == 7)
    }
    
    func testAppendIncrementsLengthCounter() {
        let list = LinkedList<Int>()
        list.append(key: 7)
        XCTAssert(list.length == 1)
        
        list.append(key: 31)
        XCTAssert(list.length == 2)
        
        list.append(key: 55)
        list.append(key: 4)
        list.append(key: 71)
        XCTAssert(list.length == 5)
    }
    
    func testContainsReturnsFalseWhenListIsEmpty() {
        let list = LinkedList<Int>()
        XCTAssertFalse(list.contains(key: 31))
    }
    
    func testContainsReturnsTrueWhenValueExistsInListAndListLengthIsOne() {
        let list = LinkedList<Int>()
        list.append(key: 31)
        XCTAssertTrue(list.contains(key: 31))
    }
    
    func testContainsReturnsTrueWhenValueExistsInListAndIsFirstValueInList() {
        let list = LinkedList<Int>()
        list.append(key: 31)
        list.append(key: 50)
        XCTAssertTrue(list.contains(key: 31))
    }
    
    func testContainsReturnsTrueWhenValueExistsInListAndIsLastValueInList() {
        let list = LinkedList<Int>()
        list.append(key: 50)
        list.append(key: 77)
        list.append(key: 12)
        list.append(key: 31)
        XCTAssertTrue(list.contains(key: 31))
    }
    
    func testContainsReturnsTrueWhenValueExistsInListAndIsNotFirstOrLastValueInList() {
        let list = LinkedList<Int>()
        list.append(key: 50)
        list.append(key: 77)
        list.append(key: 12)
        list.append(key: 11)
        list.append(key: 12)
        list.append(key: 10)
        list.append(key: 31)        // here I am
        list.append(key: 0)
        list.append(key: 12)
        list.append(key: 9)
        XCTAssertTrue(list.contains(key: 31))
    }
    
    func testInsertAtZeroOnEmptyListAppends() {
        let list = LinkedList<Int>()
        list.insert(key: 31, at: 0)
        XCTAssert(list.length == 1)
        XCTAssert(list.printKeys() == "31")
    }
    
    func testInsertAtOneOnEmptyListAppends() {
        let list = LinkedList<Int>()
        list.insert(key: 31, at: 1)
        XCTAssert(list.length == 1)
        XCTAssert(list.printKeys() == "31")
    }
    
    func testInsertAtZeroOnFullListPushesOldValuesDown() {
        let list = LinkedList<Int>()
        list.append(key: 31)    // should insert here.
        list.append(key: 17)
        list.append(key: 10)
        list.append(key: 145)
        list.append(key: 3)
        
        list.insert(key: 4, at: 0)
        let keys = list.printKeys()
        XCTAssert(keys == "4 -> 31 -> 17 -> 10 -> 145 -> 3")
    }
    
    func testInsertAtInsertsAndPushesOldValueDown() {
        let list = LinkedList<Int>()
        list.append(key: 31)
        list.append(key: 17)    // should insert here.
        list.append(key: 10)
        list.append(key: 145)
        list.append(key: 3)
        
        list.insert(key: 4, at: 1)
        let keys = list.printKeys()
        XCTAssert(keys == "31 -> 4 -> 17 -> 10 -> 145 -> 3")
    }
    
    func testInsertAtWithIndexEqualToLengthAppendsNewValue() {
        let list = LinkedList<Int>()
        list.append(key: 31)
        list.append(key: 17)
        list.append(key: 10)
        list.append(key: 145)
        list.append(key: 10)
        list.append(key: 19)
        list.append(key: 27)
        list.append(key: 33)
        list.append(key: 700)       // should insert here.
        
        list.insert(key: 99, at: 8)
        let keys = list.printKeys()
        XCTAssert(keys == "31 -> 17 -> 10 -> 145 -> 10 -> 19 -> 27 -> 33 -> 99 -> 700")
    }
    
    func testInsertAtLengthPlusOneAppendsToExistingList() {
        let list = LinkedList<Int>()
        list.append(key: 12)
        list.append(key: 88)
        list.append(key: 45)
        list.append(key: 73)
        list.append(key: 4)
        list.append(key: 13)
        list.append(key: 31)
        list.append(key: 6)
        
        list.insert(key: 99, at: list.length + 1)
        let keys = list.printKeys()
        XCTAssert(keys == "12 -> 88 -> 45 -> 73 -> 4 -> 13 -> 31 -> 6 -> 99")
    }
}
