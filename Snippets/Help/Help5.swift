// snippet.hide
//
//  File.swift
//  
//
//  Created by Zsolt Kiraly on 1/31/22.
//

import ArgumentParser

// snippet.show
struct Parent: ParsableCommand {
    static let configuration = CommandConfiguration(
        subcommands: [Child.self],
        helpNames: [.long, .customShort("?")])

    struct Child: ParsableCommand {
        @Option(name: .shortAndLong, help: "The host the server will run on.")
        var host: String
    }
}
// snippet.hide
