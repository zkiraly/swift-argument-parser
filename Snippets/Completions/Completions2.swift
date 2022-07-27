// snippet.hide
//
//  File.swift
//  File
//
//  Created by Zsolt Kiraly on 2/3/22.
//

import ArgumentParser

// snippet.show
struct File: Hashable, ExpressibleByArgument {
    var path: String
    
    init?(argument: String) {
        self.path = argument
    }
    
    static var defaultCompletionKind: CompletionKind {
        .file()
    }
}
