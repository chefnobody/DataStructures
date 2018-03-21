//
//  QueueTests.swift
//  DataStructuresTests
//
//  Created by Aaron Connolly on 11/16/17.
//  Copyright © 2017 Top Turn Software. All rights reserved.
//

import XCTest
@testable import DataStructures

class QueueTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: - Initialized State
    
    func testNewQueueCountIsZero() {
        let q = Queue<Int>()
        XCTAssert(q.count == 0)
    }
    
    func testNewQueueIsEmptyReturnsTrue() {
        let q = Queue<Int>()
        XCTAssert(q.isEmpty() == true)
    }
    
    // MARK: - enQueue
    
    func testEnQueueIncrementsCountWhenQueueHasOneItem() {
        let q = Queue<Int>()
        q.enQueue(key: 31)
        XCTAssert(q.count == 1)
    }

    func testEnQueueAddsItemsInFirstInFirstOutOrder() {
        let q = Queue<Int>()
        q.enQueue(key: 1)
        q.enQueue(key: 2)
        q.enQueue(key: 3)
        q.enQueue(key: 4)
        q.enQueue(key: 5)
        XCTAssert(q.printKeys() == "1,2,3,4,5")
    }
    
    func testEnQueueAddsItemsAndKeepsAccurateCount() {
        let q = Queue<Int>()
        q.enQueue(key: 1)
        q.enQueue(key: 2)
        q.enQueue(key: 3)
        XCTAssert(q.count == 3)
    }
    
    // MARK: - deQueue
    
    func testDeQueueReturnsNilWhenQueueIsEmpty() {
        let q = Queue<Int>()
        XCTAssert(q.deQueue() == nil)
    }
    
    func testDeQueueReturnsKeyAndRemovesFirstItemWhenQueueHasOneItem() {
        let q = Queue<Int>()
        q.enQueue(key: 31)
        XCTAssert(q.deQueue() == 31)
        XCTAssert(q.count == 0)
    }
    
    func testDeQueueReturnsKeyAndRemovesFirstItemWhenQueueHasSeveralItems() {
        let q = Queue<Int>()
        q.enQueue(key: 31)
        q.enQueue(key: 46)
        q.enQueue(key: 8)
        q.enQueue(key: 71)
        XCTAssert(q.deQueue() == 31)
        XCTAssert(q.count == 3)
    }
    
    func testDeQueueDecrementsCountWhenQueueHasSeveralItems() {
        let q = Queue<Int>()
        q.enQueue(key: 31)
        q.enQueue(key: 46)
        q.enQueue(key: 8)
        q.enQueue(key: 71)
        
        q.deQueue() // 31
        q.deQueue() // 46
        q.deQueue() // 8
        
        XCTAssert(q.count == 1)
    }
    
    func testDequeuingAllItemsWhenQueueHasSeveralItems() {
        let q = Queue<Int>()
        q.enQueue(key: 17)
        q.enQueue(key: 55)
        q.enQueue(key: 91)
        q.enQueue(key: 31)
        q.enQueue(key: 21)
        
        XCTAssert(q.deQueue() == 17)
        XCTAssert(q.deQueue() == 55)
        XCTAssert(q.deQueue() == 91)
        XCTAssert(q.deQueue() == 31)
        XCTAssert(q.deQueue() == 21)
        XCTAssert(q.deQueue() == nil)
    }
    
    // MARK: - peek
    
    func testPeekReturnsNilWhenQueueIsEmpty() {
        let q = Queue<Int>()
        XCTAssert(q.peek() == nil)
    }
    
    func testPeekReturnsFirstItemKeyWhenQueueHasOneItem() {
        let q = Queue<Int>()
        q.enQueue(key: 1)
        XCTAssert(q.peek() == 1)
    }
    
    func testPeekReturnsFirstItemKeyWhenQueueHasSeveralItems() {
        let q = Queue<Int>()
        q.enQueue(key: 31)
        q.enQueue(key: 2)
        q.enQueue(key: 3)
        q.enQueue(key: 4)
        XCTAssert(q.peek() == 31)
    }
    
    func testPeekDoesNotRemoveItemWhenQueueHasSeveralItems() {
        let q = Queue<Int>()
        q.enQueue(key: 17)
        q.enQueue(key: 3)
        q.enQueue(key: 4)
        XCTAssert(q.peek() == 17)
        XCTAssert(q.count == 3)
    }
    
    // MARK: - isEmpty
    
    func testIsEmptyIsTrueWhenQueueIsEmpty() {
        let q = Queue<Int>()
        XCTAssert(q.isEmpty() == true)
    }
    
    func testIsEmptyIsFalseWhenQueueHasOneItem() {
        let q = Queue<Int>()
        q.enQueue(key: 31)
        XCTAssert(q.isEmpty() == false)
    }
    
    func testIsEmptyIsFalseWhenQueueHasSeveralItems() {
        let q = Queue<Int>()
        q.enQueue(key: 31)
        q.enQueue(key: 55)
        q.enQueue(key: 71)
        XCTAssert(q.isEmpty() == false)
    }
    
    // MARK: - printKeys
    
    func testPrintKeysReturnsMessageWhenQueueIsEmpty() {
        let q = Queue<Int>()
        XCTAssert(q.printKeys() == "Queue is empty!")
    }
    
    func testPrintKeysReturnsListWhenQueueHasOneItem() {
        let q = Queue<Int>()
        q.enQueue(key: 31)
        XCTAssert(q.printKeys() == "31")
    }
    
    func testPrintKeysReturnsListWhenQueueHasSeveralItems() {
        let q = Queue<Int>()
        q.enQueue(key: 31)
        q.enQueue(key: 55)
        q.enQueue(key: 71)
        XCTAssert(q.printKeys() == "31,55,71")
    }
}

class MyQueueTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMyQueueEnqueueAddsItem() {
        let q = MyQueue<Int>()
        q.enqueue(key: 31)
        XCTAssert(q.count == 1)
    }
    
    func testMyQueueEnqueueAddsItems() {
        let q = MyQueue<Int>()
        q.enqueue(key: 31)
        q.enqueue(key: 55)
        q.enqueue(key: 79)
        q.enqueue(key: 80)
        q.enqueue(key: 2)
        q.enqueue(key: 6)
        XCTAssert(q.count == 6)
    }
    
    func testMyQueueDequeuesCorrectItems() {
        let q = MyQueue<Int>()
        q.enqueue(key: 31)
        q.enqueue(key: 55)
        q.enqueue(key: 79)
        q.enqueue(key: 80)
        q.enqueue(key: 2)
        q.enqueue(key: 6)
        XCTAssert(q.dequeue() == 31)
        XCTAssert(q.dequeue() == 55)
        XCTAssert(q.dequeue() == 79)
        XCTAssert(q.dequeue() == 80)
        XCTAssert(q.dequeue() == 2)
        XCTAssert(q.dequeue() == 6)
        XCTAssert(q.count == 0)
    }
}
