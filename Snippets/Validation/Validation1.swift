// snippet.hide
//
//  File.swift
//  File
//
//  Created by Zsolt Kiraly on 2/3/22.
//

import ArgumentParser

// snippet.show
struct Select: ParsableCommand {
    @Option var count: Int = 1
    @Argument var elements: [String] = []

    mutating func validate() throws {
        guard count >= 1 else {
            throw ValidationError("Please specify a 'count' of at least 1.")
        }

        guard !elements.isEmpty else {
            throw ValidationError("Please provide at least one element to choose from.")
        }

        guard count <= elements.count else {
            throw ValidationError("Please specify a 'count' less than the number of elements.")
        }
    }

    mutating func run() {
        print(elements.shuffled().prefix(count).joined(separator: "\n"))
    }
}
