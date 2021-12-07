//===----------------------------------------------------------*- swift -*-===//
//
// This source file is part of the Swift Argument Parser open source project
//
// Copyright (c) 2020 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

/// A type that can be executed as part of a nested tree of commands.
public protocol AsyncParsableCommand: ParsableCommand {
  mutating func run() async throws
}

extension AsyncParsableCommand {
  public mutating func run() throws {
    throw CleanExit.helpRequest(self)
  }
}

public protocol AsyncMain {
  associatedtype Command: ParsableCommand
}

extension AsyncMain {
  public static func main() async {
    do {
      var command = try Command.parseAsRoot()
      if var command = command as? AsyncParsableCommand {
        try await command.run()
      } else {
        try command.run()
      }
    } catch {
      Command.exit(withError: error)
    }
  }
}
