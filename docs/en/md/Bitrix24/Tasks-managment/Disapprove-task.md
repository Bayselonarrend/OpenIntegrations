---
sidebar_position: 8
---

# Disapprove task
 Disapprove task by ID



`Function DisapproveTask(Val URL, Val TaskID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | Number, String | Task ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [tasks.task.disapprove](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_disapprove.php)
:::
<br/>


```bsl title="Code example"
  URL    = FunctionParameters["Bitrix24_URL"];
  TaskID = FunctionParameters["Bitrix24_HookTaskID"];
  
  Result = OPI_Bitrix24.DisapproveTask(URL, TaskID);
  
  OPI_TestDataRetrieval.WriteLog(Result, "DisapproveTask (wh)", "Bitrix24");
  
  URL    = FunctionParameters["Bitrix24_Domain"];
  Token  = FunctionParameters["Bitrix24_Token"];
  TaskID = FunctionParameters["Bitrix24_TaskID"];
  
  Result = OPI_Bitrix24.DisapproveTask(URL, TaskID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 DisapproveTask --url "b24-ar17wx.bitrix24.by" --task "1080" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "error": 1048582,
  "error_description": "Action on the task is not allowed"
  }
```
