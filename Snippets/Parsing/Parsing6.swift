// snippet.hide
//
//  File.swift
//
//
//  Created by Zsolt Kiraly on 2/3/22.
//

import ArgumentParser

struct SelectOptions: ParsableArguments {
    @Option var count: Int = 1
    @Argument var elements: [String] = []
}

// snippet.show
let noShoutingArguments = CommandLine.arguments.dropFirst().filter { phrase in
    phrase.uppercased() != phrase
}
let options = SelectOptions.parseOrExit(noShoutingArguments)
// snippet.hide

guard options.elements.count >= options.count else {
    let error = ValidationError("Please specify a 'count' less than the number of elements.")
    SelectOptions.exit(withError: error)
}

let chosen = options.elements
    .shuffled()
    .prefix(options.count)
print(chosen.joined(separator: "\n"))

