---
sidebar_position: 9
---

# Change chat picture
 Setup new chat picture



`Function ChangeChatPicture(Val URL, Val ChatID, Val Image, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | ChatID | --chat | String, Number | Chat ID |
  | Image | --picture | String, BinaryData | Picture data |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.chat.updateAvatar](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12109)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    ChatID = "578";

    Image = "https://openintegrations.dev/test_data/picture2.jpg";

    Result = OPI_Bitrix24.ChangeChatPicture(URL, ChatID, Image);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "ec4dc366006e9f06006b12e400000001000...";
    ChatID = "580";

    Result = OPI_Bitrix24.ChangeChatPicture(URL, ChatID, Image, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 ChangeChatPicture --url "b24-ar17wx.bitrix24.by" --chat "452" --picture "https://openintegrations.dev/test_data/picture2.jpg" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": true,
  "time": {
  "start": 1720865692.90718,
  "finish": 1720865693.81896,
  "duration": 0.91178297996521,
  "processing": 0.884725093841553,
  "date_start": "2024-07-13T10:14:52+00:00",
  "date_finish": "2024-07-13T10:14:53+00:00",
  "operating_reset_at": 1720866292,
  "operating": 0.884703874588013
  }
  }
```
