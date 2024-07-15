---
sidebar_position: 3
---

# Delete post
 Remove post from a news feed



`Function DeletePost(Val URL, Val PostID, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | PostID | --postid | String, Number | Id of post to remove |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [log.blogpost.delete](https://dev.1c-bitrix.ru/rest_help/log/log_blogpost_delete.php)
:::
<br/>


```bsl title="Code example"
 PostID = "318";
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 
 Result = OPI_Bitrix24.DeletePost(URL, PostID);
 
 
 PostID = "320";
 URL = "b24-ar17wx.bitrix24.by";
 Token = "adf89366006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.DeletePost(URL, PostID, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 DeletePost --url "b24-ar17wx.bitrix24.by" --postid "124" --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
 "start": 1718130367.40777,
 "finish": 1718130367.7596,
 "duration": 0.35182785987854,
 "processing": 0.310530185699463,
 "date_start": "2024-06-11T18:26:07+00:00",
 "date_finish": "2024-06-11T18:26:07+00:00",
 "operating_reset_at": 1718130967,
 "operating": 0.310499906539917
 }
}
```
