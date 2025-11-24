---
sidebar_position: 2
---

# Working with CLI application

**OInt CLI** is a command-line application that allows using Open Integration Package methods independently of 1C and OneScript.

## First Launch

To start working with the console application, you need to run the `oint` command from the command line/terminal. When installed from Linux packages or Windows installer (after reboot), this can be done from anywhere without additional configuration. If `oint` is installed as an OPM package, calling from anywhere is available provided that the `bin` subdirectory of the OneScript directory is in the `PATH`.

![demo](./img/1.gif)

## Help

When launching the application without additional options, the initial `oint` page will be displayed in the terminal window, showing basic information about the application as well as a list of all available commands (libraries). To view the list of available methods for a specific library, you need to call the `oint` command again, passing the library name as the second argument - for example, `oint telegram`. Similarly, you can get detailed information about a specific method: for this, you need to call a command of the form `oint <library> <method>` - for example, `oint telegram SendTextMessage`.

>**Important:** Library names are case-sensitive and are written in lowercase. Method names are not case-sensitive.

![demo](./img/2.gif)

## Using Methods
Like most other programs aimed at use in bat/sh scripts, each separate action in Oint CLI is performed by calling a full command string of the following form:

```powershell
    oint <library> <method> --param1 "Value" --param2 "Value"...
```

Parameters in the call string can be of one of the following types:

  + String - passed as a string in quotes or without them
  + Number - passed as a string without quotes, consisting of digits and (if necessary) a decimal separator. The decimal separator is `.`
  + Date - passed as a string in ISO 8601 format
  + Array - passed as a string in JSON array format. For example, `"['Value1','Value2','Value3']"`
  + JSON object (structure) - passed as a file path or string in JSON format

After executing the requested action, the program outputs the result and terminates. By default, output goes to the console, but there is an option to redirect it for writing to a file - both by the standard method `>` and using the application's general parameter `--out`. The difference between these two methods is the encoding of the saved file: when using `>` it will be the shell encoding, while when using `--out` it will be UTF-8 (used internally by OInt). Also, using `--out` is mandatory for methods that return binary data in the response (such as downloading files from cloud storage).

![demo](./img/3.gif)

## Control Sequences

The use of standard control sequences is allowed in passed parameters: `\n`, `\r`, `\v`, and `\f`. They are converted to line feed, carriage return, vertical tab, and form feed characters respectively, in all arguments except:

+ Array parameters and parameters in JSON format (i.e., starting with `{` or `[`)
+ File paths, if the file at that path exists
+ The standard parameter `--out`

To avoid control sequence conversion where it shouldn't occur, you need to escape them with a second `\` character (for example, `\\n`).

<hr/>

All further information you may need for work can be found in other sections of this documentation, as well as in the built-in help of OInt CLI