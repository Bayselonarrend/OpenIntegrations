---
sidebar_position: 19
---

# Read all
 Mark all message as readed



`Function ReadAll(Val URL, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.dialog.read.all](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=23804)
:::
<br/>


```bsl title="Code example"
    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.ReadAll(URL);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.ReadAll(URL, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 ReadAll --url "b24-ar17wx.bitrix24.by" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728329229.9261,
  "finish": 1728329229.96503,
  "duration": 0.0389351844787598,
  "processing": 0.0126149654388428,
  "date_start": "2024-10-07T22:27:09+03:00",
  "date_finish": "2024-10-07T22:27:09+03:00",
  "operating_reset_at": 1728329829,
  "operating": 0
 }
}
```
