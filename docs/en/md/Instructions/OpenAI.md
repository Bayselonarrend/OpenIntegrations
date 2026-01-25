---
id: OpenAI
sidebar_class_name: OpenAI
---

<img src={require('../../static/img/APIs/OpenAI.png').default} width='64px' />

# OpenAI

This section covers the library for working with OpenAI API in 1С:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

## Preface

This library implements methods for working with any service that supports backward compatibility with the OpenAI API. During the development of this solution, LocalAI was used as a reference, which, like other available solutions, supports only a subset of the original OpenAI interface methods.

Also, when working with this library, it's important to remember that the result obtained — as well as the availability of certain function parameters — largely depends on the selected model and the level of API compatibility of the specific service with the original OpenAI API.

## Getting Started

In the classic implementation, the OpenAI API uses Bearer token-based authentication. The method of obtaining the token depends on the specific service you are using.

After acquiring the token, it must be passed into the `Token` parameter of each function in the library. You may also pass an empty string if authentication is not required, or use the `AdditionalHeaders` parameter to specify a custom authorization header when using alternative authentication methods.

In addition to the token, every API-related function includes a `URL` parameter, where you should provide the base address of the provider without `/v1/` or other additional path segments.

In functions where the set of fields can significantly vary depending on the model, there is also an `AdditionalParameters` parameter, allowing you to add any necessary data to the request.