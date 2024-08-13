---
sidebar_position: 2
---

# Create system notification
 Creates a system notification to the user



`Function CreateSystemNotification(Val URL, Val UserID, Val Text, Val Tag = "", Val Attachments = "", Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | UserID | --user | String, Number | User ID for sending the notification |
  | Text | --text | String | Notification text |
  | Tag | --tag | String | Uniqueness Tag. If already exist, other notif. will be deleted |
  | Attachments | --blocks | Array of Structure | Array of attachments |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.notify.system.add](https://dev.1c-bitrix.ru/learning/course/index.php?COURSE_ID=93&LESSON_ID=12131)
:::
<br/>


```bsl title="Code example"
    UserID = 1;

    URL   = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
    Text  = "Message text";
    Image = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/service/test_data/picture.jpg";
    File  = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx";

    Attachments = New Array;
    Attachments.Add(OPI_Bitrix24.GetPictureBlock("Image1"  , Image));
    Attachments.Add(OPI_Bitrix24.GetFileBlock("File1.docx" , File));

    Result = OPI_Bitrix24.CreateSystemNotification(URL, UserID, Text, ,Attachments);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "fe3fa966006e9f06006b12e400000001000...";
    Tag    = "New";
    UserID = 10;

    Result = OPI_Bitrix24.CreateSystemNotification(URL, UserID, Text, Tag, , Token);
```



```sh title="CLI command example"
    
  oint bitrix24 CreateSystemNotification --url "b24-ar17wx.bitrix24.by" --user "10" --text "Message text" --tag %tag% --blocks %blocks% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
  {
  "result": 7454,
  "time": {
  "start": 1722087270.72466,
  "finish": 1722087270.78145,
  "duration": 0.0567879676818848,
  "processing": 0.0293958187103272,
  "date_start": "2024-07-27T13:34:30+00:00",
  "date_finish": "2024-07-27T13:34:30+00:00",
  "operating_reset_at": 1722087870,
  "operating": 0
  }
  }

```
