// snippet.hide
//
//  File.swift
//  
//
//  Created by Zsolt Kiraly on 1/27/22.
//

import ArgumentParser

// snippet.show
enum CacheMethod: String, EnumerableFlag {
    case inMemoryCache
    case persistentCache
}

enum Color: String, EnumerableFlag {
    case pink, purple, silver
}

struct Example: ParsableCommand {
    @Flag var cacheMethod: CacheMethod
    @Flag var colors: [Color] = []

    mutating func run() throws {
        print(cacheMethod)
        print(colors)
    }
}
