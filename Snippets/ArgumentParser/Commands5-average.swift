// MARK: Hide
//
//  File.swift
//
//
//  Created by Zsolt Kiraly on 1/25/22.
//

import ArgumentParser
import Foundation

struct Math: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "A utility for performing maths.",
        subcommands: [Add.self, Multiply.self, Statistics.self],
        defaultSubcommand: Add.self)
}

extension Math {
    struct Options: ParsableArguments {
        @Flag(name: [.long, .customShort("x")], help: "Use hexadecimal notation for the result.")
        var hexadecimalOutput = false

        @Argument(help: "A group of integers to operate on.")
        var values: [Int]
    }
}

extension Math {
    static func format(result: Int, usingHex: Bool) -> String {
        usingHex ? String(result, radix: 16)
            : String(result)
    }
}

extension Math {
    struct Add: ParsableCommand {
        static var configuration
            = CommandConfiguration(abstract: "Print the sum of the values.")

        @OptionGroup var options: Math.Options

        mutating func run() {
            let result = options.values.reduce(0, +)
            print(format(result: result, usingHex: options.hexadecimalOutput))
        }
    }

    struct Multiply: ParsableCommand {
        static var configuration
            = CommandConfiguration(abstract: "Print the product of the values.")

        @OptionGroup var options: Math.Options

        mutating func run() {
            let result = options.values.reduce(1, *)
            print(format(result: result, usingHex: options.hexadecimalOutput))
        }
    }
}

extension Math {
    struct Statistics: ParsableCommand {
        static var configuration = CommandConfiguration(
            commandName: "stats",
            abstract: "Calculate descriptive statistics.",
            subcommands: [Average.self, StandardDeviation.self])
    }
}

// MARK: Show
extension Math.Statistics {
    struct Average: ParsableCommand {
        static var configuration = CommandConfiguration(
            abstract: "Print the average of the values.")

        enum Kind: String, ExpressibleByArgument {
            case mean, median, mode
        }

        @Option(help: "The kind of average to provide.")
        var kind: Kind = .mean

        @Argument(help: "A group of floating-point values to operate on.")
        var values: [Double] = []

        mutating func run() {
            switch kind {
            case .mean:
                print(calculateMean())
            case .median:
                print(calculateMedian())
            case .mode:
                let result = calculateMode()
                    .map(String.init(describing:))
                    .joined(separator: " ")
                print(result)
            }
        }
    }

    struct StandardDeviation: ParsableCommand {
        static var configuration = CommandConfiguration(
            commandName: "stdev",
            abstract: "Print the standard deviation of the values.")

        @Argument(help: "A group of floating-point values to operate on.")
        var values: [Double] = []

        mutating func run() {
            if values.isEmpty {
                print(0.0)
            } else {
                let sum = values.reduce(0, +)
                let mean = sum / Double(values.count)
                let squaredErrors = values
                    .map { $0 - mean }
                    .map { $0 * $0 }
                let variance = squaredErrors.reduce(0, +)
                let result = variance.squareRoot()
                print(result)
            }
        }
    }
}
// MARK: Hide

extension Math.Statistics.Average {
    func calculateMean() -> Double { return 0 }
    func calculateMedian() -> Double { return 0 }
    func calculateMode() -> [Double] { return [ 0 ] }
}

Math.main()


