// MARK: Hide
//
//  File.swift
//  
//
//  Created by Zsolt Kiraly on 1/27/22.
//
import ArgumentParser

// MARK: Show
struct Example: ParsableCommand {
    @Argument var files: [String] = []
    @Option var count: Int?
    @Option var index = 0
    @Flag var verbose = false
    @Flag var stripWhitespace = false
}
// MARK: Hide
