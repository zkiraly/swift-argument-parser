// snippet.hide
//
//  File.swift
//  
//
//  Created by Zsolt Kiraly on 1/31/22.
//

import ArgumentParser

// snippet.show
struct Example: ParsableCommand {
    static let configuration = CommandConfiguration(
        helpNames: [.long, .customShort("?")])

    @Option(name: .shortAndLong, help: "The number of history entries to show.")
    var historyDepth: Int

    mutating func run() throws {
        printHistory(depth: historyDepth)
    }
}
// snippet.hide

extension Example {
    func printHistory(depth: Int) {
        /* _ */
    }
}
