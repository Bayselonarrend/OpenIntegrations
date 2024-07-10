---
sidebar_position: 8
---

# Disapprove task
 Disapprove task by ID


<br/>


`Function DisapproveTask(Val URL, Val TaskID, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | TaskID | --task | Number, String | Task ID |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>




```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 TaskID = "168";
 
 Result = OPI_Bitrix24.DisapproveTask(URL, TaskID);
 
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "b9df7366006e9f06006b12e400000001000...";
 TaskID = "170";
 
 Result = OPI_Bitrix24.DisapproveTask(URL, TaskID, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 DisapproveTask --url "b24-ar17wx.bitrix24.by" --task "170" --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "error": 1048582,
 "error_description": "Action on the task is not allowed"
}
```
