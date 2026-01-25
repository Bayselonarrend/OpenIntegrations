---
id: Ollama
sidebar_class_name: Ollama
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, Ollama]
---

<img src={require('../../static/img/APIs/Ollama.png').default} width='64px' />

# Ollama

This section covers the library for working with Ollama in 1С:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

## Getting Started

1. Download Ollama from the [official website](https://ollama.com/) and run it on the target machine
2. `(optional)` To enable uploading your own models to Ollama servers, you also need to create an account and add a public key to the local solution, following the instructions in the [Ollama keys](https://ollama.com/settings/keys) section
3. `(optional)` To add authorization and enable processing requests from external sources, you need to configure proxying through a third-party web server

> By default, the Ollama server is only accessible on the local network at `localhost:11434`