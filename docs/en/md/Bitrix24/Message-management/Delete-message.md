---
sidebar_position: 4
---

# Delete message
 Deletes a dialog message



`Function DeleteMessage(Val URL, Val MessageID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | MessageID | --message | String, Number | ID of the message to be deleted |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.message.delete](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12119)
:::
<br/>


```bsl title="Code example"
    URL       = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    MessageID = "15660";

    Result = OPI_Bitrix24.DeleteMessage(URL, MessageID);

    URL       = "b24-ar17wx.bitrix24.by";
    Token     = "37d1fe66006e9f06006b12e400000001000...";
    MessageID = "15662";

    Result = OPI_Bitrix24.DeleteMessage(URL, MessageID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 DeleteMessage --url "b24-ar17wx.bitrix24.by" --message "8684" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728140846.21628,
  "finish": 1728140846.26441,
  "duration": 0.0481219291687012,
  "processing": 0.0228168964385986,
  "date_start": "2024-10-05T18:07:26+03:00",
  "date_finish": "2024-10-05T18:07:26+03:00",
  "operating_reset_at": 1728141446,
  "operating": 0
 }
}
```
