---
id: Twitter
sidebar_class_name: Twitter
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, Twitter]
---

<img src={require('../../static/img/APIs/Twitter.png').default} width='64px' />

# Twitter | X

This section covers the library for working with the Twitter API in 1C:Enterprise, OneScript, and CLI. This page describes all the actions required to get started. The library supports functionality available within the free plan, i.e., creating tweets.

### Getting Started

Working with Twitter requires interacting with two APIs – v1 (1.1) and v2 – each responsible for its own set of features. To begin working with them, you need to assemble a specific set of data and authorization parameters. Their structure is described in the `GetStandardParameters` function.

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

You can define these parameters directly within the structure in this function, or pass them explicitly when calling API methods – each method accepts parameters as the last optional argument. When using the latter approach, the standard parameters will be overwritten by the provided keys. Below are instructions on creating an application and obtaining each field.

### Creating an Application

To use the Twitter API, go to [developer.twitter.com](https://developer.twitter.com/), register, and complete the process of creating a new application. Once you have done that, in the application management panel, you need to provide the fields required to set up the authorization structure:

- **redirect_uri**

    `redirect_uri` is the HTTP handler address specified during registration. API v2 authorization requires login confirmation via a browser, after which a request with a special code will be sent to this handler. See the *access_token and refresh_token* section for more details.

- **scope**

    The `scope` parameter defines which features will be available for use. The default scope list is set in *GetStandardParameters()*.

- **client_id**

    The Client ID can be found on the main settings page under *OAuth 2.0 Client ID and Client Secret*.

- **client_secret**

    The Client Secret can be generated using the `Generate` button in the same section as the Client ID.

- **oauth_token** and **oauth_token_secret**

    Can be generated in the *Authentication Tokens* section, under *Access Token and Secret*.

- **oauth_consumer_key** and **oauth_consumer_secret**

    Can be generated in the *Consumer Keys* section, under *API Key and Secret*.

- **access_token** and **refresh_token**

These tokens must be obtained via an HTTP request using the code returned after authorization at the `redirect_uri` HTTP service. The process is as follows:

1. Create an authorization link for the browser with the `GetAuthorizationLink` function.
2. Add a call to the `HandleIncomingRequestAfterAuthorization` function in the HTTP service module (GET), passing `HTTPServiceRequest` as a parameter.
3. Log in in the browser using the authorization link from step 1.
4. Save the **access_token** and **refresh_token** received from the `HandleIncomingRequestAfterAuthorization` function (step 2) to constants or another storage.

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

Access_token is valid for 2 hours. After this time, the token must be refreshed using the `RefreshToken` function. Both `access_token` and `refresh_token` are updated in this process. This means that when refreshing an expired `access_token` next time, the `refresh_token` from the **previous** request must be used.

After you have set all fields and created the authorization structure, it can be used in various library functions to perform specific actions.