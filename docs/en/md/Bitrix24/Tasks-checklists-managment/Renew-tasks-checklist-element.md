---
sidebar_position: 7
---

# Renew tasks checklist element
 Unmark an element as completed



`Function RenewTasksChecklistElement(Val URL, Val TaskID, Val ElementID, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | TaskID | --task | Number, String | Task ID |
 | ElementID | --element | Number, String | Element ID |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.checklistitem.renew](https://dev.1c-bitrix.ru/rest_help/tasks/task/checklistitem/renew.php)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
 TaskID = "1078";
 ElementID = "396";
 
 Result = OPI_Bitrix24.RenewTasksChecklistElement(URL, TaskID, ElementID);
 
 TaskID = "1080";
 ElementID = "400";
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "fe3fa966006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.RenewTasksChecklistElement(URL, TaskID, ElementID, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 RenewTasksChecklistElement --url %url% --task %task% --element %element% --token %token%

```

```json title="Result"
{
 "result": true,
 "time": {
 "start": 1720816511.09347,
 "finish": 1720816511.14508,
 "duration": 0.051609992980957,
 "processing": 0.0250108242034912,
 "date_start": "2024-07-12T20:35:11+00:00",
 "date_finish": "2024-07-12T20:35:11+00:00",
 "operating_reset_at": 1720817111,
 "operating": 0
 }
}
```
