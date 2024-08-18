---
sidebar_position: 3
---

# Set message reaction
 Set or remove reaction mark on the message



`Function SetMessageReaction(Val URL, Val MessageID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | MessageID | --message | String, Number | Message ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.message.like](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12121)
:::
<br/>


```bsl title="Code example"
    URL       = "https://b24-ar17wx.bitrix24.by/rest/1/ztbe...";
    MessageID = "8738";

    Result = OPI_Bitrix24.SetMessageReaction(URL, MessageID);

    URL       = "b24-ar17wx.bitrix24.by";
    Token     = "c03fa966006e9f06006b12e400000001000...";
    MessageID = "8740";

    Result = OPI_Bitrix24.SetMessageReaction(URL, MessageID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 SetMessageReaction --url "b24-ar17wx.bitrix24.by" --message "8684" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": true,
  "time": {
  "start": 1720969166.51361,
  "finish": 1720969166.55322,
  "duration": 0.0396139621734619,
  "processing": 0.0151541233062744,
  "date_start": "2024-07-14T14:59:26+00:00",
  "date_finish": "2024-07-14T14:59:26+00:00",
  "operating_reset_at": 1720969766,
  "operating": 0
  }
  }
```
