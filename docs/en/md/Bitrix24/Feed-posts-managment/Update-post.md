---
sidebar_position: 2
---

# Update post
 Change post data



`Function UpdatePost(Val URL, Val PostID, Val Text, Val Visibility = "UA", Val Files = "", Val Title = "", Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | PostID | --postid | String, Number | Post ID |
  | Text | --text | String | Text of post |
  | Visibility | --vision | String | Array or 1 recipient: UA all, SGn w. group, Un user, DRn department, Gn group |
  | Files | --files | Map Of KeyAndValue | Key > file name, value > path or binary data |
  | Title | --title | String | Post title |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [log.blogpost.update](https://dev.1c-bitrix.ru/rest_help/log/log_blogpost_update.php)
:::
<br/>


```bsl title="Code example"
    Text   = "New post text";
    Title  = "New post title";
    Image1 = "https://openyellow.neocities.org/test_data/picture.jpg"; // URL, Path or Binary Data
    PostID = "836";

    Files = New Map;
    Files.Insert("1.png", Image1);

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.UpdatePost(URL, PostID, Text, , Files, Title);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";
    PostID = "834";

    Result = OPI_Bitrix24.UpdatePost(URL, PostID, Text, , Files, Title, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 UpdatePost --url "b24-ar17wx.bitrix24.by" --postid "438" --text %text% --vision %vision% --files %files% --title %title% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": 936,
 "time": {
  "start": 1728329082.02374,
  "finish": 1728329082.48614,
  "duration": 0.462402105331421,
  "processing": 0.339982986450195,
  "date_start": "2024-10-07T22:24:42+03:00",
  "date_finish": "2024-10-07T22:24:42+03:00",
  "operating_reset_at": 1728329682,
  "operating": 0.339963912963867
 }
}
```
