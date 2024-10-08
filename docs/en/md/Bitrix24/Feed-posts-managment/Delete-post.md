﻿---
sidebar_position: 3
---

# Delete post
 Remove post from a news feed



`Function DeletePost(Val URL, Val PostID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | PostID | --postid | String, Number | Id of post to remove |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [log.blogpost.delete](https://dev.1c-bitrix.ru/rest_help/log/log_blogpost_delete.php)
:::
<br/>


```bsl title="Code example"
    PostID = "834";
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.DeletePost(URL, PostID);

    PostID = "836";
    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.DeletePost(URL, PostID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 DeletePost --url "b24-ar17wx.bitrix24.by" --postid "440" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728454765.65176,
  "finish": 1728454765.95776,
  "duration": 0.305999994277954,
  "processing": 0.267876863479614,
  "date_start": "2024-10-09T09:19:25+03:00",
  "date_finish": "2024-10-09T09:19:25+03:00",
  "operating_reset_at": 1728455365,
  "operating": 0.267848968505859
 }
}
```
