// snippet.hide
//
//  Overview.swift
//  
//
//  Created by Zsolt Kiraly on 1/21/22.
//
// snippet.show
import ArgumentParser

struct Repeat: ParsableCommand {
    @Argument(help: "The phrase to repeat.")
    var phrase: String

    @Option(help: "The number of times to repeat 'phrase'.")
    var count: Int?

    mutating func run() throws {
        let repeatCount = count ?? 2
        for _ in 0..<repeatCount {
            print(phrase)
        }
    }
}
