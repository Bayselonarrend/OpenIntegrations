---
id: RCON
sidebar_class_name: RCON
---

<img src={require('../../static/img/APIs/RCON.png').default} width='64px' />

# RCON (Client)

This section is dedicated to the library for working with the RCON. On this page, all the steps necessary to start working are described

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

## Compatibility

Technically, the client implementation is a Native component in Rust. It comes in a zip archive format, and, in theory, should work on all available platforms: x86 and x64 Windows and Linux. The actual testing was done on Windows x64 and, cossentially (via OneScript), on Linux x64