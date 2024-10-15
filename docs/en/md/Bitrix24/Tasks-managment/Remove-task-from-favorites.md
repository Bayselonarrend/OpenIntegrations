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
    TaskID = "2416";

    Result = OPI_Bitrix24.RemoveTaskFromFavorites(URL, TaskID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "49e20867006e9f06006b12e400000001000...";
    TaskID = "2418";

    Result = OPI_Bitrix24.RemoveTaskFromFavorites(URL, TaskID, Token);
```
 



```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728454777.3337,
  "finish": 1728454777.3811,
  "duration": 0.0473968982696533,
  "processing": 0.0112500190734863,
  "date_start": "2024-10-09T09:19:37+03:00",
  "date_finish": "2024-10-09T09:19:37+03:00",
  "operating_reset_at": 1728455377,
  "operating": 0
 }
}
```
