---
sidebar_position: 23
---

# Create tasks dependencies
 Creates the dependency of one task to another



`Function CreateTasksDependencies(Val URL, Val FromID, Val DestinationID, Val LinkType, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FromID | --taskfrom | String, Number | From task ID |
  | DestinationID | --taskto | String, Number | To task ID |
  | LinkType | --linktype | String, Number | Link type: 0 start>start, 1 start>finish, 2 finish>start, 3 finish>finish |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.dependence.add](https://dev.1c-bitrix.ru/rest_help/tasks/task/dependence/task_dependence_add.php)
:::
<br/>


```bsl title="Code example"
    FromID        = "2446";
    DestinationID = "2448";
    LinkType      = 0;

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.CreateTasksDependencies(URL, FromID, DestinationID, LinkType);

    FromID        = "2448";
    DestinationID = "2446";
    LinkType      = 2;

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "21750a67006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.CreateTasksDependencies(URL, FromID, DestinationID, LinkType, Token);
```
 



```json title="Result"
{
 "result": [],
 "time": {
  "start": 1728454774.59977,
  "finish": 1728454774.6891,
  "duration": 0.0893309116363525,
  "processing": 0.0593829154968262,
  "date_start": "2024-10-09T09:19:34+03:00",
  "date_finish": "2024-10-09T09:19:34+03:00",
  "operating_reset_at": 1728455374,
  "operating": 0
 }
}
```
