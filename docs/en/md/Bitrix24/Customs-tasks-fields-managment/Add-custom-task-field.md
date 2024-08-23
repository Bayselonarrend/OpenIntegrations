---
sidebar_position: 2
---

# Add custom task field
 Adds a new custom field to be added to the task



`Function AddCustomTaskField(Val URL, Val Type, Val Name, Val ExternalID = "", Val Title = "", Val Signature = "", Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | Type | --type | String | Field type: string, double, date, boolean |
  | Name | --fieldname | String | Text identifier (name) of the field |
  | ExternalID | --externalid | String | Text identifier for external integration |
  | Title | --title | String | Field title |
  | Signature | --label | Structure of KeyAndValue | Form label. Key: en or ru, Value: Lable text |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.item.userfield.add](https://dev.1c-bitrix.ru/rest_help/tasks/task/userfield/add.php)
:::
<br/>


```bsl title="Code example"
    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Type = "date";
    Name = "BIRTHDAY_FIELD";

    Result = OPI_Bitrix24.AddCustomTaskField(URL, Type, Name);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "6476c766006e9f06006b12e400000001000...";

    Type       = "string";
    Name       = "TEXT_FIELD";
    ExternalID = "BITRIX_TEXT_FIELD";
    Title      = "Text field";
    Signature  = New Structure("en,ru", "Some field", "Nekotoroe pole");

    Result = OPI_Bitrix24.AddCustomTaskField(URL, Type, Name, ExternalID, Title, Signature, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 AddCustomTaskField --url "b24-ar17wx.bitrix24.by" --type "string" --fieldname "TEXT_FIELD" --externalid "BITRIX_TEXT_FIELD" --title "Text field" --label %label% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": 261,
  "time": {
  "start": 1722114794.52732,
  "finish": 1722114794.59725,
  "duration": 0.0699310302734375,
  "processing": 0.0470340251922607,
  "date_start": "2024-07-27T21:13:14+00:00",
  "date_finish": "2024-07-27T21:13:14+00:00",
  "operating_reset_at": 1722115394,
  "operating": 0
  }
  }
```
