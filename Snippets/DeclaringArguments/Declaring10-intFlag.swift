// snippet.hide
//
//  File.swift
//  
//
//  Created by Zsolt Kiraly on 1/27/22.
//

import ArgumentParser

// snippet.show
struct Example: ParsableCommand {
    @Flag(name: .shortAndLong)
    var verbose: Int

    mutating func run() throws {
        print("Verbosity level: \(verbose)")
    }
}
