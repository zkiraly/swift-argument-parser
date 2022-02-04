// MARK: Hide
//
//  File.swift
//  File
//
//  Created by Zsolt Kiraly on 2/3/22.
//

import ArgumentParser

// MARK: Show
struct RuntimeError: Error, CustomStringConvertible {
    var description: String
}

struct Example: ParsableCommand {
    @Argument var inputFile: String

    mutating func run() throws {
        if !ExampleCore.processFile(inputFile) {
            // ExampleCore.processFile(_:) prints its own errors
            // and returns `false` on failure.
            throw ExitCode.failure
        }
    }
}
// MARK: Hide

extension Example {
    struct ExampleCore {
        static func processFile(_ file: String) -> Bool {
            return false
        }
    }
}
