# Manual Parsing and Testing

Provide your own array of command-line inputs and work with parsed results by calling alternatives to `main()`.

## Overview

For most programs, calling the static `main()` method on the root command type is all that's necessary. That single call parses the command-line arguments to find the correct command from your tree of nested subcommands, instantiates and validates the result, and executes the chosen command. For more control, however, you can perform each of those steps manually.

## Parsing Arguments

For simple Swift scripts, and for those who prefer a straight-down-the-left-edge-of-the-screen scripting style, you can define a single `ParsableArguments` type to parse explicitly from the command-line arguments.

Let's implement the `Select` command discussed in <doc:Validation>, but using a scripty style instead of the typical command. First, we define the options as a `ParsableArguments` type:

@Snippet(path: "swift-argument-parser/snippets/Parsing1")

The next step is to parse our options from the command-line input:

@Snippet(path: "swift-argument-parser/snippets/Parsing2")

The static `parseOrExit()` method either returns a fully initialized instance of the type, or exits with an error message and code. Alternatively, you can call the throwing `parse()` method if you'd like to catch any errors that arise during parsing.

We can perform validation on the inputs and exit the script if necessary:

@Snippet(path: "swift-argument-parser/snippets/Parsing3")

As you would expect, the `exit(withError:)` method includes usage information when you pass it a `ValidationError`.

Finally, we print out the requested number of elements:

@Snippet(path: "swift-argument-parser/snippets/Parsing4")

## Parsing Commands

Manually parsing commands is a little more complex than parsing a simple `ParsableArguments` type. The result of parsing from a tree of subcommands may be of a different type than the root of the tree, so the static `parseAsRoot()` method returns a type-erased `ParsableCommand`.

Let's see how this works by using the `Math` command and subcommands defined in [Commands and Subcommands](./CommandsAndSubcommands.md). This time, instead of calling `Math.main()`, we'll call `Math.parseAsRoot()`, and switch over the result:

@Snippet(path: "swift-argument-parser/snippets/Parsing5")

Our new logic intercepts the command between validation and running, and outputs an additional message:

```
% math 10 15 7
You chose to add 3 values.
32
% math multiply 10 15 7
You chose to do something else.
1050
```

## Providing Command-Line Input

All of the parsing methods — `parse()`, `parseOrExit()`, and `parseAsRoot()` — can optionally take an array of command-line inputs as an argument. You can use this capability to test your commands, to perform pre-parse filtering of the command-line arguments, or to manually execute commands from within the same or another target.

Let's update our `select` script above to strip out any words that contain all capital letters before parsing the inputs.

@Snippet(path: "swift-argument-parser/snippets/Parsing6")

Now when we call our command, the parser won't even see the capitalized words — `HEY` won't ever be printed:

```
% select hi howdy HEY --count 2
hi
howdy
% select hi howdy HEY --count 2
howdy
hi
```
