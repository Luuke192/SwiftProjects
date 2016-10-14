//
//  userInteract.swift
//  LukesZoo-LL
//
//  Created by Lucas Lell on 10/13/16.
//  Copyright © 2016 Luuke192. All rights reserved.
//

import Foundation

class UserInteract {
    private var done: Bool = false
    private var currentInput: String = ""
    private let io = Io()
    private let zooInfo = ZooMain()
    
    func mainMenu () {
        while !done {
            currentInput = io.getInput().uppercased()
            if currentInput == "Q" {
                print("Goodbye!")
                exit(EXIT_SUCCESS)
            } else {
                // Main Menu Screen
                io.writeOutput("\n!!ALL COMMAND ENTRIES ARE FOLLOWED BY THE RETURN KEY!!\n")
                io.writeOutput("---- Luke's Zootopia! ----")
                io.writeOutput("Type NA to add a new animal.")
                io.writeOutput("Type NP to add a new person.")
                io.writeOutput("Type LE to list all employees.")
                io.writeOutput("Type LV to list all visitors.")
                io.writeOutput("Type SM to show all mammals.")
                io.writeOutput("Type SA to show all amphibians.")
                io.writeOutput("Type SB to show all birds.")
                io.writeOutput("Type SD to show all dinosaurs.")
                io.writeOutput("Type Q to quit.")
                // Main Menu Functions
                if currentInput == "NA" {
                    zooInfo.newAnimal(getAnimalType())
                } else if currentInput == "NP" {
                    zooInfo.newPerson(getPersonType())
                } else if currentInput == "LE" {
                    zooInfo.showEmployees()
                } else if currentInput == "LV" {
                    zooInfo.showVisitors()
                } else if currentInput == "SM" {
                    zooInfo.showMammals()
                } else if currentInput == "SA" {
                    zooInfo.showAmphibians()
                } else if currentInput == "SB" {
                    zooInfo.showBirds()
                } else if currentInput == "SD" {
                    zooInfo.showDinos()
                }
            }
        }
    }
    //Get Animal Type from user
    func getAnimalType() -> String {
        print("\nHmm...a new animal? What type of animal is it? Type 'M' for Mammal, 'A' for Amphibian, 'D' for Dinosaur, or 'B' for Bird!")
        currentInput = io.getInput().uppercased()
        
        if currentInput == "M" {
            return "MAMMAL"
        } else if currentInput == "A" {
            return "AMPHIBIAN"
        } else if currentInput == "B" {
            return "BIRD"
        } else if currentInput == "D" {
            return "DINOSAUR"
        } else {
            return "ERROR"
        }
    }
    //Get Person Type from user
    func getPersonType() -> String {
        print("\nOh someone new! Is he/she going to be an employee? Type 'Y' or 'Yes' for yes. 'N' or 'No' for no!")
        currentInput = io.getInput().uppercased()
        
        if currentInput == "Y" || currentInput == "YES" {
            return "EMPLOYEE"
        } else if currentInput == "N" || currentInput == "NO" {
            return "VISITOR"
        } else {
            return "INVALID"
        }
    }
}
