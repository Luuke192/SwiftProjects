//
//  library.swift
//  LukesLibrary-LL
//
//  Created by Lucas Lell on 10/12/16.
//  Copyright © 2016 Luuke192. All rights reserved.
//

import Foundation

func writeHelpMenu() {
    let io = inputOutput()
    
    io.writeMessage("\n---- Help Menu ----\n")
    io.writeMessage("If at any time using the Library, feel free to use the Help command!\n")
    io.writeMessage("Pressing 'R' at anytime during the program will return you back to start of the program.")
    io.writeMessage("The 'C' command is only to check how MANY books are available in the library. This is not a list of them.")
    io.writeMessage("Using the 'L' command will display all books that are available in the Library.")
} // Help Menu Text


class Interactive {
    public var done: Bool = false
    private var currentInput: String = ""
    private let io = inputOutput()
    private let checkLibrary = CheckLibrary()
    
    func go() {
        while !done {
            // Main menu screen
            io.writeMessage("!!ALL COMMAND ENTRIES ARE FOLLOWED BY THE RETURN KEY!!\n")
            io.writeMessage("---- Luke's Dewey Decimal Library ----")
            io.writeMessage("1.) Enter 'A' to add books.")
            io.writeMessage("2.) Enter 'C' to check how many books are available.")
            io.writeMessage("3.) Enter 'H' for the Help menu.")
            io.writeMessage("4.) Enter 'L' to list the current books available.")
            io.writeMessage("5.) Enter 'Ch' to check out a book.")
            io.writeMessage("6.) Enter 'In' to check in a book.")
            io.writeMessage("7.) Enter 'O' to see which books are currently checked out.")
            io.writeMessage("9.) Enter 'R' to return to the main menu.")
            io.writeMessage("0.) Enter 'Q' to quit during the program at any time.\n")
            currentInput = io.getInput()
            
            // User command directions
            if currentInput == "q" || currentInput == "Q"{
                done = true
            } else if currentInput == "r" || currentInput == "R" {
                go()
            } else if currentInput == "h" || currentInput == "H" {
                writeHelpMenu()
            } else if currentInput == "a" || currentInput == "A" {
                checkLibrary.addBook()
            } else if currentInput == "c" || currentInput == "C" {
                checkLibrary.checkBooksAvailable()
            } else if currentInput == "l" || currentInput == "L" {
                checkLibrary.listBooks()
            } else if currentInput == "ch" || currentInput == "Ch" || currentInput == "cH" || currentInput == "CH" {
                checkLibrary.checkOut()
            } else if currentInput == "in" || currentInput == "In" || currentInput == "iN" || currentInput == "IN" {
                checkLibrary.checkIn()
            } else if currentInput == "o" || currentInput == "O" {
                checkLibrary.listBooksOut()
            } else {
                print("'\(currentInput)' is not a vaild command!")
            }
        }
        print("\nExiting... Goodbye!")
        exit(EXIT_SUCCESS)
    }
    
} // Menu Functions


class CheckLibrary {
    private var bookIndex = ["0: Holes", "1: The Tale of Desperaux", "3: The Hunger Games", "4: Voices from Chernobyl", "5: The Sixth Extinction"].sorted(by: <)
    private var bookOut = [String] ().sorted(by: <)
    private var currentInput: String = ""
    private var bookName: String = ""
    private var bookKeyCount: Int = 6
    private var bookKeyOutCount: Int = 0
    private let io = inputOutput()
    var validInput = false
    
    
    func addBook() {
        validInput = false
        
        while validInput == false {
            
            print("\nPlease enter the name of your book into the console or 'R' to go back to the menu.\n")
            
            let inputVal = io.getInput()
            if inputVal == "c" || inputVal == "C" {
                checkBooksAvailable()
            } else if inputVal == "r" || inputVal == "R" {
                interactive.go()
            } else if inputVal == "h" || inputVal == "H" {
                writeHelpMenu()
            } else if inputVal == "l" || inputVal == "L" {
                listBooks()
            } else if inputVal == "q" || inputVal == "Q" {
                interactive.done = true
                interactive.go()
            } else if inputVal == "o" || inputVal == "O" {
                listBooksOut()
            } else if inputVal.characters.count > 0 {
                let bookName = inputVal.uppercased()
                bookIndex.append("\(bookKeyCount): \(bookName)")
                bookKeyCount += 1
            } else {
                print("Try typing something in the console next time!")
            }
        }
    }
    
    func checkOut() {
        validInput = false
        
        if bookIndex.count <= 0 {
            print("\nThe library is currently empty!")
            interactive.go()
        } else {
            while validInput == false {
                
                print("Please enter the key of the book you'd like to check out. \nType the 'L' command if you don't know the key for your book. (The key is to the left of the title!)")
                
                let inputVal = io.getInput()
                if inputVal == "c" || inputVal == "C" {
                    checkBooksAvailable()
                } else if inputVal == "r" || inputVal == "R" {
                    interactive.go()
                } else if inputVal == "h" || inputVal == "H" {
                    writeHelpMenu()
                } else if inputVal == "l" || inputVal == "L" {
                    listBooks()
                } else if inputVal == "q" || inputVal == "Q" {
                    interactive.done = true
                    interactive.go()
                } else if inputVal == "o" || inputVal == "O" {
                    listBooksOut()
                } else if inputVal.characters.count > 0{
                    let bookNameString = inputVal
                    let bookName:Int? = Int(bookNameString)
                    if bookName! <= bookIndex.count-1 {
                        let date = String(describing: NSDate ())
                        bookOut.insert(date, at: 0)
                        bookOut.insert(bookIndex[bookName!], at: 1)
                        bookIndex.remove(at: bookName!)
                    } else {
                        print("We seem to not have that book in our index. Please try again with another book.")
                    }
                }
            }
        }
    }
    
    func checkIn() {
        validInput = false
        
        if bookOut.count <= 0 {
            print("\nThere are currently no checked out books!")
            interactive.go()
        } else {
            while validInput == false {
                
                print("Please enter the key of the book you'd like to check in. \nType the 'O' command if you don't know the key for your book. (The key is to the left of the title!)")
                
                let inputVal = io.getInput()
                if inputVal == "o" || inputVal == "O" {
                    listBooksOut()
                } else if inputVal == "c" || inputVal == "C" {
                    checkBooksAvailable()
                } else if inputVal == "r" || inputVal == "R" {
                    interactive.go()
                } else if inputVal == "h" || inputVal == "H" {
                    writeHelpMenu()
                } else if inputVal == "l" || inputVal == "L" {
                    listBooks()
                } else if inputVal == "q" || inputVal == "Q" {
                    interactive.done = true
                    interactive.go()
                } else if inputVal.characters.count > 0{
                    let bookNameString = inputVal
                    let bookName:Int? = Int(bookNameString)
                    if bookName! <= bookOut.count-1 {
                        bookIndex.insert(bookOut[bookName!], at: 0)
                        bookOut.remove(at: bookName!)
                    } else {
                        print("We seem to have that book in stock. Please use the check out function!")
                    }
                }
            }
        }
    }
    
    func checkBooksOut() {
        if bookOut.count <= 0 {
            print("\nThere are no books out of the library.")
        } else {
            print("\nThe library currently has \(bookOut.count) book(s) out.\n")
        }
    }
    
    func checkBooksAvailable() {
        if bookIndex.count <= 0 {
            print("\nThe library is currently empty!")
        } else {
            print("\nThe library currently has \(bookIndex.count) book(s) on the shelves.\n")
        }
    }
    
    func listBooks() {
        if bookIndex.count <= 0 {
            print("\nThe library is empty! You can't see imaginary books so try again!\n")
        } else {
            print("\nWe currently have these books on the shelves: \(bookIndex.sorted(by: <))\n")
        }
    }
    
    func listBooksOut() {
        if bookIndex.count == 0 {
            print("We're all out of books! There's not any checked out or in so add some before you try this!")
        } else {
            if bookOut.count <= 0 {
                print("\nAll of the books are in stock! Here's a list of what we have! \(bookIndex.sorted(by: <))\n")
            } else {
                print("\nWe currently have these books checked out: \(bookOut.sorted(by: <))\n")
            }
        }
    }
}
