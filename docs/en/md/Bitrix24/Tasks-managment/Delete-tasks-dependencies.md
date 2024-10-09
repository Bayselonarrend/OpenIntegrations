---
sidebar_position: 24
---

# Delete tasks dependencies
 Removes the dependency of one task to another



`Function DeleteTasksDependencies(Val URL, Val FromID, Val DestinationID, Val LinkType, Val Token = "") Export`

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
Method at API documentation: [task.dependence.delete](https://dev.1c-bitrix.ru/rest_help/tasks/task/dependence/task_dependence_delete.php)
:::
<br/>


```bsl title="Code example"
    FromID        = "2262";
    DestinationID = "2264";
    LinkType      = 0;

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.DeleteTasksDependencies(URL, FromID, DestinationID, LinkType);

    FromID        = "2264";
    DestinationID = "2262";
    LinkType      = 2;

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.DeleteTasksDependencies(URL, FromID, DestinationID, LinkType, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 DeleteTasksDependencies --url %url% --taskfrom %taskfrom% --taskto %taskto% --linktype %linktype% --token %token%

```

```json title="Result"
{
 "result": [],
 "time": {
  "start": 1728454775.18853,
  "finish": 1728454775.22678,
  "duration": 0.0382490158081055,
  "processing": 0.0094759464263916,
  "date_start": "2024-10-09T09:19:35+03:00",
  "date_finish": "2024-10-09T09:19:35+03:00",
  "operating_reset_at": 1728455375,
  "operating": 0
 }
}
```
