---
id: MySQL
sidebar_class_name: MySQL
---

<img src={require('../../static/img/APIs/MySQL.png').default} width='64px' />

# MySQL

Этот раздел посвящен библиотеке для работы с базами данных MySQL. На данной странице описаны все действия, необходимые для полноценного начала работы

<div class="theme-admonition theme-admonition-info admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--info">

<img src={require('../../static/img/addin.png').default} class="tipimage" />
<div class="addin">Для реализации некоторых функции в этой библиотеке используется внешняя компонента <br/>
Пожалуйста, ознакомьтесь с разделом ["О внешних компонентах"](/docs/Start/Component-requirements) перед началом работы</div>
</div>


<div class="theme-admonition theme-admonition-caution admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--warning">

<img src={require('../../static/img/lock.png').default} class="tipimage" />
<div class="addin">Для работы этой библиотеки на Linux необходим **OpenSSL 3.x** <br/>
Узнать больше: <a href="/docs/Start/Component-requirements#openssl" class="orangelink">"Об использовании OpenSSL во внешних компонентах"</a></div>
</div>

## О реализованных методах


## Совместимость

Технически, реализация коннектора представляет из себя Native компоненту на Rust. Она поставляется в формате zip-архива со сборками для всех основных платформ: x86 и x64 Windows и Linux. Фактическое тестирование проводилось на Windows x64 и, косвенно (через OneScript), на Linux x64