// snippet.hide
//
//  File.swift
//  
//
//  Created by Zsolt Kiraly on 1/31/22.
//

import ArgumentParser

// snippet.show
struct Example: ParsableCommand {
    @Flag(help: .hidden)
    var experimentalEnableWidgets: Bool = false
}
// snippet.hide
Example.main()
