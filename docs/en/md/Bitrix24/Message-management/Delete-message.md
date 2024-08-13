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
    URL       = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
    MessageID = "8682";

    Result = OPI_Bitrix24.DeleteMessage(URL, MessageID);

    URL       = "b24-ar17wx.bitrix24.by";
    Token     = "fe3fa966006e9f06006b12e400000001000...";
    MessageID = "8684";

    Result = OPI_Bitrix24.DeleteMessage(URL, MessageID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 DeleteMessage --url "b24-ar17wx.bitrix24.by" --message "8684" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
  {
  "result": true,
  "time": {
  "start": 1720969167.77137,
  "finish": 1720969167.82331,
  "duration": 0.051936149597168,
  "processing": 0.0215229988098145,
  "date_start": "2024-07-14T14:59:27+00:00",
  "date_finish": "2024-07-14T14:59:27+00:00",
  "operating_reset_at": 1720969767,
  "operating": 0
  }
  }

```
