// MARK: Hide
//
//  File.swift
//  File
//
//  Created by Zsolt Kiraly on 2/3/22.
//

import ArgumentParser
import Foundation

// MARK: Show
struct LineCount: ParsableCommand {
    @Argument var file: String

    mutating func run() throws {
        let contents = try String(contentsOfFile: file, encoding: .utf8)
        let lines = contents.split(separator: "\n")
        print(lines.count)
    }
}
// MARK: Hide
