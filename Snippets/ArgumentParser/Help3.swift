// MARK: Hide
//
//  File.swift
//  
//
//  Created by Zsolt Kiraly on 1/31/22.
//

import ArgumentParser

// MARK: Show
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
// MARK: Hide

Repeat.main()
