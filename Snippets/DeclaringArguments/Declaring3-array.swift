// snippet.hide
//
//  File.swift
//  
//
//  Created by Zsolt Kiraly on 1/27/22.
//

import ArgumentParser

// snippet.show
struct Lucky: ParsableCommand {
  @Argument var numbers = [7, 14, 21]

  mutating func run() throws {
    print("""
    Your lucky numbers are:
    \(numbers.map(String.init).joined(separator: " "))
    """)
  }
}
