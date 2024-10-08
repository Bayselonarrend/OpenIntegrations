---
sidebar_position: 5
---

# Change user status
 Activates or deactivates (fire) the selected user



`Function ChangeUserStatus(Val URL, Val UserID, Val Fire = True, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | UserID | --userid | String, Number | User ID |
  | Fire | --fire | Boolean | True > Deactivation, False > Activation |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>




```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    UserID = "490";

    Result = OPI_Bitrix24.ChangeUserStatus(URL, UserID, True);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";
    UserID = "492";

    Result = OPI_Bitrix24.ChangeUserStatus(URL, UserID, True, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 ChangeUserStatus --url "b24-ar17wx.bitrix24.by" --userid "80" --fire %fire% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728329247.07713,
  "finish": 1728329247.31168,
  "duration": 0.23455286026001,
  "processing": 0.202353000640869,
  "date_start": "2024-10-07T22:27:27+03:00",
  "date_finish": "2024-10-07T22:27:27+03:00",
  "operating_reset_at": 1728329847,
  "operating": 0.461750030517578
 }
}
```
