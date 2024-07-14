---
sidebar_position: 5
---

# Delete task
 Delete task by ID



`Function DeleteTask(Val URL, Val TaskID, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | TaskID | --task | Number, String | Task ID |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [tasks.task.delete](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_delete.php)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 TaskID = "168";
 
 Result = OPI_Bitrix24.DeleteTask(URL, TaskID);
 
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "b9df7366006e9f06006b12e400000001000...";
 TaskID = "170";
 
 Result = OPI_Bitrix24.DeleteTask(URL, TaskID, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 DeleteTask --url "b24-ar17wx.bitrix24.by" --task "170" --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
 "task": true
 },
 "time": {
 "start": 1718473350.68409,
 "finish": 1718473350.80999,
 "duration": 0.125902891159058,
 "processing": 0.0892560482025146,
 "date_start": "2024-06-15T17:42:30+00:00",
 "date_finish": "2024-06-15T17:42:30+00:00",
 "operating_reset_at": 1718473950,
 "operating": 0
 }
}
```
