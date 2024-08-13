---
sidebar_position: 5
---

# Delete custom task field
 Deletes a custom task field



`Function DeleteCustomTaskField(Val URL, Val FieldID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FieldID | --fieldid | String, Number | Field ID for deletion |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.item.userfield.delete](https://dev.1c-bitrix.ru/rest_help/tasks/task/userfield/delete.php)
:::
<br/>


```bsl title="Code example"
  URL     = FunctionParameters["Bitrix24_URL"];
  FieldID = FunctionParameters["Bitrix24_HookTaskFieldID"];
  
  Result = OPI_Bitrix24.DeleteCustomTaskField(URL, FieldID);
  
  URL     = FunctionParameters["Bitrix24_Domain"];
  Token   = FunctionParameters["Bitrix24_Token"];
  FieldID = FunctionParameters["Bitrix24_TaskFieldID"];
  
  Result = OPI_Bitrix24.DeleteCustomTaskField(URL, FieldID, );
```



```sh title="CLI command example"
    
  oint bitrix24 DeleteCustomTaskField --url "b24-ar17wx.bitrix24.by" --fieldid "257" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": true,
  "time": {
  "start": 1722114801.22925,
  "finish": 1722114801.26696,
  "duration": 0.0377130508422852,
  "processing": 0.0185980796813965,
  "date_start": "2024-07-27T21:13:21+00:00",
  "date_finish": "2024-07-27T21:13:21+00:00",
  "operating_reset_at": 1722115401,
  "operating": 0
  }
  }
```
