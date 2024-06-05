---
sidebar_position: 1
---

# Create token retrieval link
Getting a link for interactive token retrieval (access_token), which is necessary for further actions


*Function CreateTokenRetrievalLink(Val App_id) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | app_id | --app | String, Number | app_id from application settings |

 
 Returns: String - URL to go to in the browser 

```bsl title="Code example"
	
 Application = "51694790";
 Result = OPI_VK.CreateTokenRetrievalLink(Application);

	
```

```sh title="CLI command example"
 
 oint vk CreateTokenRetrievalLink --app %app%


```


```json title="Result"

"https://oauth.vk.com/authorize?client_id=51694790&scope=offline,wall,groups,photos,stats,stories,ads,market,video&v=5.131&response_type=token&redirect_uri=https://api.vk.com/blank.html"

```
