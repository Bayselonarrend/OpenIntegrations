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
  "start": 1728140720.99896,
  "finish": 1728140721.04303,
  "duration": 0.044064998626709,
  "processing": 0.0111420154571533,
  "date_start": "2024-10-05T18:05:20+03:00",
  "date_finish": "2024-10-05T18:05:21+03:00",
  "operating_reset_at": 1728141321,
  "operating": 0
 }
}
```
