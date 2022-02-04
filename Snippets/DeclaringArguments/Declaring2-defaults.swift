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
    @Option var userName: String
    @Argument var value: Int
}
// MARK: Hide
