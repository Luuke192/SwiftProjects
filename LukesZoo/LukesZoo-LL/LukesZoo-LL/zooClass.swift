//
//  zooClass.swift
//  LukesZoo-LL
//
//  Created by Lucas Lell on 10/13/16.
//  Copyright © 2016 Luuke192. All rights reserved.
//

import Foundation

class ZooMain {
    // Get all classes from other file for info
    var listOfEmployees = [Employee]()
    var listOfVisitors = [Visitor]()
    var listOfMammals = [Mammal]()
    var listOfBirds = [Birds]()
    var listOfAmphibians = [Amphibian]()
    var listOfDinosaurs = [Dinosaur]()
    let io = Io()
    
    // !!!!CREATING PEOPLE DOWN HERE!!!!
    
    func newPerson(_ typeOfPerson: String) {
        if typeOfPerson == "EMPLOYEE" {
            newEmployee()
        } else if typeOfPerson == "VISITOR" {
            newVisitor()
        } else {
            print("No such command! Try again.")
        }
    } // Sets type of person and prepare the correct function
    
    func newEmployee() {
        print("\nWhat's the name of the new employee?: ")
        let name = io.getInput()
        print("\nWhat should their ID tag be?: ")
        let tag = io.getInput()
        if let newTag = Int(tag) {
            let newPerson = Employee(name, newTag)
            listOfEmployees.append(newPerson)
        } else {
            print("\nTry again and please use a number this time!")
        }
    } // Get data for new employee details
    
    func newVisitor() {
        print("\nWhat's the name of the new visitor?: ")
        let name = io.getInput()
        let newPerson = Visitor(name)
        listOfVisitors.append(newPerson)
    } // Get name for the new visitor
    
    // !!!!DISPLAY PEOPLE FUNCTIONS!!!!
    
    func showEmployees() {
        print("\n----Employees----")
        if listOfEmployees.count - 1 >= 0 {
            for each in 0...listOfEmployees.count - 1 {
                print("\nEmployee Name: \(listOfEmployees[each].name)\nID: \(listOfEmployees[each].tag)\n")
            }
            print("\n")
        } else {
            return
        }
    } // Shows all employees that have been added to the Zoo
    
    func showVisitors() {
        print("\n----Visitors----")
        if listOfVisitors.count - 1 >= 0 {
            for each in 0...listOfVisitors.count - 1 {
                print("\nVisitors Name: \(listOfVisitors[each].name)\n")
            }
            print("\n")
        } else {
            return
        }
    } // Shows all visitors who have come to the Zoo
    
    // !!!!CREATING PEOPLE UP HERE!!!!
    
    
    // !!!!CREATING ANIMALS DOWN HERE!!!!
    
    func newAnimal(_ typeOfAnimal: String) {
        if typeOfAnimal == "MAMMAL" {
            newMammal()
        } else if typeOfAnimal == "AMPHIBIAN" {
            newAmphibian()
        } else if typeOfAnimal == "BIRD" {
            newBird()
        } else if typeOfAnimal == "DINOSAUR" {
            newDino()
        } else {
            print("No such command! Try again.")
        }
    } // Set type of animal from user input and call the correct function
    
    func newMammal() {
        var hasFur = false
        print("\nWhat's the name of this new mammal?:")
        let name = io.getInput()
        print("\nWhat species is it derived from?:")
        let species = io.getInput()
        print("\nDoes the new mammal have fur? Type 'Y' or 'Yes' for yes! 'N' or 'No' for no!:")
        let hasFurOrNot = io.getInput().uppercased()
        if hasFurOrNot == "Y" || hasFurOrNot == "YES" {
            hasFur = true
        }
        
        let newMammal = Mammal(name, Animal.Exhibit.mammalsRoam, species, hasFur)
        listOfMammals.append(newMammal)
    } // Get data for a new mammal's details
    
    func newAmphibian() {
        print("\nWhat's the name of this new amphibian?:")
        let name = io.getInput()
        print("\nWhat species is it derived from?:")
        let species = io.getInput()
        print("\nWhat's the weight of the new amphibian in pounds?:")
        if let weight = Int(io.getInput()) {
            let newAmphibian = Amphibian(name, Animal.Exhibit.amphibianTank, species, weight)
            listOfAmphibians.append(newAmphibian)
        } else {
            print("Try using a number value this time!")
        }
    } // Get data for a new amphibian's details
    
    func newBird() {
        var flightless = false
        print("\nWhat's the name of this new bird?:")
        let name = io.getInput()
        print("\nWhat species is it derived from?:")
        let species = io.getInput()
        print("\nCan the new bird fly or not? Type 'Y' or 'Yes' for yes! 'N' or 'No' for no!:")
        let flightlessOrNot = io.getInput().uppercased()
        if flightlessOrNot == "Y" || flightlessOrNot == "YES" {
            flightless = true
        }
        
        let newbird = Birds(name, Animal.Exhibit.teamEagle, species, flightless)
        listOfBirds.append(newbird)
    } // Get data for a new bird's details
    
    func newDino() {
        var carnivore = false
        print("\nWhat's the name of the new Dinosaur?:")
        let name = io.getInput()
        print("\nWhat species is it derived from?:")
        let species = io.getInput()
        print("\nIs this new dino a carnivore? Type 'Y' or 'Yes' for yes! 'N' or 'No' for no!:")
        let carnivoreOrNot = io.getInput().uppercased()
        if carnivoreOrNot == "Y" || carnivoreOrNot == "YES" {
            carnivore = true
        }
        
        let newDino = Dinosaur(name, Animal.Exhibit.jurassicPark, species, carnivore)
        listOfDinosaurs.append(newDino)
    } // Get data for a new dino's details

    
    // !!!!DISPLAY ANIMAL FUNCTIONS!!!!
    
    func showMammals() {
        print("\n----Mammals----")
        if listOfMammals.count - 1 >= 0 {
            for each in 0...listOfMammals.count - 1 {
                print("\nMammal Name: \(listOfMammals[each].name)\nExhibit Name: \(listOfMammals[each].exhibit.rawValue)\nSpecies Name: \(listOfMammals[each].species)\nHas Fur: \(listOfMammals[each].hasFur)")
            }
            print("\n")
        } else {
            return
        }
    } // List all mammals and their attributes
    
    func showAmphibians() {
        print("\n----Amphibians----")
        if listOfAmphibians.count - 1 >= 0 {
            for each in 0...listOfAmphibians.count - 1 {
                print("\nAmphibian Name: \(listOfAmphibians[each].name)\nExhibit Name: \(listOfAmphibians[each].exhibit.rawValue)\nSpecies Name: \(listOfAmphibians[each].species)\nWeight: \(listOfAmphibians[each].weight) lbs")
            }
            print("\n")
        } else {
            return
        }
    } // List all amphibians and their attributes
    
    func showBirds() {
        print("\n----Birds----")
        if listOfBirds.count - 1 >= 0 {
            for each in 0...listOfBirds.count - 1 {
                print("\nBird Name: \(listOfBirds[each].name)\nExhibit Name: \(listOfBirds[each].exhibit.rawValue)\nSpecies Name: \(listOfBirds[each].species)\nCan fly: \(listOfBirds[each].flightless)")
            }
            print("\n")
        } else {
            return
        }
    } // List all birds and their attributes
    
    func showDinos() {
        print("\n----Dinosaurs----")
        if listOfDinosaurs.count - 1 >= 0 {
            for each in 0...listOfDinosaurs.count - 1 {
                print("\nDinosaur Name: \(listOfDinosaurs[each].name)\nExhibit Name: \(listOfDinosaurs[each].exhibit.rawValue)\nSpecies Name: \(listOfDinosaurs[each].species)\nA carnivore: \(listOfDinosaurs[each].carnivore)")
            }
            print("\n")
        } else {
            return
        }
    } // List all dinos and their attributes

    
    // !!!!CREATING ANIMALS UP HERE!!!!
}
