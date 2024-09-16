// snippet.hide
//
//  File.swift
//  
//
//  Created by Zsolt Kiraly on 1/27/22.
//

import ArgumentParser

// snippet.show
struct Example: ParsableCommand {
    @Option var userName: String
    @Argument var value: Int
}
