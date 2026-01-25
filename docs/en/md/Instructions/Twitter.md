---
id: Twitter
sidebar_class_name: Twitter
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, Twitter]
---

<img src={require('../../static/img/APIs/Twitter.png').default} width='64px' />

# Twitter | X

This section covers the library for working with Twitter API in 1С:Enterprise, OneScript, and CLI. This page describes all the steps required to get started. This library allows working with the functionality of the free plan, i.e., creating tweets.

### Getting Started

Working with Twitter involves working with two APIs - v1 (1.1) and v2, each responsible for its own set of functionality. To start working with them, you need to form a specific set of data and authorization parameters. Its structure is described in the `GetStandardParameters` function.

```bsl
	Parameters_.Insert("redirect_uri"         , "");
	Parameters_.Insert("scope"                , "");
	Parameters_.Insert("client_id"            , "");
	Parameters_.Insert("client_secret"        , "");
	Parameters_.Insert("access_token"         , ""); 
	Parameters_.Insert("refresh_token"        , ""); 
	Parameters_.Insert("oauth_token"          , "");
	Parameters_.Insert("oauth_token_secret"   , "");
	Parameters_.Insert("oauth_consumer_key"   , "");
	Parameters_.Insert("oauth_consumer_secret", "");
```

You can define these parameters directly in the structure within this function or pass them directly when calling API functions - each of them accepts parameters as the last optional argument. When passed this way, standard parameters will be overwritten by keys. Let's examine application creation and obtaining each field.

### Creating an Application

To work with Twitter API, you need to go to [developer.twitter.com](https://developer.twitter.com/), register, and complete the procedure for creating a new application. After that, in the application management panel, you need to define the fields required for creating the authorization structure:

- **redirect_uri**
    
    `redirect_uri` - the HTTP request handler address specified during registration. API v2 authorization requires login confirmation through a browser, after which a request with a special code will be sent to this handler. More details in the *access_token and refresh_token* section.
    
    
- **scope**

    scope defines the available functions for work. In *GetStandardParameters()*, the scope list is defined by default.
    
- **client_id**

    Client ID can be found on the main settings page in the *OAuth 2.0 Client ID and Client Secret* section.

- **client_secret**

    Client secret can be generated using the `Generate` button in the same section as the Client ID.

- **oauth_token** and **oauth_token_secret**

    Can be generated in the *Authentication Tokens* section, under *Access Token and Secret*.

- **oauth_consumer_key** and **oauth_consumer_secret**

    Can be generated in the *Consumer Keys* section, under *API Key and Secret*.
    
- **access_token** and **refresh_token**

These tokens need to be obtained via an HTTP request specifying the code that comes during authorization to the `redirect_uri` HTTP service. Procedure:

1. Create an authorization link for the browser using the `GetAuthorizationLink` function.
2. Add a call to the `HandleIncomingRequestAfterAuthorization` function to the HTTP service module (GET), passing `HTTPServiceRequest` as a parameter.
3. Authorize in the browser using the link from step 1.
4. Save the **access_token** and **refresh_token** obtained from the `HandleIncomingRequestAfterAuthorization` function in step 2 to constants or other storage.

```bsl title="Retrieval"

    Function TwitterGet(Request)
        
        Code           = Request.QueryOptions["code"];    
        TokenResponse  = OPI_Twitter.GetToken(Code, Parameters);
        
        Constants.TwitterRefresh.Set(TokenResponse["refresh_token"]);
        Constants.TwitterToken.Set(TokenResponse["access_token"]);
        
        Response = New HTTPServiceResponse(200);
        Return Response;
        
    EndFunction
```

```bsl title="Refreshing"
    Procedure RefreshTokenEveryTwoHours(Parameters) 
    
        Response = OPI_Twitter.RefreshToken(Parameters);
        Constants.TwitterToken.Set(Response["access_token"]);
        Constants.TwitterRefresh.Set(Response["refresh_token"]);

    EndProcedure
```

Access_token is valid for 2 hours. After this period, the token must be refreshed using the `RefreshToken` function. Both `access_token` and `refresh_token` are updated during this process. This means that when refreshing an expired `access_token` next time, the `refresh_token` must be from the **previous** request.

After defining all fields and creating the authorization structure, they can be used in various library functions to perform specific actions.