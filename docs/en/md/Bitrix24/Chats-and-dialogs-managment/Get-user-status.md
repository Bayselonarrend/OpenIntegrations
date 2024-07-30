---
sidebar_position: 17
---

# Get user status
 Gets the status (online) of the current user



`Function GetUserStatus(Val URL, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.user.status.get](https://dev.1c-bitrix.ru/learning/course/index.php?COURSE_ID=93&LESSON_ID=11497)
:::
<br/>


```bsl title="Code example"
 URL = FunctionParameters["Bitrix24_URL"];
 
 Result = OPI_Bitrix24.GetUserStatus(URL);
 
 
 
 URL = FunctionParameters["Bitrix24_Domain"];
 Token = FunctionParameters["Bitrix24_Token"];
 
 Result = OPI_Bitrix24.GetUserStatus(URL, Token);
```
	


```sh title="CLI command example"
 
oint bitrix24 GetUserStatus --url %url% --token %token%

```

```json title="Result"
{
 "error": "expired_token",
 "error_description": "The access token provided has expired."
}
```
