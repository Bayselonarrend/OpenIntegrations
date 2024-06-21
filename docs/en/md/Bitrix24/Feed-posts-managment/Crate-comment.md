---
sidebar_position: 6
---

# Create comment
 Adds a comment to the post


*Function CrateComment(Val URL, Val PostID, Val Text, Val Token = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | PostID | --postid | String, Number | Post ID |
 | Text | --text | String | Comment text |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

```bsl title="Code example"
	
 Text = "Comment for post";
 PostID = "124";
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 
 Result = OPI_Bitrix24.CrateComment(URL, PostID, Text);
 
 
 Text = "Another comment";
 URL = "b24-ar17wx.bitrix24.by";
 Token = "b9df7366006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.CrateComment(URL, PostID, Text, Token);
	
```

```sh title="CLI command example"
 
 oint bitrix24 CrateComment --url "b24-ar17wx.bitrix24.by" --postid "124" --text %text% --token "b9df7366006e9f06006b12e400000001000..."

```


```json title="Result"

{
 "result": 24,
 "time": {
 "start": 1718473316.57246,
 "finish": 1718473316.67595,
 "duration": 0.103492975234985,
 "processing": 0.0729200839996338,
 "date_start": "2024-06-15T17:41:56+00:00",
 "date_finish": "2024-06-15T17:41:56+00:00",
 "operating_reset_at": 1718473916,
 "operating": 0
 }
}

```
