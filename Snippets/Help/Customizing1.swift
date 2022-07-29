// snippet.hide
//
//  File.swift
//  
//
//  Created by Zsolt Kiraly on 1/31/22.
//

import ArgumentParser

// snippet.show
struct Repeat: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "Repeats your input phrase.",
        usage: """
            repeat <phrase>
            repeat --count <count> <phrase>
            """,
        discussion: """
            Prints to stdout forever, or until you halt the program.
            """)

    @Argument(help: "The phrase to repeat.")
    var phrase: String

    @Option(help: "How many times to repeat.")
    var count: Int?

    mutating func run() throws {
        for _ in 0..<(count ?? 2) {
            print(phrase)
        }
    }
}
// snippet.hide

