// MARK: Hide
//
//  File.swift
//  File
//
//  Created by Zsolt Kiraly on 2/3/22.
//

import ArgumentParser
import Foundation

// MARK: Show
struct ExampleTransformError: Error, CustomStringConvertible {
  var description: String
}

struct ExampleDataModel: Codable {
  let identifier: UUID
  let tokens: [String]
  let tokenCount: Int

  static func dataModel(_ jsonString: String) throws -> ExampleDataModel  {
    guard let data = jsonString.data(using: .utf8) else { throw ValidationError("Badly encoded string, should be UTF-8") }
    return try JSONDecoder().decode(ExampleDataModel.self, from: data)
  }
}

struct Example: ParsableCommand {
  // Reads in the argument string and attempts to transform it to
  // an `ExampleDataModel` object using the `JSONDecoder`. If the
  // string is not valid JSON, `decode` will throw an error and
  // parsing will halt.
  @Argument(transform: ExampleDataModel.dataModel)
  var inputJSON: ExampleDataModel

  // Specifiying this option will always cause the parser to exit
  // and print the custom error.
  @Option(transform: { throw ExampleTransformError(description: "Trying to write to failOption always produces an error. Input: \($0)") })
  var failOption: String?
}
