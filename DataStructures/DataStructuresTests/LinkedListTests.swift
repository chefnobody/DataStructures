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
        print("keys: ", list.printKeys())
        
        XCTAssert(list.length == 5)
    }
    
    func testPrintKeysReturnsMessageWhenListIsEmpty() {
        let list = LinkedList<Int>()
        XCTAssert(list.printKeys() == "List is empty!")
    }
    
    func testPrintKeysReturnsKeysWhenListHasOneItem() {
        let list = LinkedList<Int>()
        list.append(key: 31)
        XCTAssert(list.printKeys() == "31")
    }
    
    func testPrintKeysReturnsKeysWhenListHasTwoItems() {
        let list = LinkedList<Int>()
        list.append(key: 31)
        list.append(key: 75)
        print("keys:", list.printKeys())
        XCTAssert(list.printKeys() == "31 -> 75")
    }
    
    func testPrintKeysReturnsKeysWhenListHasSeveralItems() {
        let list = LinkedList<Int>()
        list.append(key: 31)
        list.append(key: 75)
        list.append(key: 91)
        XCTAssert(list.printKeys() == "31 -> 75 -> 91")
    }
    
    func testPrintKeysReturnsKeysWhenListHasManyItems() {
        let list = LinkedList<Int>()
        list.append(key: 31)
        list.append(key: 75)
        list.append(key: 91)
        list.append(key: 88)
        list.append(key: 85)
        list.append(key: 71)
        list.append(key: 8)
        list.append(key: 32)
        list.append(key: 55)
        XCTAssert(list.printKeys() == "31 -> 75 -> 91 -> 88 -> 85 -> 71 -> 8 -> 32 -> 55")
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
    
    func testRemoveDupesReturnsFalseWhenListIsEmpty() {
        let list = LinkedList<Int>()
        XCTAssertFalse(list.removeDupes())
    }
    
    func testRemoveDupesReturnsFalseWhenListHasOneItem() {
        let list = LinkedList<Int>()
        list.append(key: 31)
        XCTAssertFalse(list.removeDupes())
    }
    
    func testRemoveDupesReturnsFalseWhenListHas2ItemsButNoDupes() {
        let list = LinkedList<Int>()
        list.append(key: 31)
        list.append(key: 55)
        XCTAssertFalse(list.removeDupes())
    }
    
    func testRemoveDupesReturnsFalseWhenListHas2PlusItemsButNoDupes() {
        let list = LinkedList<Int>()
        list.append(key: 31)
        list.append(key: 55)
        list.append(key: 78)
        list.append(key: 11)
        list.append(key: 9)
        XCTAssertFalse(list.removeDupes())
    }
    
    func testRemoveDupesRemovesDupesWhenListHasTwoItemsWhichAreDupes() {
        let list = LinkedList<Int>()
        list.append(key: 31)
        list.append(key: 31)
        XCTAssertTrue(list.removeDupes())
        XCTAssert(list.printKeys() == "31")
    }
    
    func testRemoveDupesRemovesDupesWhenListHasManyItemsAndSeveralDupes() {
        let list = LinkedList<Int>()
        list.append(key: 31)
        list.append(key: 55)
        list.append(key: 98)
        list.append(key: 17)
        list.append(key: 31)    // dupe 1
        list.append(key: 71)
        list.append(key: 9)
        list.append(key: 0)
        list.append(key: 98)    // dupe 2
        list.append(key: 91)
        list.append(key: 100)
        list.append(key: 88)
        XCTAssertTrue(list.removeDupes())
        XCTAssert(list.printKeys() == "31 -> 55 -> 98 -> 17 -> 71 -> 9 -> 0 -> 91 -> 100 -> 88")
    }
    
    func testRemoveDupesRemovesDupesInSuccession() {
        let list = LinkedList<Int>()
        list.append(key: 1)
        list.append(key: 2)
        list.append(key: 3)
        list.append(key: 4)
        list.append(key: 5)
        list.append(key: 5) // dupe
        list.append(key: 6)
        list.append(key: 7)
        list.append(key: 7) // dupe
        list.append(key: 8)
        list.append(key: 8) // dupe
        list.append(key: 9)
        list.append(key: 9) // dupe
        list.append(key: 10)
        list.append(key: 11)
        list.append(key: 12)
        XCTAssertTrue(list.removeDupes())
        XCTAssert(list.printKeys() == "1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7 -> 8 -> 9 -> 10 -> 11 -> 12")
    }
    
    func testRemoveDupesRemovesDupesFoundAtBeginningOfList() {
        let list = LinkedList<Int>()
        list.append(key: 1)
        list.append(key: 1) // dupe
        list.append(key: 2)
        list.append(key: 3)
        list.append(key: 4)
        list.append(key: 5)
        list.append(key: 6)
        list.append(key: 7)
        XCTAssertTrue(list.removeDupes())
        XCTAssert(list.printKeys() == "1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7")
    }
    
    func testRemoveDupesRemovesDupeFoundAtEndOfList() {
        let list = LinkedList<Int>()
        list.append(key: 1)
        list.append(key: 2)
        list.append(key: 3)
        list.append(key: 4)
        list.append(key: 5)
        list.append(key: 6)
        list.append(key: 7)
        list.append(key: 7) // dupe
        XCTAssertTrue(list.removeDupes())
        XCTAssert(list.printKeys() == "1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7")
    }
    
    func testRemoveDupesRemovesSuccessiveDupesFoundAtEndOfList() {
        let list = LinkedList<Int>()
        list.append(key: 1)
        list.append(key: 2)
        list.append(key: 3)
        list.append(key: 4)
        list.append(key: 5)
        list.append(key: 5) // dupe
        list.append(key: 6)
        list.append(key: 6) // dupe
        list.append(key: 7)
        list.append(key: 7) // dupe
        XCTAssertTrue(list.removeDupes())
        XCTAssert(list.printKeys() == "1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7")
    }
    
    func testRemoveDupesRemovesDupesWhenMoreThanOneDupeExistsForAKey() {
        let list = LinkedList<Int>()
        list.append(key: 1)
        list.append(key: 2)
        list.append(key: 3)
        list.append(key: 31)
        list.append(key: 31) // dupe
        list.append(key: 31) // dupe
        list.append(key: 31) // dupe
        list.append(key: 6)
        list.append(key: 7)
        list.append(key: 8)
        XCTAssertTrue(list.removeDupes())
        print("keys: ", list.printKeys())
        XCTAssert(list.printKeys() == "1 -> 2 -> 3 -> 31 -> 6 -> 7 -> 8")
    }
    
    func testSliceRightReturnsNilWhenListIsEmpty() {
        let list = LinkedList<Int>()
        XCTAssertNil(list.sliceRight(from: 4))
    }
    
    func testSliceRightReturnsNilWhenFromIndexIsOutOfBounds() {
        let list = LinkedList<Int>()
        list.append(key: 1)
        list.append(key: 2)
        list.append(key: 3)
        list.append(key: 4)
        list.append(key: 5)
        list.append(key: 6)
        XCTAssertNil(list.sliceRight(from: -4))
        XCTAssertNil(list.sliceRight(from: 17))
    }
    
    func testSliceRightReturnsHeadWhenSliceIndexIsZero() {
        let list = LinkedList<Int>()
        let head = list.append(key: 1)
        list.append(key: 2)
        list.append(key: 3)
        list.append(key: 4)
        list.append(key: 5)
        list.append(key: 6)
        XCTAssert(list.sliceRight(from: 0) == head)
    }
    
    func testSliceRightSlicesListWhenSliceIndexIsGreaterThanZero() {
        let list = LinkedList<Int>()
        list.append(key: 1)
        list.append(key: 2)
        list.append(key: 3)
        list.append(key: 4)
        let newHead = list.append(key: 5)
        list.append(key: 6)
        list.append(key: 7)
        list.append(key: 8)
        list.append(key: 9)
        list.append(key: 10)
        
        let newList = LinkedList<Int>(head: newHead, length: 6)
        
        XCTAssert(list.sliceRight(from: 4) == newHead)
        XCTAssert(list.printKeys() == "1 -> 2 -> 3 -> 4")
        XCTAssert(newList.printKeys() == "5 -> 6 -> 7 -> 8 -> 9 -> 10")
    }
}
