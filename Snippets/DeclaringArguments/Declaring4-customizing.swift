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
    @Flag(name: .long)  // Same as the default
    var stripWhitespace = false

    @Flag(name: .short)
    var verbose = false

    @Option(name: .customLong("count"))
    var iterationCount: Int

    @Option(name: [.customShort("I"), .long])
    var inputFile: String
}
