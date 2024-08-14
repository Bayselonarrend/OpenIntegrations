---
sidebar_position: 18
---

# Remove task from favorites list
 Delete task from favorites list



`Function RemoveTaskFromFavorites(Val URL, Val TaskID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | Number, String | Task ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [tasks.task.favorite.remove](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_favorite_remove.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    TaskID = "1254";

    Result = OPI_Bitrix24.RemoveTaskFromFavorites(URL, TaskID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "7a63bc66006e9f06006b12e400000001000...";
    TaskID = "1256";

    Result = OPI_Bitrix24.RemoveTaskFromFavorites(URL, TaskID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 RemoveTaskFromFavorites --url "b24-ar17wx.bitrix24.by" --task "1080" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": true,
  "time": {
  "start": 1718569735.08926,
  "finish": 1718569735.1282,
  "duration": 0.0389459133148193,
  "processing": 0.00808191299438476,
  "date_start": "2024-06-16T20:28:55+00:00",
  "date_finish": "2024-06-16T20:28:55+00:00",
  "operating_reset_at": 1718570335,
  "operating": 0
  }
  }
```
