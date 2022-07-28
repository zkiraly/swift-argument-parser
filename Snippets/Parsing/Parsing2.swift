// snippet.hide
//
//  File.swift
//
//
//  Created by Zsolt Kiraly on 2/3/22.
//

import ArgumentParser

struct SelectOptions: ParsableArguments {
    @Option var count: Int = 1
    @Argument var elements: [String] = []
}

// snippet.show
let options = SelectOptions.parseOrExit()

