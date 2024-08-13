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
    FromID        = "1078";
    DestinationID = "1080";
    LinkType      = 0;

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";

    Result = OPI_Bitrix24.CreateTasksDependencies(URL, FromID, DestinationID, LinkType);

    FromID        = "1080";
    DestinationID = "1078";
    LinkType      = 2;

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "fe3fa966006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.CreateTasksDependencies(URL, FromID, DestinationID, LinkType, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 CreateTasksDependencies --url "b24-ar17wx.bitrix24.by" --taskfrom "1080" --taskto "1078" --linktype "2" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
  {
  "result": [],
  "time": {
  "start": 1720186655.56394,
  "finish": 1720186656.29235,
  "duration": 0.728404998779297,
  "processing": 0.692660093307495,
  "date_start": "2024-07-05T13:37:35+00:00",
  "date_finish": "2024-07-05T13:37:36+00:00",
  "operating_reset_at": 1720187255,
  "operating": 0.692637920379639
  }
  }

```
