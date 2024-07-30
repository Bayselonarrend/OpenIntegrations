---
sidebar_position: 4
---

# Update user
 Updates user data



`Function UpdateUser(Val URL, Val UserID, Val FieldsStructure, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | UserID | --userid | String, Number | User ID |
 | FieldsStructure | --fields | Structure of KeyAndValue | New user data. See. GetUserFieldsStructure |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [user.update](https://dev.1c-bitrix.ru/rest_help/users/user_update.php)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 UserID = "";
 Email = String(New UUID) + "@exepmple.org";
 
 // The full structure can be obtained with the function GetUserFieldsStructure
 
 UserStructure = New Structure;
 UserStructure.Insert("EMAIL", Email);
 UserStructure.Insert("UF_DEPARTMENT", 1);
 
 Result = OPI_Bitrix24.UpdateUser(URL, UserID, UserStructure);
 
 
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "adf89366006e9f06006b12e400000001000...";
 UserID = "10";
 Email = String(New UUID) + "@exepmple.org";
 
 UserStructure = New Structure;
 UserStructure.Insert("EMAIL", Email);
 UserStructure.Insert("NAME", "Oleg");
 UserStructure.Insert("LAST_NAME", "Lama");
 UserStructure.Insert("UF_DEPARTMENT", 7);
 
 Result = OPI_Bitrix24.UpdateUser(URL, UserID, UserStructure, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 UpdateUser --url %url% --userid %userid% --fields %fields% --token %token%

```

```json title="Result"
{
 "result": true,
 "time": {
 "start": 1722328395.63697,
 "finish": 1722328395.97568,
 "duration": 0.338706016540527,
 "processing": 0.310076951980591,
 "date_start": "2024-07-30T08:33:15+00:00",
 "date_finish": "2024-07-30T08:33:15+00:00",
 "operating_reset_at": 1722328995,
 "operating": 0.310055017471314
 }
}
```
