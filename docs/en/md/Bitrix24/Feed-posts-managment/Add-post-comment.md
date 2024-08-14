---
sidebar_position: 6
---

# Add comment to post
 Adds a comment to the post



`Function AddPostComment(Val URL, Val PostID, Val Text, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | PostID | --postid | String, Number | Post ID |
  | Text | --text | String | Comment text |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [log.blogcomment.add](https://dev.1c-bitrix.ru/rest_help/log/log_blogcomment_add.php)
:::
<br/>


```bsl title="Code example"
    Text   = "Comment for post";
    PostID = "440";
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/f2pp...";

    Result = OPI_Bitrix24.AddPostComment(URL, PostID, Text);

    Text  = "Another comment";
    URL   = "b24-ar17wx.bitrix24.by";
    Token = "fe3fa966006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.AddPostComment(URL, PostID, Text, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 AddPostComment --url "b24-ar17wx.bitrix24.by" --postid "440" --text "Another comment" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": 168,
  "time": {
  "start": 1720186639.67208,
  "finish": 1720186639.77202,
  "duration": 0.0999400615692139,
  "processing": 0.0715811252593994,
  "date_start": "2024-07-05T13:37:19+00:00",
  "date_finish": "2024-07-05T13:37:19+00:00",
  "operating_reset_at": 1720187239,
  "operating": 0
  }
  }
```
