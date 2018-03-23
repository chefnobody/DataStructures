//
//  AnimalShelterTests.swift
//  DataStructuresTests
//
//  Created by Aaron Connolly on 3/22/18.
//  Copyright © 2018 Top Turn Software. All rights reserved.
//

import XCTest
import DataStructures

class AnimalShelterTests: XCTestCase {
    
    let shelter = Shelter()
    
    let animals = [
        Animal(type: .cat, name: "Oskar"),
        Animal(type: .cat, name: "Cookie"),
        Animal(type: .cat, name: "Sprinkles"),
        Animal(type: .dog, name: "Red"),
        Animal(type: .dog, name: "Shep"),
        Animal(type: .dog, name: "Lassie"),
        Animal(type: .cat, name: "Dave"),
        Animal(type: .cat, name: "Scratchy"),
        Animal(type: .cat, name: "Biscuit"),
        Animal(type: .cat, name: "Freddy"),
        Animal(type: .dog, name: "Tootles"),
        Animal(type: .dog, name: "Virginia"),
        Animal(type: .dog, name: "Bourbon"),
        Animal(type: .dog, name: "Barkley"),
        Animal(type: .dog, name: "Rufus"),
        Animal(type: .cat, name: "Bitsy"),
        Animal(type: .dog, name: "Whiskey"),
        Animal(type: .dog, name: "Holly"),
        Animal(type: .cat, name: "Polly"),
        Animal(type: .dog, name: "Barney"),
        Animal(type: .dog, name: "Frankie"),
        Animal(type: .dog, name: "Sparkles"),
        Animal(type: .dog, name: "Captain Bojangles"),
        Animal(type: .cat, name: "Meowser"),
        Animal(type: .dog, name: "Billy"),
        ]
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func fillShelter() {
        // This is flawed because you enter all the cats and
        // then all the dogs. Naturally cats and dogs would
        // stagger in at different intervals.
        for a in animals {
            shelter.enQueue(animal: a)
        }
    }
    
    func clearShelter() {
        shelter.clear()
    }
    
    func emptyShelter() {
        for _ in 0..<animals.count {
            shelter.dequeueAny()
        }
    }
    
    // Before each?
    
    func testShelterDequeueAnyReturnsNilWhenShelterIsEmpty() {
        XCTAssert(shelter.dequeueAny() == nil)
    }
    
    func testShelterDequeueAnyReturnsOldestAnimalWhenShelterIsFilled() {
        clearShelter()
        fillShelter()
        let oldest = shelter.dequeueAny()
        XCTAssert(oldest?.type == .cat)
        XCTAssert(oldest?.name == "Oskar")
    }
    
    func testShelterDequeueAnyReturnsNextOldest() {
        clearShelter()
        fillShelter()
        XCTAssert(shelter.dequeueAny()?.name == "Oskar")
        XCTAssert(shelter.dequeueAny()?.name == "Cookie")
        XCTAssert(shelter.dequeueAny()?.name == "Sprinkles")
        XCTAssert(shelter.dequeueAny()?.name == "Red")
        XCTAssert(shelter.dequeueAny()?.name == "Shep")
        XCTAssert(shelter.dequeueAny()?.name == "Lassie")
        XCTAssert(shelter.dequeueAny()?.name == "Dave")
        XCTAssert(shelter.dequeueAny()?.name == "Scratchy")
    }
    
    func testShelterDequeueCatReturnsNextOldestCat() {
        clearShelter()
        fillShelter()
        XCTAssert(shelter.dequeueCat()?.name == "Oskar")
        XCTAssert(shelter.dequeueCat()?.name == "Cookie")
        XCTAssert(shelter.dequeueCat()?.name == "Sprinkles")
        XCTAssert(shelter.dequeueCat()?.name == "Dave")
        XCTAssert(shelter.dequeueCat()?.name == "Scratchy")
        XCTAssert(shelter.dequeueCat()?.name == "Biscuit")
    }
    
    func testShelterDequeueCatReturnsNextOldestDog() {
        clearShelter()
        fillShelter()
        XCTAssert(shelter.dequeueDog()?.name == "Red")
        XCTAssert(shelter.dequeueDog()?.name == "Shep")
        XCTAssert(shelter.dequeueDog()?.name == "Lassie")
        XCTAssert(shelter.dequeueDog()?.name == "Tootles")
        XCTAssert(shelter.dequeueDog()?.name == "Virginia")
        XCTAssert(shelter.dequeueDog()?.name == "Bourbon")
        XCTAssert(shelter.dequeueDog()?.name == "Barkley")
        XCTAssert(shelter.dequeueDog()?.name == "Rufus")
        XCTAssert(shelter.dequeueDog()?.name == "Whiskey")
    }
    
    func testShelterDequeueAnyReturnsNilWhenShelterIsCleared() {
        clearShelter()
        fillShelter()
        emptyShelter()
        XCTAssertNil(shelter.dequeueAny())
    }
    
    func testShelterDequeueCatReturnsNilWhenShelterIsCleared() {
        clearShelter()
        fillShelter()
        emptyShelter()
        XCTAssertNil(shelter.dequeueCat())
    }
    
    func testShelterDequeueDogReturnsNilWhenShelterIsCleared() {
        clearShelter()
        fillShelter()
        emptyShelter()
        XCTAssertNil(shelter.dequeueDog())
    }
}
