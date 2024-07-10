---
sidebar_position: 2
---

# Get storage for application data
 Get information about storage with which the application can work to store its data


<br/>


`Function GetAppSotrage(Val URL, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>




```bsl title="Code example"
 URL = "b24-ar17wx.bitrix24.by";
 Token = "b9df7366006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.GetAppSotrage(URL, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 GetAppSotrage --url "b24-ar17wx.bitrix24.by" --token "b9df7366006e9f06006b12e400000001000..."

```


