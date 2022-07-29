# Customizing Help for Commands

Define your command's abstract, extended discussion, or usage string, and set the flags used to invoke the help display.

## Overview

In addition to configuring the command name and subcommands, as described in <doc:CommandsAndSubcommands>, you can also configure a command's help text by providing an abstract, discussion, or custom usage string.

@Snippet(path: "swift-argument-parser/snippets/Customizing1")

The customized components now appear in the generated help screen:

```
% repeat --help
OVERVIEW: Repeats your input phrase.

Prints to stdout forever, or until you halt the program.

USAGE: repeat <phrase>
       repeat --count <count> <phrase>

ARGUMENTS:
  <phrase>                The phrase to repeat.

OPTIONS:
  -h, --help              Show help information.

% repeat hello!
hello!
hello!
hello!
hello!
hello!
hello!
...
```

## Modifying the Help Flag Names

Users can see the help screen for a command by passing either the `-h` or the `--help` flag, by default. If you need to use one of those flags for another purpose, you can provide alternative names when configuring a root command.
@Snippet(path: "swift-argument-parser/snippets/Customizing2")

When running the command, `-h` matches the short name of the `historyDepth` property, and `-?` displays the help screen.

```
% example -h 3
nmap -v -sS -O 10.2.2.2
sshnuke 10.2.2.2 -rootpw="Z1ON0101"
ssh 10.2.2.2 -l root
% example -?
USAGE: example --history-depth <history-depth>

ARGUMENTS:
  <phrase>                The phrase to repeat.

OPTIONS:
  -h, --history-depth     The number of history entries to show.
  -?, --help              Show help information.
```

When not overridden, custom help names are inherited by subcommands. In this example, the parent command defines `--help` and `-?` as its help names:

@Snippet(path: "swift-argument-parser/snippets/Customizing3")

The `child` subcommand inherits the parent's help names, allowing the user to distinguish between the host argument (`-h`) and help (`-?`).

```
% parent child -h 192.0.0.0
...
% parent child -?
USAGE: parent child --host <host>

OPTIONS:
  -h, --host <host>       The host the server will run on.
  -?, --help              Show help information.
```

## Hiding Commands

You may not want to show every one of your command as part of your command-line interface. To render a command invisible (but still usable), pass `shouldDisplay: false` to the ``CommandConfiguration`` initializer.

## Generating Help Text Programmatically

The help screen is automatically shown to users when they call your command with the help flag. You can generate the same text from within your program by calling the `helpMessage()` method.

@Snippet(path: "swift-argument-parser/snippets/Customizing4")

When generating help text for a subcommand, call `helpMessage(for:)` on the `ParsableCommand` type that represents the root of the command tree and pass the subcommand type as a parameter to ensure the correct display.
