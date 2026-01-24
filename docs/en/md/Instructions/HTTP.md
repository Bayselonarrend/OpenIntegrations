---
id: HTTP
sidebar_class_name: HTTP
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, HTTP, HTTPS]
---

<img src={require('../../static/img/APIs/HTTP.png').default} width='64px' />

# HTTP (Client)

This section covers the library for working with the HTTP protocol in 1C:Enterprise, OneScript, and CLI. This page describes all the actions required to get started.

## Getting Started

The HTTP module is designed for quickly creating HTTP requests in 1C:Enterprise and OneScript using a fluent interface. Each request should start by initializing the HTTP client in one of the following ways:

```bsl title="Universal method (recommended)"
    HTTPClient = OPI_HTTPRequests
        .NewRequest()
        .Initialize(URL)
```

```bsl title="Method for 1C only"
    HTTPClient = DataProcessors.OPI_HTTPClient.Create().Initialize(URL);
```

```bsl title="Method for OneScript only"
    HTTPClient = New OPI_HTTPClient;
    HTTPClient.Initialize(URL);
```

The client can also be initialized without setting the URL. For details, see the *Initialization* section.

## General request description workflow

After initializing the client, a new request can be formed with any number of additional actions described in the subsections of this documentation block.

```bsl

    URL    = "https://exemple.com/post";
    Data   = New Structure("Field1,Field2,Field3", 10, "Text", 20);

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetJsonBody(Data)
        .AddHeader("X-My-Header1", "Hello")
        .AddHeader("X-My-Header2", "world")
        .AddAWS4Authorization("***", "***", "***")
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

```

Typically, to execute a request after building it, either the `ProcessRequest(Method, ExecuteImmediately = True)` function is used, or the same function with `ExecuteImmediately = False` and a separate call to `ExecuteRequest`. To receive the final response after processing the request, use one of the functions from the *Receiving the response* section, depending on the expected body format.

## Logging

The client logs its operations as they are performed. To retrieve the log, use the `GetLog` function, which returns a list of actions as an array or a single string (depending on the `AsString` parameter). Some functions from the *Receiving the response* section may also return the log string in an exception if you specify the `ExceptionOnError` parameter (otherwise, in case of an error, the HTTP client object is returned, from which the log can be retrieved manually).

```bsl

    URL             = "https://exemple.com";
    ParamsStructure = New Structure("param1,param2", "text", 10);

    HTTPClient = OPI_HTTPRequests
        .NewRequest()
        .Initialize(URL)
        .SetURLParams(ParamsStructure)
        .ProcessRequest("GET");

    If Not HTTPClient.Error Then
        Response = HTTPClient.ReturnResponseAsJSONObject(); 
    Else
        Response = HTTPClient.GetLog();
    EndIf;
    
```

> **Error** - an exported Boolean field, which is set to True when a critical error occurs in the client