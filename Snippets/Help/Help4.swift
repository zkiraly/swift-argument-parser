// MARK: Hide
//
//  File.swift
//  
//
//  Created by Zsolt Kiraly on 1/31/22.
//

import ArgumentParser

// MARK: Show
struct Example: ParsableCommand {
    static let configuration = CommandConfiguration(
        helpNames: [.long, .customShort("?")])

    @Option(name: .shortAndLong, help: "The number of history entries to show.")
    var historyDepth: Int

    mutating func run() throws {
        printHistory(depth: historyDepth)
    }
}
// MARK: Hide

extension Example { // printHistory
    func printHistory(depth: Int) { /* _ */ }
}

Example.main()
