---
id: RCON
sidebar_class_name: RCON
---

<img src={require('../../static/img/APIs/RCON.png').default} width='64px' />

# RCON (Client)

This section covers the library for working with RCON protocol in 1С:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

<div class="theme-admonition theme-admonition-info admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--info">

<img src={require('../../static/img/addin.png').default} class="tipimage" />
<div class="addin">An external component is used to implement some functions in this library<br/>
Please review the ["About external components"](/docs/Start/Component-requirements) section before getting started</div>
</div>

## About the library

RCON (Remote Console) is a protocol used to remotely control servers, most commonly game servers. It allows administrators or owners to execute commands on a server from the outside, without having to physically access the machine where the server is running.

Typically, control via RCON is available on servers for games such as:
 - Minecraft
 - Counter Strike
 - ARK
 - Rust
 - SAMP
 - MTA
 - etc.

This library provides two main functions for operation: `CreateConnection` for connection and authorisation on the server, and `ExecuteCommand` for performing actions. It is also possible to execute single commands without creating a preliminary connection, passing connection parameters to the `ExecuteCommand` method (in this case the connection will be opened and closed within the function, the only option for CLI version).
