---
id: GRPC
sidebar_class_name: GRPC
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, GreenAPI, GRPC]
---

<img src={require('../../static/img/APIs/GRPC.png').default} width='64px' />

# gRPC

This section covers the library for working with gRPC in 1C:Enterprise, OneScript, and CLI. This page describes all the actions required to get started.

## Getting Started

To start working with a server using the gRPC protocol, you need to create a connection object. This can be done explicitly by passing the connection settings to the `OpenConnection` function or, in some cases, implicitly by passing the connection settings directly to the query execution function. In the latter case, the connection will be opened and closed inside the called function. You can generate connection settings for both cases using the `GetConnectionParameters` function. It requires the server URL (with protocol and port), a Proto file structure, and, if necessary, a metadata structure. The library allows loading multiple Proto files if the main service file contains imports (the order of loading files does not matter). See the function `GetConnectionParameters` for more details.

```bsl

    Address = "https://grpcb.in:9001";

    Proto1 = "./grpcbin_with_import.proto"; // String, file path or URL
    Proto2 = "./mt.proto";                  // String, file path or URL

    Schemes = New Map;
    Schemes.Insert("main.proto"    , Proto1); // Main
    Schemes.Insert("my_types.proto", Proto2); // For import in main

    Meta = New Structure("mykey", "myvalue");

    Parameters = OPI_GRPC.GetConnectionParameters(Address, Schemes, Meta);
    Tls        = OPI_GRPC.GetTlsSettings(True);

    Result = OPI_GRPC.OpenConnection(Parameters, Tls);

```

## TLS

The library supports operation in TLS mode. To enable it, you need to generate TLS settings using the `GetTlsSettings` function and pass them as the appropriate parameter to the `OpenConnection` function or another function if implicit connection opening is used. If the TLS parameter is not passed when calling these functions, the connection is initialized in unsecured mode.

## Streaming

The library supports streaming mode. To use it, you need to pass the connection object to the `InitializeServerStream`, `InitializeClientStream`, or `InitializeBidirectionalStream` function. This will open a server, client, or bidirectional stream accordingly, after which you can send and receive messages using the `SendMessage` and `GetMessage` functions. For the CLI version and for simplified stream operations in 1C and OneScript, additional functions `ProcessServerStream`, `ProcessClientStream`, and `ProcessBidirectionalStream` are available. They allow you to immediately specify the data to be sent and received, and then return the entire set of received messages as a single response.