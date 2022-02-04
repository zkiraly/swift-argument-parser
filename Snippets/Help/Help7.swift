//MARK: Hide
//
//  File.swift
//  
//
//  Created by Zsolt Kiraly on 1/31/22.
//

import ArgumentParser

struct Repeat: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "Repeats your input phrase.",
        discussion: """
            Prints to stdout forever, or until you halt the program.
            """)

    @Argument(help: "The phrase to repeat.")
    var phrase: String

    mutating func run() throws {
        while true { print(phrase) }
        
        
    }
}

// MARK: Show
let help = Repeat.helpMessage()
// `help` matches the output above

let fortyColumnHelp = Repeat.helpMessage(columns: 40)
// `fortyColumnHelp` is the same help screen, but wrapped to 40 columns
// MARK: Hide
print(help)

Repeat.main()
