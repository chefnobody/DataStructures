//
//  AnimalShelter.swift
//  DataStructures
//
//  Created by Aaron Connolly on 3/22/18.
//  Copyright © 2018 Top Turn Software. All rights reserved.
//

import Foundation

/*
 Animal Shelter:
 
 - An animal shelter, which holds only dogs and cats, operates on a strictly "first in, first out" basis.
 - People must adopt _either_ the "oldest" (based on arrival time) of all animals at the shelter, _or_ they can select whether they would prefer a dog or a cat (and will receive the oldest animal of that type).
 - They cannot select which specific animal they would like.
 
 TO DO:
 Create the data structures to maintain this system and implement operations such as enqueue, dequeueAny, dequeueDog, and dequeueCat. You may use the built-in LinkedList data structure.
 
 Concerns:
 - How do you define arrival time? (Does that even matter? If so, what use-case am I not
 - Need to know how long each dog/cat has been at the shelter. Can be called local age or logical age. For now can we just use a Queue and dequeue/enqueue? That can't be that easy.
 - To properly test this we need to prime the structure w/ data for dogs/cats
 - Do you make logical ages large numbers or small?
 - Can two animals arrive at exactly the same local age? If so, how do you resolve a collision, there?
 - What if we have two equally and locally aged cats and dogs and someone calls dequeueAny? Which do we choose?
 
 Approach 1:
 - Keep two queues 1 for dogs, 1 for cats. This makes the oldest animals the first to be released.
 - Oldest cast and oldest dog will always be the first to be dequeued.
 
 */

// This seems like a solid case for inheritance
// Where Swift's value semantics don't let me
// set the value on an Animal object inside a loop.
public enum Species {
    case dog
    case cat
}

public struct Animal {
    public var type: Species
    public var name: String
    public init(type: Species, name: String) {
        self.type = type
        self.name = name
    }
}

public struct ShelterAnimal {
    
    // MARK: - Public properties
    
    // A logical time stamp for the animal when it goes into
    // the shelter.
    public let type: Species
    public let name: String
    public var age: Int = 0
    
    public init(type: Species, name: String, age: Int) {
        self.type = type
        self.name = name
        self.age = age
    }
}

public class Shelter {
    
    // MARK: - Stored properties
    private var logicalAge: Int
    
    private var cats: Queue<ShelterAnimal>
    private var dogs: Queue<ShelterAnimal>
    
    public init() {
        logicalAge = 0
        cats = Queue<ShelterAnimal>()
        dogs = Queue<ShelterAnimal>()
    }
    
    public func clear() {
        logicalAge = 0
        cats = Queue<ShelterAnimal>()
        dogs = Queue<ShelterAnimal>()
    }
    
    // Translates Animal to ShelteredAnimal (and gives it a logical age)
    public func enQueue(animal: Animal) {
        
        // Tag the animal with the next logical "age"
        logicalAge += 1
        
        // Subclass might help w/ this. Swift Protocols, too?
        let shelteredAnimal = ShelterAnimal(type: animal.type, name: animal.name, age: logicalAge)
        
        // Depending on type, enqueue the animal
        switch animal.type {
        case .cat:
            cats.enQueue(key: shelteredAnimal)
            break
        case .dog:
            dogs.enQueue(key: shelteredAnimal)
            break
        }
        
        print("animals logical age: ", shelteredAnimal.age)
    }
    
    @discardableResult public func dequeueAny() -> ShelterAnimal? {
        
        // No cats? Give 'em a dog. No dogs? Give 'em a cat.
        if cats.isEmpty() { return dequeueDog() }
        if dogs.isEmpty() { return dequeueCat() }
        
        // Peeking should be safe.
        // Ensure we have both cats and dogs at this point.
        
        // Logical ages start with small numbers, the smaller the number
        // the older the animal.
        if cats.peek()!.age < dogs.peek()!.age {
            // this means we have older cats
            return cats.deQueue()
        } else {
            // if there's a collision (which there shouldn't be)
            // of logical ages we'll return a dog.
            return dogs.deQueue()
        }
    }
    
    @discardableResult public func dequeueCat() -> ShelterAnimal? {
        return cats.deQueue()
    }
    
    @discardableResult public func dequeueDog() -> ShelterAnimal? {
        return dogs.deQueue()
    }
}
