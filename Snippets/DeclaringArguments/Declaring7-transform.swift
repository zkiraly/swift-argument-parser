// snippet.hide
//
//  File.swift
//  
//
//  Created by Zsolt Kiraly on 1/27/22.
//

import ArgumentParser

// snippet.show
enum Format {
    case text
    case other(String)

    init(_ string: String) throws {
        if string == "text" {
            self = .text
        } else {
            self = .other(string)
        }
    }
}

struct Example: ParsableCommand {
    @Argument(transform: Format.init)
    var format: Format
}
