---
id: Twitter
sidebar_class_name: Twitter
---

<img src={require('../../static/img/APIs/Twitter.png').default} width='64px' />

# Twitter | X

This section is dedicated to the library for working with Twitter API. On this page, all the steps necessary to start working are described. This library allows you to work with the functionality of the free plan, meaning you can create tweets. 

## Getting started

 
Working with Twitter involves using two APIs - v1 (1.1) and v2, which are not separate types of actions but simply different versions of the API. Despite Twitter's preference for v2, it turned out that some mechanisms (such as the file upload mechanism) did not appear in it. Therefore, even for creating a regular tweet with an image, you need to work with both API versions, resulting in a double set of authentication data. This set is described in the function *GetStandardParameters()*


```bsl

	Parameters_.Insert("redirect_uri", "");
	Parameters_.Insert("scope", "");
	Parameters_.Insert("client_id", "");
	Parameters_.Insert("client_secret", "");
	Parameters_.Insert("access_token", ""); 
	Parameters_.Insert("refresh_token", ""); 
	Parameters_.Insert("oauth_token", "");
	Parameters_.Insert("oauth_token_secret", "");
	Parameters_.Insert("oauth_consumer_key", "");
	Parameters_.Insert("oauth_consumer_secret", "");

```

You can define these parameters directly within the structure inside this function or pass them directly when calling the functions for working with the API - each of them accepts parameters as the last optional argument. When passing parameters in this way, the default parameters will be overwritten by keys. Let's consider the creation of an application and obtaining each field


	### Creating an application
	To work with the Twitter API, you need to go to the following address: [https://developer.twitter.com/](https://developer.twitter.com/), register, and create a new application
	
	![BF](../../static/img/Docs/Twitter/1.png)
	![BF](../../static/img/Docs/Twitter/2.png)
	![BF](../../static/img/Docs/Twitter/3.png)
	![BF](../../static/img/Docs/Twitter/4.png)
	![BF](../../static/img/Docs/Twitter/5.png)
	
	### Definition of fields
	After creating the application, you can fill in the necessary data in 1C
	

		- **redirect_uri**
			
			redirect_uri - The URL of the HTTP request handler specified during registration. Authorization for API v2 requires confirmation of login through the browser, after which a request with a special code will be sent to this handler. Further details will be provided in the section on access_token and refresh_token.
			
			
		- **scope**
		
			The scope determines the functions available for operation. In GetStandardParameters(), the scope list is defined by default.
			
		- **client_id**
		
			![BF](../../static/img/Docs/Twitter/6.png)

		- **client_secret**
		
			![BF](../../static/img/Docs/Twitter/7.png)
			
		- **access_token** and **refresh_token**
		
			These tokens need to be obtained via an HTTP request with the code that comes during authorization on the HTTP service redirect_uri. The sequence of actions is as follows:
			1. Create a link for authorization in the browser using the *GetAuthorizationLink* function
			2. Add to the HTTP service module (GET) a call to the *HandleIncomingRequestAfterAuthorization* function, passing the HTTP service request as a parameter.
			3. Authorize in the browser using the link from step 1
			3. Save the access_token and refresh_token obtained from the *HandleIncomingRequestAfterAuthorization* function in step 2 into constants or another storage
			
			
			```bsl title="Obtaining"
			
				Function Twitterget(Request)
					
					Code = Request.RequestParameters["code"];	
					TokenResponse = OPI_Twitter.GetToken(Code, Parameters);
					
					Constants.TwitterRefresh.Set(ResponseToken["refresh_token"]);
					Constants.TwitterToken.Set(ResponseToken["access_token"]);
					
					Response = New HTTPServiceResponse(200);
					Return Response;
					
				EndFunction

			```
			
			```bsl title="Updating"
			
				Procedure UpdateTokenEveryTwoHours(Val Parameters) 
				
					Response = OPI_Twitter.RefreshToken(Parameters);
					Constants.TwitterToken.Set(Response["access_token"]);
					Constants.TwitterRefresh.Set(Response["refresh_token"]);

				EndProcedure
			```
			
			Hardcoding token data is not recommended because the access_token expires after only 2 hours. Upon expiration, the token needs to be refreshed using the RefreshToken function. During this update, both the access_token and refresh_token are refreshed. Therefore, when refreshing the expired access_token token next time, the refresh_token should be from the previous request. 
			
			![BF](../../static/img/Docs/Twitter/8.png)
			
	
		- **oauth_token** and **oauth_token_secret**
		
			![BF](../../static/img/Docs/Twitter/9.png)
			
		- **oauth_consumer_key** and **oauth_consumer_secret**
		
			![BF](../../static/img/Docs/Twitter/10.png)
			
	
	After filling in the data fields, you can proceed to work with the API methods
		
			
			
