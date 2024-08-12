---
sidebar_position: 2
---

# Update tasks checklist element
 Updates text of element of tasks checklist



`Function UpdateTasksChecklistElement(Val URL, Val TaskID, Val ElementID, Val Text, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | TaskID | --task | Number, String | Task ID |
 | ElementID | --element | Number, String | Checklist element ID |
 | Text | --text | String | Text (title) of checklist element |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.checklistitem.update](https://dev.1c-bitrix.ru/rest_help/tasks/task/checklistitem/update.php)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
 TaskID = "1078";
 ElementID = "396";
 
 Text = "New elements text";
 
 Result = OPI_Bitrix24.UpdateTasksChecklistElement(URL, TaskID, ElementID, Text);
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "fe3fa966006e9f06006b12e400000001000...";
 TaskID = "1080";
 ElementID = "400";
 
 Result = OPI_Bitrix24.UpdateTasksChecklistElement(URL, TaskID, ElementID, Text, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 UpdateTasksChecklistElement --url %url% --task %task% --element %element% --text %text% --token %token%

```

```json title="Result"
{
 "result": null,
 "time": {
 "start": 1720816506.52861,
 "finish": 1720816506.58416,
 "duration": 0.0555450916290283,
 "processing": 0.027979850769043,
 "date_start": "2024-07-12T20:35:06+00:00",
 "date_finish": "2024-07-12T20:35:06+00:00",
 "operating_reset_at": 1720817106,
 "operating": 0
 }
}
```
