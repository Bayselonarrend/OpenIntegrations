---
sidebar_position: 17
---

# Get user status
 Gets the status (online) of the current user



`Function GetUserStatus(Val URL, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.user.status.get](https://dev.1c-bitrix.ru/learning/course/index.php?COURSE_ID=93&LESSON_ID=11497)
:::
<br/>


```bsl title="Code example"
    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.GetUserStatus(URL);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetUserStatus(URL, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetUserStatus --url "b24-ar17wx.bitrix24.by" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": "away",
 "time": {
  "start": 1728140780.46645,
  "finish": 1728140780.49094,
  "duration": 0.0244910717010498,
  "processing": 0.000164031982421875,
  "date_start": "2024-10-05T18:06:20+03:00",
  "date_finish": "2024-10-05T18:06:20+03:00",
  "operating_reset_at": 1728141380,
  "operating": 0
 }
}
```
