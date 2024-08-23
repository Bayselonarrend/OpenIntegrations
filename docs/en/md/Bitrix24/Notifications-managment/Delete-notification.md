---
sidebar_position: 3
---

# Delete notification
 Delete notification by ID



`Function DeleteNotification(Val URL, Val NotificationID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | NotificationID | --notif | String, Number | Notification ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.notify.delete](https://dev.1c-bitrix.ru/learning/course/index.php?COURSE_ID=93&LESSON_ID=12133)
:::
<br/>


```bsl title="Code example"
    URL            = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    NotificationID = "10610";

    Result = OPI_Bitrix24.DeleteNotification(URL, NotificationID);

    URL            = "b24-ar17wx.bitrix24.by";
    Token          = "6476c766006e9f06006b12e400000001000...";
    NotificationID = "10612";

    Result = OPI_Bitrix24.DeleteNotification(URL, NotificationID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 DeleteNotification --url "b24-ar17wx.bitrix24.by" --notif "8692" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": true,
  "time": {
  "start": 1722087271.36087,
  "finish": 1722087271.39818,
  "duration": 0.0373120307922363,
  "processing": 0.0110759735107422,
  "date_start": "2024-07-27T13:34:31+00:00",
  "date_finish": "2024-07-27T13:34:31+00:00",
  "operating_reset_at": 1722087871,
  "operating": 0
  }
  }
```
