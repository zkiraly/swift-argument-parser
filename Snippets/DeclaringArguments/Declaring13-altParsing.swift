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
    @Option var file: [String] = []
    @Flag var verbose = false

    mutating func run() throws {
        print("Verbose: \(verbose), files: \(file)")
    }
}
