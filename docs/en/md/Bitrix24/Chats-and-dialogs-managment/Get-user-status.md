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
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 
 Result = OPI_Bitrix24.GetUserStatus(URL);
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "adf89366006e9f06006b12e400000001000...";
 
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
