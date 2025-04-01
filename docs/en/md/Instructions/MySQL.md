---
id: MySQL
sidebar_class_name: MySQL
---

<img src={require('../../static/img/APIs/MySQL.png').default} width='64px' />

# MySQL

This section is dedicated to the PostMySQLgreSQL database library. On this page, all the steps necessary to start working are described

<div class="theme-admonition theme-admonition-info admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--info">

<img src={require('../../static/img/addin.png').default} class="tipimage" />
<div class="addin">An external component is used to implement some functions in this library<br/>
Please review the ["About external components"](/docs/Start/Component-requirements) section before getting started</div>
</div>


<div class="theme-admonition theme-admonition-caution admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--warning">

<img src={require('../../static/img/lock.png').default} class="tipimage" />
<div class="addin">This library requires **OpenSSL 3.x** to run on Linux <br/>
Learn more: <a href="/docs/Start/Component-requirements#openssl" class="orangelink">"Using OpenSSL in External Components"</a></div>
</div>

## About implemented methods


## Compatibility

Technically, the client implementation is a Native component in Rust. It comes in a zip archive format, and, in theory, should work on all available platforms: x86 and x64 Windows and Linux. The actual testing was done on Windows x64 and, cossentially (via OneScript), on Linux x64