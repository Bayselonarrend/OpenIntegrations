---
sidebar_position: 2
---

# Working with CLI app

OInt CLI - a command-line application that allows you to use methods of the Open Integration Package independently of 1C and OneScript

## First start

To get started, you need to call the command `oint` from the command prompt/terminal. If app was installed from packages (Linux) or installer (Windows, after reboot), you can do this from any place without additional actions. When using the portable version (single executable file), `oint` needs to be run with the full path to the file. In Linux distributions, you may also need to execute `chmod +x <path to file>/oint beforehand` 

To run the portable version in RHEL/Fedora/CentOS (distributions using rpm packages), use the command <br/>`mono <path to oint>/oint "$@"`

![demo](./img/1.gif)

## Help

After the launching of application, you'll see the initial page with a list of available libraries. To view the list of available methods for a specific library, simply type `oint` followed by its name. For example, `oint telegram`. Similarly, you can get details about a specific method by using the command `oint <library> <method>`, for example, `oint telegram SendMessage`

>**Important:** Library names are case-sensitive and should be written in lowercase. Method names are not case-sensitive

![demo](./img/2.gif) 

## Using methods
Like most other programs intended for use in bat/sh scripts, each separate action of Oint CLI is called by a full command line of the following form:

```powershell
 oint <library> <method> --option1 "Value" --option2 "Value"...
```

When it comes to parameters, most often the data passed there are strings. This can be text, file paths, URLs, etc. However, in OInt, there are methods that accept other, less obvious types of data. These can be:

 + Dates are passed as strings in ISO 8601 format
 + Arrays are passed as strings in the form`"['Val1','Val2','Val3']"`
 + JSON is passed as a path to a .json file or a string in JSON format with single quotes

After executing the requested action, the program outputs the result and exits. By default, the output is displayed in the console, but you can redirect it to a file using either the standard method `>` or by using the common parameter `--out`. The difference between these two methods lies in the encoding of the saved file: when using `>`, it will be the encoding of the shell, whereas when using `--out`, it will be UTF-8 (used internally by OInt). Additionally, using `--out` is mandatory for methods returning binary data in the response (such as downloading a file from Google Drive, for example)

![demo](./img/3.gif) 

## Escape sequences

The standard escape sequences `\n`, `\r`, `\v`, and `\f` may be used in the passed parameters. These are converted to line breaks, carriage returns, vertical tabs, and form feeds, respectively, in all arguments, except:

+ Array parameters and JSON-formatted parameters (i.e., those beginning with `{` or `[`)
+ File paths, if a file on that path exists
+ Standard `--out` parameter

In order to avoid esapce sequence conversions where they should not be, it is necessary to escape them with a second character `\` (e.g., `\\n`).

<hr/>

You can find all further information you might need for work in other sections of this documentation, as well as in the built-in help of OInt CLI
