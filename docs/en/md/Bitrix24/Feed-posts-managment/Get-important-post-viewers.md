---
sidebar_position: 4
---

# Get list of important post viewers
 Return list of important post viewers ids



`Function GetImportantPostViewers(Val URL, Val PostID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | PostID | --postid | String, Number | Id of important post |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [log.blogpost.getusers.important](https://dev.1c-bitrix.ru/rest_help/log/log_blogpost_getusers_important.php)
:::
<br/>


```bsl title="Code example"
    PostID = "558";
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.GetImportantPostViewers(URL, PostID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "ec4dc366006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetImportantPostViewers(URL, PostID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetImportantPostViewers --url "b24-ar17wx.bitrix24.by" --postid "438" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": [
  "1"
  ],
  "time": {
  "start": 1718304109.47482,
  "finish": 1718304109.50417,
  "duration": 0.0293447971343994,
  "processing": 0.000212907791137695,
  "date_start": "2024-06-13T18:41:49+00:00",
  "date_finish": "2024-06-13T18:41:49+00:00",
  "operating_reset_at": 1718304709,
  "operating": 0
  }
  }
```
