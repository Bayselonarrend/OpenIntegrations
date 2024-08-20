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
    TaskID = "1394";

    Result = OPI_Bitrix24.AddTaskToFavorites(URL, TaskID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "ec4dc366006e9f06006b12e400000001000...";
    TaskID = "1396";

    Result = OPI_Bitrix24.AddTaskToFavorites(URL, TaskID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 AddTaskToFavorites --url "b24-ar17wx.bitrix24.by" --task "1080" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": true,
  "time": {
  "start": 1718569733.98858,
  "finish": 1718569734.02857,
  "duration": 0.0399899482727051,
  "processing": 0.00951814651489258,
  "date_start": "2024-06-16T20:28:53+00:00",
  "date_finish": "2024-06-16T20:28:54+00:00",
  "operating_reset_at": 1718570334,
  "operating": 0
  }
  }
```
