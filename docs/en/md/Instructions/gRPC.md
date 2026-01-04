---
id: GRPC
sidebar_class_name: GRPC
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, GRPC]
---


<img src={require('../../static/img/APIs/GRPC.png').default} width='64px' />

# GRPC

This section covers the library for working with gRPC in 1С:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.


## Getting Started

To start working with a server via the gRPC protocol, you need to create a connection object. This can be done explicitly by passing connection settings to the `CreateConnection` function or, in some cases, implicitly by passing connection settings directly to the request execution function. In the latter case, the connection will be opened and closed within the called function. Connection settings for both cases can be generated using the `GetConnectionParameters` function. You need to pass the server URL (with protocol and port), Proto file structure, and metadata structure (if needed). The library supports loading multiple Proto files if the main service file contains imports (the order of file loading doesn't matter). More details in the description of the `GetConnectionParameters` function.

```bsl

    Address = "https://grpcb.in:9001";

    Proto1 = "./grpcbin_with_import.proto"; // String, filepath or URL
    Proto2 = "./mt.proto";                  // String, filepath or URL

    Schemes = New Map;
    Schemes.Insert("main.proto"    , Proto1); // Main
    Schemes.Insert("my_types.proto", Proto2); // For import at main

    Meta = New Structure("mykey", "myvalue");

    Parameters = OPI_GRPC.GetConnectionParameters(Address, Schemes, Meta);
    Tls        = OPI_GRPC.GetTlsSettings(True);

    Result = OPI_GRPC.CreateConnection(Parameters, Tls);

```

## TLS

The library supports TLS mode. To enable it, you need to configure TLS settings using the `GetTlsSettings` function and pass them as the corresponding parameter to the `CreateConnection` function or another function if implicit connection opening is used. If the TLS parameter is not passed when calling these functions, the connection is initialized in unsecured mode.

## Streaming

The library supports streaming mode. To start it, you need to pass a connection object to the `InitializeServerStream`, `InitializeClientStream`, or `InitializeBidirectionalStream` function. This will open a server, client, or bidirectional stream respectively, after which you can send and receive messages using the `SendMessage` and `GetMessage` functions. For the CLI version, as well as simpler stream handling in 1C and OneScript, there are additional functions `ProcessServerStream`, `ProcessClientStream`, and `ProcessBidirectionalStream`. They allow you to immediately specify information about the data to be sent and received, and then return the entire set of received messages as a single response.

