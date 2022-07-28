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

let options = SelectOptions.parseOrExit()

guard options.elements.count >= options.count else {
    let error = ValidationError("Please specify a 'count' less than the number of elements.")
    SelectOptions.exit(withError: error)
}

// snippet.show
let chosen = options.elements
    .shuffled()
    .prefix(options.count)
print(chosen.joined(separator: "\n"))
