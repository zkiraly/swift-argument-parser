// MARK: Hide
//
//  File.swift
//  
//
//  Created by Zsolt Kiraly on 1/31/22.
//

import ArgumentParser

// MARK: Show
struct Example: ParsableCommand {
    @Flag(help: .hidden)
    var experimentalEnableWidgets: Bool = false
}
// MARK: Hide



Example.main()
