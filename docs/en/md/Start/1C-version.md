---
sidebar_position: 3
---

# Working with the 1C:Enterprise edition

The Open Integration Package is originally developed as a configuration extension for the 1C:Enterprise 8 platform. Its methods are exposed as common modules and can be used in any configuration that meets the project requirements.

:::important
Development targets compatibility mode `8.3.10` with the check option set to **Warn**. The extension compatibility mode is set to **`8.3.15`**.
:::

## Installation

To get started, add the Open Integration Package modules to your configuration. You can do this in several ways:

1. From an extension **`CFE` file** (recommended):

    Download `OpenIntegrations_x.x.x_lang.cfe` from the [latest release](https://github.com/Bayselonarrend/OpenIntegrations/releases/latest) or the **[Download](/download)** section, then load it into your configuration's extension list in Configurator.

2. From **XML export files**:

    Download **`XML.zip`**, extract it, and load the extension via the Extensions panel by specifying the folder that contains the XML files.

3. From an **EDT project**:

    Download **`EDT.zip`** or connect the source project from the repository in 1C:EDT. For details see [Build from source](/docs/Start/Build-from-source).

4. Via **compare and merge** with a configuration **CF** file:

    Besides distribution as an extension, the Open Integration Package is also shipped as a configuration **`cf`** file. The `OpenIntegrations_x.x.x_lang.cf` file can be used to compare and merge OPI objects with your main configuration if using an extension is undesirable or impossible.

Each delivery option is described in [About release variants](/docs/Start/Release-variants). Regardless of how you install, prefer files from a release, the [downloads page](/download), or the repository’s **`stable`** branch.

You may manually copy individual common modules from the sources into your project, but for regular updates it is easier to use the packaged distributions.

## Client and server usage

Starting from version **`2.1.0`**, all core Open Integration Package modules are available on **both server and client**. Unlike server-side calls, using OPI methods on the client comes with extra constraints:

+ The **`Web client`** is not supported.
+ The platform setting for synchronous calls to extensions and external components of the main configuration must be **`Use`** or **`Use with warnings`**.
+ Starting background jobs via the **`dontwait`** parameter in [advanced call](/docs/Start/Advanced-call) settings is not supported.
+ The first call to a library function that relies on external components will trigger installation of those components. See [About external components](/docs/Start/Component-requirements) for details.

