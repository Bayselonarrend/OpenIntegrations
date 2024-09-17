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
    PostID = FunctionParameters["Bitrix24_HookPostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.DeletePost(URL, PostID);

    PostID = FunctionParameters["Bitrix24_PostID"];
    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.DeletePost(URL, PostID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 DeletePost --url "b24-ar17wx.bitrix24.by" --postid "440" --token "fe3fa966006e9f06006b12e400000001000..."

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
