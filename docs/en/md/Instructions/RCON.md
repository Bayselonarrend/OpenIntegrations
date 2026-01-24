---
id: RCON
sidebar_class_name: RCON
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, RCON]
---

<img src={require('../../static/img/APIs/RCON.png').default} width='64px' />

# RCON (Client)

This section covers the library for working with the RCON protocol in 1C:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

<div class="theme-admonition theme-admonition-info admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--info">

<img src={require('../../static/img/addin.png').default} class="tipimage" />
<div class="addin">An external component is used to implement some functions in this library<br/>
Please review the ["About external components"](/docs/Start/Component-requirements) section before getting started</div>
</div>

## About the library

RCON (Remote Console) is a protocol used for remote server administration, most often for game servers. It allows administrators or server owners to execute commands on the server remotely, without physical access to the machine where the server is running.

Typically, RCON control is available on servers for games such as:
 - Minecraft
 - Counter Strike
 - ARK
 - Rust
 - SAMP
 - MTA
 - and others.

This library provides two main functions for operation: `ОткрытьСоединение` ("OpenConnection") for connecting and authorizing on the server, and `ВыполнитьКоманду` ("ExecuteCommand") for actually executing commands. It is also possible to execute individual commands without creating a preliminary connection by passing connection parameters to the `ВыполнитьКоманду` method (in this case, the connection will be opened and closed within the function—this is the only option for the CLI version).