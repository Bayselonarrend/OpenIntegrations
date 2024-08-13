---
sidebar_position: 1
---

# Send message
 Send message to dialog



`Function SendMessage(Val URL, Val ChatID, Val Text, Val Attachments = "", Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | ChatID | --chat | String, Number | Chat ID (as chatXXX) or User ID (as XXX) |
  | Text | --text | String | Message text |
  | Attachments | --blocks | Array of Structure | Array of attachments |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.message.add](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12115)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
    ChatID = "chat" + "450";
    Text   = "Message text";
    Image  = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/service/test_data/picture.jpg";
    File   = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx";

    Attachments = New Array;
    Attachments.Add(OPI_Bitrix24.GetPictureBlock("Image1"  , Image));
    Attachments.Add(OPI_Bitrix24.GetFileBlock("File1.docx" , File));

    Result = OPI_Bitrix24.SendMessage(URL, ChatID, Text, Attachments);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "fe3fa966006e9f06006b12e400000001000...";
    UserID = 10;

    Result = OPI_Bitrix24.SendMessage(URL, UserID, Text, , Token);
```



```sh title="CLI command example"
    
  oint bitrix24 SendMessage --url "b24-ar17wx.bitrix24.by" --chat "chat + 450" --text "Message text" --blocks %blocks% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
  {
  "result": 5342,
  "time": {
  "start": 1720969163.89343,
  "finish": 1720969163.95538,
  "duration": 0.061945915222168,
  "processing": 0.0366020202636719,
  "date_start": "2024-07-14T14:59:23+00:00",
  "date_finish": "2024-07-14T14:59:23+00:00",
  "operating_reset_at": 1720969763,
  "operating": 0
  }
  }

```
