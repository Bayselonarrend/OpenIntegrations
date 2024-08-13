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

```



```sh title="CLI command example"
    
  oint bitrix24 DeleteTasksDependencies --url %url% --taskfrom %taskfrom% --taskto %taskto% --linktype %linktype% --token %token%

```

```json title="Result"
  {
  "result": [],
  "time": {
  "start": 1720816479.3837,
  "finish": 1720816479.41872,
  "duration": 0.0350160598754883,
  "processing": 0.00787091255187988,
  "date_start": "2024-07-12T20:34:39+00:00",
  "date_finish": "2024-07-12T20:34:39+00:00",
  "operating_reset_at": 1720817079,
  "operating": 0
  }
  }

```
