# Defining Commands and Subcommands

Break complex command-line tools into a tree of subcommands.

## Overview

When command-line programs grow larger, it can be useful to divide them into a group of smaller programs, providing an interface through subcommands. Utilities such as `git` and the Swift package manager are able to provide varied interfaces for each of their sub-functions by implementing subcommands such as `git branch` or `swift package init`.

Generally, these subcommands each have their own configuration options, as well as options that are shared across several or all aspects of the larger program.

You can build a program with commands and subcommands by defining multiple command types and specifying each command's subcommands in its configuration. For example, here's the interface of a `math` utility that performs operations on a series of values given on the command line.

```
% math add 10 15 7
32
% math multiply 10 15 7
1050
% math stats average 3 4 13 15 15
10.0
% math stats average --kind median 3 4 13 15 15
13.0
% math stats
OVERVIEW: Calculate descriptive statistics.

USAGE: math stats <subcommand>

OPTIONS:
  -h, --help              Show help information.

SUBCOMMANDS:
  average                 Print the average of the values.
  stdev                   Print the standard deviation of the values.
  quantiles               Print the quantiles of the values (TBD).

  See 'math help stats <subcommand>' for detailed help.
```

Start by defining the root `Math` command. You can provide a static `configuration` property for a command that specifies its subcommands and a default subcommand, if any.

@Snippet(path: "swift-argument-parser/snippets/Commands1-math")

`Math` lists its three subcommands by their types; we'll see the definitions of `Add`, `Multiply`, and `Statistics` below. `Add` is also given as a default subcommand — this means that it is selected if a user leaves out a subcommand name:

```
% math 10 15 7
32
```

Next, define a `ParsableArguments` type with properties that will be shared across multiple subcommands. Types that conform to `ParsableArguments` can be parsed from command-line arguments, but don't provide any execution through a `run()` method.

In this case, the `Options` type accepts a `--hexadecimal-output` flag and expects a list of integers.

@Snippet(path: "swift-argument-parser/snippets/Commands2-hex")

It's time to define our first two subcommands: `Add` and `Multiply`. Both of these subcommands include the arguments defined in the `Options` type by denoting that property with the `@OptionGroup` property wrapper. `@OptionGroup` doesn't define any new arguments for a command; instead, it splats in the arguments defined by another `ParsableArguments` type.

@Snippet(path: "swift-argument-parser/snippets/Commands3-add")

Next, we'll define `Statistics`, the third subcommand of `Math`. The `Statistics` command specifies a custom command name (`stats`) in its configuration, overriding the default derived from the type name (`statistics`). It also declares two additional subcommands, meaning that it acts as a forked branch in the command tree, and not a leaf.

@Snippet(path: "swift-argument-parser/snippets/Commands4-stats")

Let's finish our subcommands with the `Average` and `StandardDeviation` types. Each of them has slightly different arguments, so they don't use the `Options` type defined above. Each subcommand is ultimately independent and can specify a combination of shared and unique arguments.

@Snippet(path: "swift-argument-parser/snippets/Commands5-average")

Last but not least, we kick off parsing and execution with a call to the static `main` method on the type at the root of our command tree. The call to main parses the command-line arguments, determines whether a subcommand was selected, and then instantiates and calls the `run()` method on that particular subcommand.

```swift
@main
struct Math: ParsableCommand {
    // ...
}
```

That's it for this doubly-nested `math` command! This example is also provided as a part of the `swift-argument-parser` repository, so you can see it all together and experiment with it [here](https://github.com/apple/swift-argument-parser/blob/main/Examples/math/main.swift).
