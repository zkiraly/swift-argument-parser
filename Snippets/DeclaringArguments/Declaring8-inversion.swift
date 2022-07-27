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
    @Flag(inversion: .prefixedNo)
    var index = true

    @Flag(inversion: .prefixedEnableDisable)
    var requiredElement: Bool

    mutating func run() throws {
        print(index, requiredElement)
    }
}
