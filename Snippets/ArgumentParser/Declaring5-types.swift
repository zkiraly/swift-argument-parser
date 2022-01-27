// MARK: Hide
//
//  File.swift
//  
//
//  Created by Zsolt Kiraly on 1/27/22.
//

import ArgumentParser

// MARK: Show
struct Path: ExpressibleByArgument {
    var pathString: String

    init?(argument: String) {
        self.pathString = argument
    }
}

struct Example: ParsableCommand {
    @Argument var inputFile: Path
}
// MARK: Hide
