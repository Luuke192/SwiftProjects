//
//  typeArrays.swift
//  LukesZoo-LL
//
//  Created by Lucas Lell on 10/13/16.
//  Copyright © 2016 Luuke192. All rights reserved.
//

import Foundation


// **Main Parent Classes**

class Person {
    var name: String
    var isEmployee = false
    
    init(_ name: String) {
        self.name = name
    }
}

class Animal {
    var name: String
    var exhibit: Exhibit
    var species: String
    
    enum Exhibit: String {
        case mammalsRoam = "'Where The Mammals Roam'"
        case amphibianTank = "'Something Smells Fishy'"
        case teamEagle = "'Team Eagle Roost'"
        case jurassicPark = "'Jurassic Park'"
    }
    
    init(_ name: String, _ exhibit: Exhibit, _ species: String) {
        self.name = name
        self.exhibit = exhibit
        self.species = species
    }
}

// **Main Parent Classes**


// **Person Children**

class Visitor: Person {
    override init(_ name: String) {
        super.init(name)
        isEmployee = false
    }
}

class Employee: Person {
    var tag: Int
    
    init(_ name: String, _ tag: Int) {
        self.tag = tag
        super.init(name)
        isEmployee = true
    }
}

// **Person Children**


// **Animal Children**

class Amphibian: Animal {
    var weight: Int
    
    init(_ name: String, _ exhibit: Exhibit, _ species: String, _ weight: Int) {
        self.weight = weight
        super.init(name, exhibit, species)
    }
}

class Mammal: Animal {
    var hasFur: Bool
    
    init(_ name: String, _ exhibit: Exhibit, _ species: String, _ hasFur: Bool) {
        self.hasFur = hasFur
        super.init(name, exhibit, species)
    }
    
}

class Birds: Animal {
    var flightless: Bool
    
    init(_ name: String, _ exhibit: Exhibit, _ species: String, _ flightless: Bool) {
        self.flightless = flightless
        super.init(name, exhibit, species)
    }
}

class Dinosaur: Animal {
    var carnivore: Bool
    
    init(_ name: String, _ exhibit: Exhibit, _ species: String, _ carnivore: Bool) {
        self.carnivore = carnivore
        super.init(name, exhibit, species)
    }
}

// **Animal Children**


