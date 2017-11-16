//
//  StackTests.swift
//  DataStructuresTests
//
//  Created by Aaron Connolly on 11/15/17.
//  Copyright © 2017 Top Turn Software. All rights reserved.
//

import XCTest
@testable import DataStructures

class StackTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Initialized state
    
    func testNewStackCountIsZero() {
        let stack = Stack<Int>()
        XCTAssert(stack.count == 0)
    }
    
    func testNewStackIsEmpty() {
        let stack = Stack<Int>()
        XCTAssert(stack.isEmpty() == true)
    }
    
    func testNewStackPeekReturnsNil() {
        let stack = Stack<Int>()
        XCTAssert(stack.peek() == nil)
    }
    
    // push
    
    func testPushIncrementsStackCountWhenStackHasOneItem() {
        let stack = Stack<Int>()
        stack.push(key: 5)
        XCTAssert(stack.count == 1)
    }
    
    func testPushAddsItemsInFirstInLastOutOrder() {
        let stack = Stack<Int>()
        stack.push(key: 1)
        stack.push(key: 2)
        stack.push(key: 3)
        stack.push(key: 4)
        XCTAssert(stack.printKeys() == "4,3,2,1")
    }
    
    func testPushAddsItemsAndKeepsAccurateCount() {
        let stack = Stack<Int>()
        stack.push(key: 0)
        stack.push(key: 5)
        stack.push(key: 9)
        stack.push(key: 31)
        stack.push(key: 8)
        XCTAssert(stack.count == 5)
    }
    
    // pop
    
    func testPopReturnsNilWhenStackHasNoItems() {
        let stack = Stack<Int>()
        XCTAssert(stack.pop() == nil)
    }
    
    func testPopDoesNotDecrementCountWhenStackHasNoItems() {
        let stack = Stack<Int>()
        XCTAssert(stack.count == 0)
        
        stack.pop()
        stack.pop()
        stack.pop()
        
        XCTAssert(stack.count == 0)
    }
    
    func testPopRemovesAndReturnsFirstItemInStackWithOneItem() {
        let stack = Stack<Int>()
        stack.push(key: 7)
        let popped = stack.pop()
        
        XCTAssert(popped == 7)
        XCTAssert(stack.count == 0)
    }

    func testPopRemovesAndReturnsLastItemPushedOnStackWithSeveralItems() {
        let stack = Stack<Int>()
        stack.push(key: 7)
        stack.push(key: 1)
        stack.push(key: 3)
        stack.push(key: 15)
        XCTAssert(stack.pop() == 15)
    }
    
    func testPopDecrementsCountWhenPoppingItemOnStackWithSeveralItems() {
        let stack = Stack<Int>()
        stack.push(key: 89)
        stack.push(key: 11)
        stack.push(key: 80)
        stack.pop()
        XCTAssert(stack.count == 2)
    }
    
    func testPoppingAllItemsOnStackWithSeveralItems() {
        let stack = Stack<Int>()
        stack.push(key: 6)
        stack.push(key: 12)
        stack.push(key: 40)
        stack.push(key: 99)
        stack.push(key: 77)
        XCTAssert(stack.pop() == 77)
        XCTAssert(stack.pop() == 99)
        XCTAssert(stack.pop() == 40)
        XCTAssert(stack.pop() == 12)
        XCTAssert(stack.pop() == 6)
        XCTAssert(stack.pop() == nil)
    }
    
    // peek
    
    func testPeekReturnsNilWhenStackHasNoItems() {
        let stack = Stack<Int>()
        XCTAssert(stack.peek() == nil)
    }
    
    func testPeekReturnsItemKeyWhenStackHasOneItem() {
        let stack = Stack<Int>()
        stack.push(key: 4)
        XCTAssert(stack.peek() == 4)
    }
    
    func testPeekReturnsTopMostItemKeyWhenStackHasSeveralItems(){
        let stack = Stack<Int>()
        stack.push(key: 31)
        stack.push(key: 71)
        stack.push(key: 8)
        stack.push(key: 99)
        stack.push(key: 5)
        XCTAssert(stack.peek() == 5)
    }
    
    func testPeekDoesNotRemoveItemFromStack() {
        let stack = Stack<Int>()
        stack.push(key: 5)
        stack.push(key: 31)
        stack.push(key: 55)
        XCTAssert(stack.peek() == 55)
        XCTAssert(stack.count == 3)
    }
    
    // isEmpty
    
    func testIsEmptyIsTrueWhenStackHasNoItems() {
        let stack = Stack<Int>()
        XCTAssert(stack.isEmpty() == true)
    }
    
    func testIsEmptyIsFalseWhenStackHasOneItem() {
        let stack = Stack<Int>()
        stack.push(key: 1)
        XCTAssert(stack.isEmpty() == false)
    }
    
    func testIsEmptyIsFalseWhenStackHasSeveralItems() {
        let stack = Stack<Int>()
        stack.push(key: 1)
        stack.push(key: 2)
        stack.push(key: 3)
        XCTAssert(stack.isEmpty() == false)
    }
    
    func testIsEmptyIsTrueWhenStackPushesAndPopsAllItems() {
        let stack = Stack<Int>()
        stack.push(key: 1)
        stack.push(key: 2)
        stack.push(key: 3)
        stack.push(key: 4)
        stack.push(key: 5)
        
        stack.pop() // 5
        stack.pop() // 4
        stack.pop() // 3
        stack.pop() // 2
        stack.pop() // 1

        XCTAssert(stack.isEmpty() == true)
    }
    
    // printKeys
    
    func testPrintKeysReturnsNoEmptyMessageWhenStackHasNoItems() {
        let stack = Stack<Int>()
        XCTAssert(stack.printKeys() == "Stack is empty!")
    }
    
    func testPrintKeysReturnsStringWhenStackHasOneItem() {
        let stack = Stack<Int>()
        stack.push(key: 31)
        XCTAssert(stack.printKeys() == "31")
    }
    
    func testPrintKeysReturnsStringWhenStackHasSeveralItems() {
        let stack = Stack<Int>()
        stack.push(key: 8)
        stack.push(key: 18)
        stack.push(key: 71)
        stack.push(key: 91)
        XCTAssert(stack.printKeys() == "91,71,18,8")
    }
    
}
