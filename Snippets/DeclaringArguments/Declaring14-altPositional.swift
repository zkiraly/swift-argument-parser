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
    @Flag var verbose = false
    @Argument var files: [String] = []

    mutating func run() throws {
        print("Verbose: \(verbose), files: \(files)")
    }
}
