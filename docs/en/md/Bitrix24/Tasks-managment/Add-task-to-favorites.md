---
sidebar_position: 17
---

# Add task to favorites list
 Add task to favorites list



`Function AddTaskToFavorites(Val URL, Val TaskID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | Number, String | Task ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [tasks.task.favorite.add](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_favorite_add.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    TaskID = "2262";

    Result = OPI_Bitrix24.AddTaskToFavorites(URL, TaskID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";
    TaskID = "2264";

    Result = OPI_Bitrix24.AddTaskToFavorites(URL, TaskID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 AddTaskToFavorites --url "b24-ar17wx.bitrix24.by" --task "1080" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728329094.20325,
  "finish": 1728329094.23837,
  "duration": 0.0351200103759766,
  "processing": 0.0089409351348877,
  "date_start": "2024-10-07T22:24:54+03:00",
  "date_finish": "2024-10-07T22:24:54+03:00",
  "operating_reset_at": 1728329694,
  "operating": 0
 }
}
```
