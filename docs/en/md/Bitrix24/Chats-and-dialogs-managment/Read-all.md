---
sidebar_position: 16
---

# Read all
 Mark all message as readed



`Function ReadAll(Val URL, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.dialog.read.all](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=23804)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 
 Result = OPI_Bitrix24.ReadAll(URL);
 
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "adf89366006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.ReadAll(URL, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 ReadAll --url %url% --token %token%

```

```json title="Result"
{
 "result": true,
 "time": {
 "start": 1720969176.30834,
 "finish": 1720969176.34001,
 "duration": 0.0316698551177978,
 "processing": 0.00501918792724609,
 "date_start": "2024-07-14T14:59:36+00:00",
 "date_finish": "2024-07-14T14:59:36+00:00",
 "operating_reset_at": 1720969776,
 "operating": 0
 }
}
```
