---
id: Ollama
sidebar_class_name: Ollama
---

<img src={require('../../static/img/APIs/Ollama.png').default} width='64px' />

# Ollama



This section is dedicated to the library for working with Ollama API. On this page, all the steps necessary to start working are described

## Getting started

1. Download Ollama from [official website](https://ollama.com/) and run it on the target machine

![BF](../../static/img/Docs/Ollama/1.png)

2. `(optional)` To be able to send your models to the Ollama servers, you are also required to create an account and add a public key to the local solution by following the instructions in the [Ollama keys](https://ollama.com/settings/keys) section

![BF](../../static/img/Docs/Ollama/2.png)

3. `(optional)` To add authorization and the ability to handle requests from outside, you must configure proxying through a third-party web server

> By default, the Ollama server is only available on the local network at `localhost:11434`
