---
sidebar_position: 20
---

# Get comments list for a task
 Get user comments list for a task


*Function GetTaskCommentsList(Val URL, Val TaskID, Val Filter = "", Val Token = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | TaskID | --task | Number, String | Task ID |
 | Filter | --filter | Structure of Key-Value | Comments filter structure (see GetCommentsFilterStructure) |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

```bsl title="Code example"
	

	
```

```sh title="CLI command example"
 
oint bitrix24 GetTaskCommentsList --url %url% --task %task% --filter %filter% --token %token%

```


```json title="Result"



```
