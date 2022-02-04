// MARK: Hide
//
//  GettingStarted2.swift
//
//
//  Created by Zsolt Kiraly on 1/25/22.
//
import ArgumentParser
// MARK: Show
struct Count: ParsableCommand {
    @Option var inputFile: String
    @Option var outputFile: String
    
    mutating func run() throws {
        print("""
            Counting words in '\(inputFile)' \
            and writing the result into '\(outputFile)'.
            """)
            
        // Read 'inputFile', count the words, and save to 'outputFile'.
    }
}
