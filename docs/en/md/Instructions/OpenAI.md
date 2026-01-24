---
id: OpenAI
sidebar_class_name: OpenAI
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, OpenAI]
---

<img src={require('../../static/img/APIs/OpenAI.png').default} width='64px' />

# OpenAI

This section covers the library for working with the OpenAI API in 1C:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

## Preface

This library implements methods for working with any service that supports backward compatibility with the OpenAI API. LocalAI was used during development as a reference solution, and, like other available options, supports only a subset of the original OpenAI interface methods.

It is also important to note that the results you receive, as well as the availability of certain function parameters, primarily depend on the selected model and the level of API compatibility provided by the service you are using with the original OpenAI API.

## Getting Started

In the classic scenario, the OpenAI API uses Bearer token-based authorization. How you obtain the token depends on the specific service you are using.

Once you have obtained the token, you must provide it in the `Token` parameter of each library function. You may also pass an empty string if no authorization is required, or use the `AdditionalHeaders` parameter to specify a custom authorization header in case you are using another authentication method.

In addition to the token, every API-related function includes a `URL` parameter, where you should provide the base address of the provider without `/v1/` or any other additional path segments.

For functions whose field sets may vary significantly from model to model, there is also an `AdditionalParameters` parameter, which allows you to add any required data to your requests.