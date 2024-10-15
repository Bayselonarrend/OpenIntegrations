---
sidebar_position: 4
---

# Get list of important post viewers
 Return list of important post viewers ids



`Function GetImportantPostViewers(Val URL, Val PostID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | PostID | --postid | String, Number | Id of important post |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [log.blogpost.getusers.important](https://dev.1c-bitrix.ru/rest_help/log/log_blogpost_getusers_important.php)
:::
<br/>


```bsl title="Code example"
    PostID = "956";
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.GetImportantPostViewers(URL, PostID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "49e20867006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetImportantPostViewers(URL, PostID, Token);
```
 



```json title="Result"
{
 "result": [
  "1"
 ],
 "time": {
  "start": 1728454764.35244,
  "finish": 1728454764.38658,
  "duration": 0.0341410636901856,
  "processing": 0.000212907791137695,
  "date_start": "2024-10-09T09:19:24+03:00",
  "date_finish": "2024-10-09T09:19:24+03:00",
  "operating_reset_at": 1728455364,
  "operating": 0
 }
}
```
