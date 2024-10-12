---
sidebar_position: 7
---

# Add new recipients to a post
 Adds new groups or users to the recipients



`Function AddPostRecipients(Val URL, Val PostID, Val Visibility, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | PostID | --postid | String, Number | Post ID |
  | Visibility | --vision | String | Array or 1 recipient: UA all, SGn w. group, Un user, DRn department, Gn group |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [log.blogpost.share](https://dev.1c-bitrix.ru/rest_help/log/log_blogpost_share.php)
:::
<br/>


```bsl title="Code example"
    Visibility = "UA";
    PostID     = "970";
    URL        = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.AddPostRecipients(URL, PostID, Visibility);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "21750a67006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.AddPostRecipients(URL, PostID, Visibility, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 AddPostRecipients --url "b24-ar17wx.bitrix24.by" --postid "440" --vision "UA" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728454765.18756,
  "finish": 1728454765.2209,
  "duration": 0.033344030380249,
  "processing": 0.00590705871582031,
  "date_start": "2024-10-09T09:19:25+03:00",
  "date_finish": "2024-10-09T09:19:25+03:00",
  "operating_reset_at": 1728455365,
  "operating": 0
 }
}
```
