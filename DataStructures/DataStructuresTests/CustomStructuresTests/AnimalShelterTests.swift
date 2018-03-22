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
        ShelterAnimal(type: .cat, name: "Oskar"),
        ShelterAnimal(type: .cat, name: "Cookie"),
        ShelterAnimal(type: .cat, name: "Sprinkles"),
        ShelterAnimal(type: .dog, name: "Red"),
        ShelterAnimal(type: .dog, name: "Shep"),
        ShelterAnimal(type: .dog, name: "Lassie"),
        ShelterAnimal(type: .cat, name: "Dave"),
        ShelterAnimal(type: .cat, name: "Scratchy"),
        ShelterAnimal(type: .cat, name: "Biscuit"),
        ShelterAnimal(type: .cat, name: "Freddy"),
        ShelterAnimal(type: .dog, name: "Tootles"),
        ShelterAnimal(type: .dog, name: "Virginia"),
        ShelterAnimal(type: .dog, name: "Bourbon"),
        ShelterAnimal(type: .dog, name: "Barkley"),
        ShelterAnimal(type: .dog, name: "Rufus"),
        ShelterAnimal(type: .cat, name: "Bitsy"),
        ShelterAnimal(type: .dog, name: "Whiskey"),
        ShelterAnimal(type: .dog, name: "Holly"),
        ShelterAnimal(type: .cat, name: "Polly"),
        ShelterAnimal(type: .dog, name: "Barney"),
        ShelterAnimal(type: .dog, name: "Frankie"),
        ShelterAnimal(type: .dog, name: "Sparkles"),
        ShelterAnimal(type: .dog, name: "Captain Bojangles"),
        ShelterAnimal(type: .cat, name: "Meowser"),
        ShelterAnimal(type: .dog, name: "Billy"),
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
        for var a in animals {
            shelter.enQueue(animal: &a)
        }
    }
    
    func clearShelter() {
        shelter.clear()
    }
    
    // Before each?
    
    func testShelterDequeueAnyReturnsNilWhenShelterIsEmpty() {
        XCTAssert(shelter.dequeueAny() == nil)
    }
    
    func testShelterDequeueAnyReturnsOldestAnimalWhenShelterIsFilled() {
        clearShelter()
        fillShelter()
        let oldest = shelter.dequeueAny()
        XCTAssert(oldest?.type == .dog)
        XCTAssert(oldest?.name == "Billy")
    }
    
    func testShelterDequeueAnyReturnsNextOldestDogWhenNumberOfDogsIsEqualToNumberOfCats() {
        clearShelter()
        fillShelter()
        shelter.dequeueAny()    // billy
        shelter.dequeueAny()    // red
        shelter.dequeueAny()    // shep
        shelter.dequeueAny()    // lassie
        let next = shelter.dequeueAny()
        XCTAssert(next?.type == .dog)
        XCTAssert(next?.name == "Barney")
    }
    
    func testShelterDequeueAnyReturnsNextOldestCatWhenNumberOfCatsGreaterThanNumberOfDogs() {
        clearShelter()
        fillShelter()
        shelter.dequeueAny()    // billy
        shelter.dequeueAny()    // red
        shelter.dequeueAny()    // shep
        shelter.dequeueAny()    // lassie
        shelter.dequeueAny()    // barney
        let next = shelter.dequeueAny()
        XCTAssert(next?.type == .cat)
        XCTAssert(next?.name == "Oskar")
    }
    
    func testShelterDequeueCatReturnsNextOldestCat() {
        clearShelter()
        fillShelter()
        var next = shelter.dequeueCat()
        XCTAssert(next?.type == .cat)
        XCTAssert(next?.name == "Oskar")
        
        next = shelter.dequeueCat()
        XCTAssert(next?.type == .cat)
        XCTAssert(next?.name == "Cookie")
        
        next = shelter.dequeueCat()
        XCTAssert(next?.type == .cat)
        XCTAssert(next?.name == "Sprinkles")
    }
    
    func testShelterDequeueCatReturnsNextOldestDog() {
        clearShelter()
        fillShelter()
        var next = shelter.dequeueDog()
        XCTAssert(next?.type == .dog)
        XCTAssert(next?.name == "Billy")
        
        next = shelter.dequeueDog()
        XCTAssert(next?.type == .dog)
        XCTAssert(next?.name == "Red")
        
        next = shelter.dequeueDog()
        XCTAssert(next?.type == .dog)
        XCTAssert(next?.name == "Shep")
    }
}
