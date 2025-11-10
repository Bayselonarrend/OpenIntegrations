---
id: HTTP
sidebar_class_name: HTTP
---

<img src={require('../../static/img/APIs/HTTP.png').default} width='64px' />

# HTTP (Client)


This section covers the library for working with HTTP(s) protocol in 1С:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

## Getting started

The HTTP module is designed to quickly create HTTP requests in 1C:Enterprise and OneScript using the fluent interface. Each request must be started by initializing the HTTP client in one of the following ways:

```bsl title="Common method (recommended)"
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

The client can also be initialized without specifying a URL. See *Initialization* for details

## Common procedure for creating a request

After client initialization, a new request can be described by any number of additional actions listed in the subsections of this documentation block

```bsl

    URL  = "https://exemple.com/post";
    Data = New Structure("Field1,Field2,Field3", 10, "Text", 20);

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetJsonBody(Data)
        .AddHeader("X-My-Header1", "Hello")
        .AddHeader("X-My-Header2", "world")
        .AddAWS4Authorization("***", "***", "***")
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

```

In general, to execute the request after the end of formation, the `ProcessRequest(Method, Start = True)` function is used or the same function with the `Start = False` attribute and calling the `ExecuteRequest` function separately. To receive the final response after processing the request, one of the functions from the *Response receiving* section is used, depending on the expected body format

## Logging

During the client's operation, logging of its actions is performed. To retrieve the log, the `GetLog` function is used, which returns the recorded actions as either an array or a single string (depending on the value of the `AsString` parameter). Some functions from the *Response receiving* section may also return a log string within an exception when the `ExceptionOnError`  parameter is specified (otherwise, in case of an error, the HTTP client object is returned, from which the log can be obtained manually).

```bsl

    URL             = "https://exemple.com";
    ParamsStructure = New Structure("param1,param2", "text", 10);

    HTTPClient = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetURLParams(ParamsStructure)
        .ProcessRequest("GET");

    If Not HTTPClient.Error Then
        Response = HTTPClient.ReturnResponseAsJSONObject(); 
    Else
        Response = HTTPClient.GetLog();
    EndIf;
    
```

> **Error** - an export field (Boolean type) that is set to True when a critical error occurs in the client