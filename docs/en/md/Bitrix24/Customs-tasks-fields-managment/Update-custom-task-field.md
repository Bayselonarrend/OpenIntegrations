---
sidebar_position: 3
---

# Update custom task field
 Updates a custom task field data



`Function UpdateCustomTaskField(Val URL, Val FieldID, Val ExternalID = "", Val Title = "", Val Signature = "", Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FieldID | --fieldid | String, Number | Field ID for updating |
  | ExternalID | --externalid | String | Text identifier for external integration |
  | Title | --title | String | Field title |
  | Signature | --label | Structure of KeyAndValue | Form label. Key: en or ru, Value: Lable text |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.item.userfield.update](https://dev.1c-bitrix.ru/rest_help/tasks/task/userfield/update.php)
:::
<br/>


```bsl title="Code example"
  URL = FunctionParameters["Bitrix24_URL"];
  
  FieldID = FunctionParameters["Bitrix24_HookTaskFieldID"];
  Title   = "New title";
  
  Result = OPI_Bitrix24.UpdateCustomTaskField(URL, FieldID, , Title);
  
  URL   = FunctionParameters["Bitrix24_Domain"];
  Token = FunctionParameters["Bitrix24_Token"];
  
  FieldID    = FunctionParameters["Bitrix24_TaskFieldID"];
  ExternalID = "NEW_TEXT_FIELD";
  Signature  = New Structure("en,ru", "Updated field", "Izmenennoe pole");
  
  Result = OPI_Bitrix24.UpdateCustomTaskField(URL, FieldID, ExternalID, , Signature, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 UpdateCustomTaskField --url "b24-ar17wx.bitrix24.by" --fieldid "257" --externalid "NEW_TEXT_FIELD" --title %title% --label %label% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": true,
  "time": {
  "start": 1722114796.23423,
  "finish": 1722114796.26623,
  "duration": 0.0319931507110596,
  "processing": 0.0126721858978271,
  "date_start": "2024-07-27T21:13:16+00:00",
  "date_finish": "2024-07-27T21:13:16+00:00",
  "operating_reset_at": 1722115396,
  "operating": 0
  }
  }
```
