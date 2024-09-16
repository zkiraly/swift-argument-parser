// snippet.hide
//
//  File.swift
//  File
//
//  Created by Zsolt Kiraly on 2/3/22.
//

import ArgumentParser

// snippet.show
func listExecutables(_ arguments: [String]) -> [String] {
    // Generate the list of executables in the current directory
    // snippet.hide
    return [""]
    // snippet.show
}

struct SwiftRun {
    @Option(help: "The target to execute.", completion: .custom(listExecutables))
    var target: String?
}
