// snippet.hide
//
//  File.swift
//  File
//
//  Created by Zsolt Kiraly on 2/3/22.
//

import ArgumentParser

// snippet.show
struct Example: ParsableCommand {
    @Option(help: "The file to read from.", completion: .file())
    var input: String

    @Option(help: "The output directory.", completion: .directory)
    var outputDir: String

    @Option(help: "The preferred file format.", completion: .list(["markdown", "rst"]))
    var format: String

    enum CompressionType: String, CaseIterable, ExpressibleByArgument {
        case zip, gzip
    }

    @Option(help: "The compression type to use.")
    var compression: CompressionType
}
