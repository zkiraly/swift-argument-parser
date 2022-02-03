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
    @Flag(help: "Display extra information while processing.")
    var verbose = false

    @Option(help: "The number of extra lines to show.")
    var extraLines = 0

    @Argument(help: "The input file.")
    var inputFile: String?
}
// MARK: Hide

Example.main()
