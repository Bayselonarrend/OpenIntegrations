---
sidebar_position: 1
---

# Create post
 Create a new post at news feed



`Function CreatePost(Val URL, Val Text, Val Visibility = "UA", Val Files = "", Val Title = "", Val Important = False, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | Text | --text | String | Text of post |
 | Visibility | --vision | String | Array or 1 recipient: UA all, SGn w. group, Un user, DRn department, Gn group |
 | Files | --files | Map Of KeyAndValue | Key > file name, value > path or binary data |
 | Title | --title | String | Post title |
 | Important | --important | Boolean | Mark post as important |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [log.blogpost.add](https://dev.1c-bitrix.ru/rest_help/log/log_blogpost_add.php)
:::
<br/>


```bsl title="Code example"
 Text = "Text of post";
 Title = "Post title";
 Image1 = "https://openintegrations.dev/test_data/picture.jpg"; // URL, Path or Binary Data
 Image2 = "https://openintegrations.dev/test_data/picture2.jpg"; // URL, Path or Binary Data
 
 Files = New Map;
 Files.Insert("1.png", Image1);
 Files.Insert("2.png", Image2);
 
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/f2pph8uucc89is6c/";
 
 Result = OPI_Bitrix24.CreatePost(URL, Text,, Files, Title, True);
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "fe3fa966006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.CreatePost(URL, Text,, Files, Title,, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 CreatePost --url "b24-ar17wx.bitrix24.by" --text %text% --vision %vision% --files %files% --title %title% --important %important% --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": 18,
 "time": {
 "start": 1718130364.82176,
 "finish": 1718130365.61903,
 "duration": 0.797268867492676,
 "processing": 0.63801383972168,
 "date_start": "2024-06-11T18:26:04+00:00",
 "date_finish": "2024-06-11T18:26:05+00:00",
 "operating_reset_at": 1718130964,
 "operating": 0.637988090515137
 }
}
```
