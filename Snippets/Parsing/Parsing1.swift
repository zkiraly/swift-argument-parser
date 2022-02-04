// MARK: Hide
//
//  File.swift
//  
//
//  Created by Zsolt Kiraly on 2/3/22.
//

import ArgumentParser

// MARK: Show
struct SelectOptions: ParsableArguments {
    @Option var count: Int = 1
    @Argument var elements: [String] = []
}
