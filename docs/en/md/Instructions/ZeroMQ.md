---
id: ZeroMQ
sidebar_class_name: ZeroMQ
keywords: [1C, 1C:Enterprise, 1C:Enterprise 8.3, API, Integration, Services, Messaging, OneScript, CLI, ZeroMQ]
---

<img src={require('../../static/img/APIs/ZeroMQ.png').default} width='64px' />

# ZeroMQ

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_ZeroMQ" use="oint/api/ws" lang="en"/>

This section is dedicated to the library for working with ZeroMQ in 1C:Enterprise and OneScript. This page describes all the actions necessary to get started

## Getting Started

ZeroMQ is a high-performance asynchronous messaging library designed for use in distributed and parallel applications. It provides sockets that carry atomic messages between various messaging patterns, such as request-reply, publish-subscribe, and others.

### Key Features

- **Asynchronous messaging** — high-performance data transfer between processes and systems
- **Various messaging patterns** — support for REQ-REP, PUB-SUB, PUSH-PULL and other interaction models
- **Inter-process communication** — data exchange between applications on a single machine or network
- **Transport independence** — support for TCP, IPC, inproc and other protocols

### Use Cases

ZeroMQ can be used for:

- Building distributed data exchange systems
- Organizing message queues between services
- Creating monitoring and metrics collection systems
- Implementing microservice architecture
- Inter-process communication of 1C applications

:::note
Working with ZeroMQ may require installation of appropriate system libraries and components in your operating system
:::