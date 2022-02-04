// MARK: Hide
//
//  File.swift
//  File
//
//  Created by Zsolt Kiraly on 2/3/22.
//

import ArgumentParser

// MARK: Show
func listExecutables(_ arguments: [String]) -> [String] {
    // Generate the list of executables in the current directory
    // MARK: Hide
    return [""]
    // MARK: Show
}

struct SwiftRun {
    @Option(help: "The target to execute.", completion: .custom(listExecutables))
    var target: String?
}
