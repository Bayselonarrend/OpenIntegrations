﻿---
sidebar_position: 2
---

# Edit message
 Edit dialog message content



`Function EditMessage(Val URL, Val MessageID, Val Text = "", Val Attachments = "", Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | MessageID | --message | String, Number | ID of the message to be edited |
  | Text | --text | String | New message text |
  | Attachments | --blocks | Array of Structure | New blocks array |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.message.update](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12117)
:::
<br/>


```bsl title="Code example"
    URL       = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    MessageID = "15660";

    Text = "New message text";

    Result = OPI_Bitrix24.EditMessage(URL, MessageID, Text);

    URL       = "b24-ar17wx.bitrix24.by";
    Token     = "37d1fe66006e9f06006b12e400000001000...";
    MessageID = "15662";

    Image = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/service/test_data/picture.jpg";
    File  = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx";

    Attachments = New Array;
    Attachments.Add(OPI_Bitrix24.GetPictureBlock("Image1"  , Image));
    Attachments.Add(OPI_Bitrix24.GetFileBlock("File1.docx" , File));

    Result = OPI_Bitrix24.EditMessage(URL, MessageID, Text, Attachments, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 EditMessage --url "b24-ar17wx.bitrix24.by" --message "8684" --text %text% --blocks %blocks% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728454905.42381,
  "finish": 1728454905.4791,
  "duration": 0.0552828311920166,
  "processing": 0.0245981216430664,
  "date_start": "2024-10-09T09:21:45+03:00",
  "date_finish": "2024-10-09T09:21:45+03:00",
  "operating_reset_at": 1728455505,
  "operating": 0
 }
}
```
