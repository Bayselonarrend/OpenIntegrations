---
sidebar_position: 3
---

# Add comment to task
 Create new comment to the task



`Function AddTaskComment(Val URL, Val TaskID, Val Text, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | Number, String | Task ID |
  | Text | --text | String | Comment text |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.commentitem.add](https://dev.1c-bitrix.ru/rest_help/tasks/task/commentitem/add.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    TaskID = "2108";

    Text = "Task impossible, let's split up";

    Result = OPI_Bitrix24.AddTaskComment(URL, TaskID, Text);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Text = "Task uninpossible, don't split up";

    Result = OPI_Bitrix24.AddTaskComment(URL, TaskID, Text, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 AddTaskComment --url "b24-ar17wx.bitrix24.by" --task "1082" --text "Task uninpossible, don't split up" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": 5770,
 "time": {
  "start": 1728140735.62964,
  "finish": 1728140735.79398,
  "duration": 0.164332866668701,
  "processing": 0.13733696937561,
  "date_start": "2024-10-05T18:05:35+03:00",
  "date_finish": "2024-10-05T18:05:35+03:00",
  "operating_reset_at": 1728141335,
  "operating": 0.137306213378906
 }
}
```
