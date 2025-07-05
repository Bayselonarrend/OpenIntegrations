---
id: VK
sidebar_class_name: VK
---

<img src={require('../../static/img/APIs/VK.png').default} width='64px' />

# VKontakte

This section is dedicated to the library for working with VK API. It is geared towards working with communities and performing actions on their behalf. On this page, all the steps necessary to start working are described

## Getting started

To begin, you need to obtain certain parameters for the VK API. 

<br/><br/>
The list of necessary data in the form of a structure is contained in the function *GetStandardParameters()*. You can specify parameter values directly within it or pass them as a structure when calling any other library methods as an optional parameter *Parameters* (the last one in all library methods). In the latter case, the standard parameters will be overwritten by the ones passed during the method call. Only the data with matching keys will be overwritten. If a parameter exists in the standard set but was not passed during the method call, it will retain its default value.
<br/><br/>
 
 ```bsl
 _Parameters = New Structure;

 _Parameters.Insert("v", "5.131");
 _Parameters.Insert("from_group", "1");
 _Parameters.Insert("group_id", "123456789");
 _Parameters.Insert("owner_id", "-123456789");
 _Parameters.Insert("app_id", "87654321");
 _Parameters.Insert("access_token", "vk1.a.E-byuFeG1qcN7...");
	
 ```

Let's consider obtaining of each value:

**1. v**
 
	The parameter `v` denotes the version of the VK API. Testing was conducted on version 5.131, and it is recommended to keep it as such

**2. from_group**

	On behalf of the group. It should be set to 1

**3. group_id and owner_id**

	Group ID. If you have a standard group URL, you can find the ID in the URL. Otherwise, it will be on the 'Manage' tab in the group, below the Address field. 'owner_id' is the same but with a '-' sign in front of it

	![BF](../../static/img/Docs/VK/1.png)
	
**4. app_id**

	app_id - Application ID. To create an application, you need to:
 
	* Go to the https://id.vk.com/about/business/go, authorize and enter your personal or company information
		
		![BF](../../static/img/Docs/VK/2.png)
		
	* Enter the application name and select the **Web**
	
		![BF](../../static/img/Docs/VK/3.png)
		
	* Enter the domain name and the URL of the redirect handler. It's worth noting that this mechanism for creating VK applications is new. Until recently, VK applications were created differently, and having a redirect URL was unnecessary. At the moment, it's not entirely clear why it's needed for our server application - VK no longer distinguishes server applications as such. Theoretically, you can enter anything there - there is no need for receiving callback data to work with the library. However, this may change over time.
	
		![BF](../../static/img/Docs/VK/4.png)
		
	* Enter passport details or organization information, enable access to communities (in short, if you already had an application before, you're lucky, but if you don't have a Russian passport, you'll have to contact support)
		
		![BF](../../static/img/Docs/VK/8.png)
		
	* Get app_id at the application page
	
		![BF](../../static/img/Docs/VK/5.png)

**5. access_token**

	You can obtain a link for acquiring the access token using the function *CreateTokenRetrievalLink* or manually concatenate it
 
	https://oauth.vk.com/authorize?client_id= + *app_id* + &scope=offline,wall,groups,photos,stats,stories,ads&v=5.131&response_type=token&redirect_uri=https://api.vk.com/blank.html
	
	* You need to follow this link in your browser
	* Authorize through VK and confirm access
	* Retrieve the token from the URL parameter in the address bar

	![BF](../../static/img/Docs/VK/6.png)
	
**(Additionally) communitytoken**

	Some methods, such as those for working with community chat bots, accept the parameter 'communitytoken' instead of 'access_token'. To obtain it, you need to:

	* Go to the 'Manage' section in the VK group
	* Find the 'API usage' tab
	* Click on 'Create key' and retrieve it
	
	![BF](../../static/img/Docs/VK/7.png)

	You don't need to obtain the 'communitytoken' if you're not using such methods at the moment
