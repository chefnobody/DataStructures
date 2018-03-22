//: Playground - noun: a place where people can play

import Foundation
import DataStructures

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

animals.filter { $0.type == .dog }.count
animals.filter { $0.type == .cat }.count

let shelter = Shelter()

for var a in animals {
    a.logicalAge = 31
    shelter.enQueue(animal: a)
}

let sorted = animals
    .filter { $0.type == .dog }
    .sorted { $0.logicalAge < $1.logicalAge }
//print(sorted)

var oskar = ShelterAnimal(type: .cat, name: "Oskar")
oskar.logicalAge = 31
print(oskar)

