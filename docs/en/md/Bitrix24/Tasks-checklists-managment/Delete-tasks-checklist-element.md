﻿---
sidebar_position: 3
---

# Delete tasks checklist element
 Deletes element from tasks checklist



`Function DeleteTasksChecklistElement(Val URL, Val TaskID, Val ElementID, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | TaskID | --task | Number, String | Task ID |
 | ElementID | --element | Number, String | ID of deleted element |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.checklistitem.delete](https://dev.1c-bitrix.ru/rest_help/tasks/task/checklistitem/delete.php)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/f2pph8uucc89is6c/";
 TaskID = "1078";
 ElementID = "396";
 
 Result = OPI_Bitrix24.DeleteTasksChecklistElement(URL, TaskID, ElementID);
 
 TaskID = "1080";
 ElementID = "400";
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "fe3fa966006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.DeleteTasksChecklistElement(URL, TaskID, ElementID, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 DeleteTasksChecklistElement --url %url% --task %task% --element %element% --token %token%

```

```json title="Result"
{
 "result": true,
 "time": {
 "start": 1720816512.25818,
 "finish": 1720816512.30984,
 "duration": 0.0516610145568848,
 "processing": 0.0264489650726318,
 "date_start": "2024-07-12T20:35:12+00:00",
 "date_finish": "2024-07-12T20:35:12+00:00",
 "operating_reset_at": 1720817112,
 "operating": 0
 }
}
```
