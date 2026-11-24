---
sidebar_label: CLI
sidebar_position: 1
sidebar_class_name: CLI
---

# CLI

**OInt CLI** is a command-line application that allows using Open Integration Package methods independently of 1C and OneScript.

## First launch

To start working with the console application, run the `oint` command from the command line or terminal. When installed from Linux packages or the Windows installer (after a reboot), this can be done from anywhere without additional configuration. If `oint` is installed as an OPM package, calling it from anywhere requires the `bin` subdirectory of the OneScript directory to be on `PATH`.

![demo](../img/1.gif)

## Help

When the application is launched without additional options, the terminal shows the initial `oint` page with basic information about the application and the list of available commands (libraries). To see the methods of a specific library, call `oint` again and pass the library name as the second argument, for example `oint telegram`. The same form gives details of a specific method: `oint <library> <method>`, for example `oint telegram SendTextMessage`.

>**Important:** library names are case-sensitive and are written in lowercase. Method names are not case-sensitive.

![demo](../img/2.gif)

## Using methods

Like most other programs aimed at bat and sh scripts, each action in OInt CLI is a full command string of the following form:

```powershell
    oint <library> <method> --param1 "Value" --param2 "Value"...
```

Parameters in the call string can be of one of the following types:

  + String — passed as a string, with or without quotes
  + Number — passed as a string without quotes, made of digits and, if needed, a decimal separator. The decimal separator is `.`
  + Date — passed as a string in ISO 8601 format
  + Array — passed as a string in JSON array format. For example, `"['Value1','Value2','Value3']"`
  + JSON object (structure) — passed as a file path or a JSON string

After the requested action, the program prints the result and exits. Output goes to the console by default, and it can be redirected to a file either with `>` or with the common `--out` parameter. The difference is the encoding of the saved file: `>` uses the shell encoding, while `--out` uses UTF-8 (the encoding OInt uses internally). `--out` is also required for methods that return binary data, such as downloading a file from cloud storage.

![demo](../img/3.gif)

## Binary data representation

Besides a file path, `--out` accepts special values that print the result to the console as text. Names are lowercase and wrapped with `_` on both sides:

| `--out` value | Description |
|---------------|-------------|
| `_hex_` | hexadecimal string (HEX) |
| `_base64_` | Base64 string |
| `_utf8_` | UTF-8 text |

Representation mode applies to binary data returned by a method. If a method returns a string, it is first converted to an internal binary form and then printed in the selected format.

```powershell
oint msgpack SerializeData --value "{'a': 'b'}" --raw true --out _hex_
oint hashsum --out _utf8_
```

When a file path is specified (for example, `--out result.bin`), data is written to the file in its original binary form. The special values `_hex_`, `_base64_`, and `_utf8_` are for console output only and do not create a file with that name.

## Control sequences

Standard control sequences are allowed in passed parameters: `\n`, `\r`, `\v`, and `\f`. They become line feed, carriage return, vertical tab, and form feed in every argument except:

+ Array parameters and parameters in JSON format (those starting with `{` or `[`)
+ File paths, if a file exists at that path
+ The standard `--out` parameter

To keep a sequence as literal text, escape it with a second `\` (for example, `\\n`).

Calling the same methods from an AI agent is described in [MCP](./mcp-server).
