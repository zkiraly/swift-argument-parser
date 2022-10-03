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
    @Option(name: [.short, .customLong("input")], help: "A file to read.")
    var inputFile: String

    @Option(name: [.short, .customLong("output")], help: "A file to save word counts to.")
    var outputFile: String

    @Flag(name: .shortAndLong, help: "Print status updates while counting.")
    var verbose = false

    mutating func run() throws { /* _ */ }
}
