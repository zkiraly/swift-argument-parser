// MARK: Hide
//
//  File.swift
//  
//
//  Created by Zsolt Kiraly on 1/27/22.
//

import ArgumentParser

// MARK: Show
enum CustomFlag: String, EnumerableFlag {
    case foo, bar, baz
}

struct Example: ParsableCommand {
    @Flag
    var booleanFlag = false

    @Flag
    var arrayFlag: [CustomFlag] = [.foo, .baz]

    @Option
    var singleOption = 0

    @Option
    var arrayOption = ["bar", "qux"]

    @Argument
    var singleArgument = "quux"

    @Argument
    var arrayArgument = ["quux", "quuz"]
}
// MARK: Hide
