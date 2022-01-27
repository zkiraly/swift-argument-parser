// MARK: Hide
//
//  File.swift
//  
//
//  Created by Zsolt Kiraly on 1/27/22.
//

import ArgumentParser

// MARK: Show
enum ReleaseMode: String, ExpressibleByArgument {
    case debug, release
}

struct Example: ParsableCommand {
    @Option var mode: ReleaseMode

    mutating func run() throws {
        print(mode)
    }
}
// MARK: Hide
