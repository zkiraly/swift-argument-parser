// snippet.hide
//
//  File.swift
//  
//
//  Created by Zsolt Kiraly on 1/25/22.
//

import ArgumentParser
// snippet.show
struct Count: ParsableCommand {
    @Option(name: [.short, .customLong("input")])
    var inputFile: String

    @Option(name: [.short, .customLong("output")])
    var outputFile: String

    @Flag(name: .shortAndLong)
    var verbose = false
    
    mutating func run() throws { /* _ */ }
}
