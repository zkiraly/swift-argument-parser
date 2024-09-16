// snippet.hide
//
//  File.swift
//  
//
//  Created by Zsolt Kiraly on 1/25/22.
//

import ArgumentParser
// snippet.show
struct Count: ParsableCommand {
    @Option var inputFile: String
    @Option var outputFile: String
    @Flag var verbose = false
    
    mutating func run() throws {
        if verbose {
            print("""
                Counting words in '\(inputFile)' \
                and writing the result into '\(outputFile)'.
                """)
        }
 
        // Read 'inputFile', count the words, and save to 'outputFile'.
    }
}
