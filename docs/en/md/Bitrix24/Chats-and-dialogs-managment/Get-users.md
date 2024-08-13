---
sidebar_position: 4
---

# Get users
 Get users information for dialog



`Function GetUsers(Val URL, Val UserIDs, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | UserIDs | --users | Array of String, Number | Usesr ID or array of users IDs |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.user.list.get ](https://dev.1c-bitrix.ru/learning/course/index.php?COURSE_ID=93&LESSON_ID=11493)
:::
<br/>


```bsl title="Code example"
  URL          = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
  ArrayOfUsers = New Array;
  
  ArrayOfUsers.Add(1);
  ArrayOfUsers.Add(10);
  
  Result = OPI_Bitrix24.GetUsers(URL, ArrayOfUsers);
  
  URL     = "b24-ar17wx.bitrix24.by";
  Token   = "fe3fa966006e9f06006b12e400000001000...";
  UserIDs = 10;
  
  Result = OPI_Bitrix24.GetUsers(URL, UserIDs, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetUsers --url "b24-ar17wx.bitrix24.by" --users "10" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": {
  "10": {
  "id": 10,
  "active": true,
  "name": "Techno Pizza",
  "first_name": "Techno",
  "last_name": "Pizza",
  "work_position": null,
  "color": "#ab7761",
  "avatar": "",
  "gender": "M",
  "birthday": "",
  "extranet": false,
  "network": false,
  "bot": false,
  "connector": false,
  "external_auth_id": "socservices",
  "status": "online",
  "idle": false,
  "last_activity_date": "2024-07-13T18:36:23+00:00",
  "mobile_last_date": false,
  "absent": false,
  "departments": [
  1
  ],
  "phones": false
  }
  },
  "time": {
  "start": 1722083796.56495,
  "finish": 1722083796.59641,
  "duration": 0.031451940536499,
  "processing": 0.00229191780090332,
  "date_start": "2024-07-27T12:36:36+00:00",
  "date_finish": "2024-07-27T12:36:36+00:00",
  "operating_reset_at": 1722084396,
  "operating": 0
  }
  }
```
