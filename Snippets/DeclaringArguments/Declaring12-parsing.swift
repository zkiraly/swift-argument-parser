// MARK: Hide
//
//  File.swift
//  
//
//  Created by Zsolt Kiraly on 1/27/22.
//

import ArgumentParser

// MARK: Show
struct Example: ParsableCommand {
    @Flag var verbose = false
    @Option var name: String
    @Argument var file: String?

    mutating func run() throws {
        print("Verbose: \(verbose), name: \(name), file: \(file ?? "none")")
    }
}
// MARK: Hide
