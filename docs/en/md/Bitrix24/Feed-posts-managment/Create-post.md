---
sidebar_position: 1
---

# Create post
 Create a new post at news feed



`Function CreatePost(Val URL, Val Text, Val Visibility = "UA", Val Files = "", Val Title = "", Val Important = False, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | Text | --text | String | Text of post |
  | Visibility | --vision | String | Array or 1 recipient: UA all, SGn w. group, Un user, DRn department, Gn group |
  | Files | --files | Map Of KeyAndValue | Key > file name, value > path or binary data |
  | Title | --title | String | Post title |
  | Important | --important | Boolean | Mark post as important |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [log.blogpost.add](https://dev.1c-bitrix.ru/rest_help/log/log_blogpost_add.php)
:::
<br/>


```bsl title="Code example"
    Text   = "Text of post";
    Title  = "Post title";
    Image1 = "https://openyellow.neocities.org/test_data/picture.jpg"; // URL, Path or Binary Data
    Image2 = "https://openyellow.neocities.org/test_data/picture2.jpg"; // URL, Path or Binary Data

    Files = New Map;
    Files.Insert("1.png", Image1);
    Files.Insert("2.png", Image2);

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.CreatePost(URL, Text, , Files, Title, True);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.CreatePost(URL, Text, , Files, Title, , Token);
```



```sh title="CLI command example"
    
  oint bitrix24 CreatePost --url "b24-ar17wx.bitrix24.by" --text "Text of post" --vision %vision% --files %files% --title "Post title" --important %important% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": 938,
 "time": {
  "start": 1728329078.76515,
  "finish": 1728329079.43685,
  "duration": 0.671701908111572,
  "processing": 0.63833212852478,
  "date_start": "2024-10-07T22:24:38+03:00",
  "date_finish": "2024-10-07T22:24:39+03:00",
  "operating_reset_at": 1728329678,
  "operating": 0.638311147689819
 }
}
```
