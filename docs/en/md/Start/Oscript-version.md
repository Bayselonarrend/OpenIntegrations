---
sidebar_position: 3
---

# Working with OneScript Version

The Open Integration Package is available as an OSPX package for the OPM package manager, allowing its functions to be used when working with OneScript.

## Installation

To get started, you need to install the `oint` package using the OPM package manager. This can be done in one of two ways:

1. From the online package hub (Russian version only):

```bash
    opm install oint
```

2. From a downloaded OSPX file:

```bash
    opm install -f "./OInt-x.x.x.ospx"
```

Additionally, such an OSPX file can be built manually by cloning the repository and running the following command in the source directory `/src/<language>/OInt`:

```bash
    opm build
```

## Importing into a Script

To use the Open Integration Package methods, after installation, it must be imported into your script using the `#Use` directive:

```bsl
#Use oint

Result = OPI_Telegram.SendTextMessage(Token, Chat, Text);
```

`#Use` in this form imports the entire package at once, allowing methods to be called from all available `oint` modules immediately without additional actions. This is universal, but most often redundant and negatively impacts the execution time of the final script. Therefore, it is recommended to import only those package modules that are currently needed. This can be done as follows:

```bsl
#Use oint/api/telegram

Result = OPI_Telegram.SendTextMessage(Token, Chat, Text);
```

All main OPI modules are located in the `/api` subsection and are identified by names similar to the command names for the CLI version. You can always find the name of a specific library on the main page of its dedicated documentation section.

Also, in addition to importing the main modules, you can import internal package tool modules if you need them:

 - `oint/tools/main` - for main tool modules
 - `oint/tools/http` - for modules related to HTTP client operations