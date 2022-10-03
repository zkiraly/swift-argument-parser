// snippet.hide
//
//  GettingStarted1.swift
//
//
//  Created by Zsolt Kiraly on 1/25/22.
//

// snippet.show
import ArgumentParser

struct Count: ParsableCommand {
    @Argument var inputFile: String
    @Argument var outputFile: String
    
    mutating func run() throws {
        print("""
            Counting words in '\(inputFile)' \
            and writing the result into '\(outputFile)'.
            """)
            
        // Read 'inputFile', count the words, and save to 'outputFile'.
    }
}

