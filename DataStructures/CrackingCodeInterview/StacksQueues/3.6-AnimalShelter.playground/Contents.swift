//: Playground - noun: a place where people can play

import Foundation
import DataStructures

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

animals.filter { $0.type == .dog }.count
animals.filter { $0.type == .cat }.count

let shelter = Shelter()

for a in animals {
    shelter.enQueue(animal: a)
}

let sorted = animals
    .filter { $0.type == .dog }

shelter.dequeueAny()?.name // oksar (cat)
shelter.dequeueAny()?.name // cookie (cat)
shelter.dequeueDog()?.name // red (dog)
shelter.dequeueAny()?.name // sprinkles (cat)


