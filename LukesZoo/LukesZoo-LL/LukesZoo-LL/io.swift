//
//  io.swift
//  LukesZoo-LL
//
//  Created by Lucas Lell on 10/13/16.
//  Copyright © 2016 Luuke192. All rights reserved.
//

import Foundation
// Input Output from Jeff (It's a SAVIOR)
class Io {
    func getInput() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        let str = NSString(data: inputData, encoding: String.Encoding.utf8.rawValue)
        if let string = str {
            return string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        } else {
            return "Check your keyboard or something!"
        }
    }
// Neat output function :)
    func writeOutput(_ message: String) {
        print("\(message)")
    }
}
