---
sidebar_position: 20
---

# Check task acesses for users
 Checks the availability of the task for users



`Function CheckTaskAccesses(Val URL, Val TaskID, Val Users = "", Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | Number, String | Task ID |
  | Users | --users | Array of String | User IDs for access checking |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [tasks.task.getaccess](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_getaccess.php)
:::
<br/>


```bsl title="Code example"
    ArrayOfUsers = New Array;
    ArrayOfUsers.Add("1");
    ArrayOfUsers.Add("10");

    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
    TaskID = "1078";

    Result = OPI_Bitrix24.CheckTaskAccesses(URL, TaskID, ArrayOfUsers);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "fe3fa966006e9f06006b12e400000001000...";
    TaskID = "1080";

    Result = OPI_Bitrix24.CheckTaskAccesses(URL, TaskID, ArrayOfUsers, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 CheckTaskAccesses --url "b24-ar17wx.bitrix24.by" --task "1080" --users %users% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
  {
  "result": {
  "allowedActions": {
  "1": {
  "ACCEPT": false,
  "DECLINE": false,
  "COMPLETE": true,
  "APPROVE": false,
  "DISAPPROVE": false,
  "START": true,
  "PAUSE": false,
  "DELEGATE": true,
  "REMOVE": true,
  "EDIT": true,
  "DEFER": true,
  "RENEW": false,
  "CREATE": true,
  "CHANGE_DEADLINE": true,
  "CHECKLIST_ADD_ITEMS": true,
  "ADD_FAVORITE": true,
  "DELETE_FAVORITE": false,
  "RATE": true,
  "EDIT.ORIGINATOR": false,
  "CHECKLIST.REORDER": true,
  "ELAPSEDTIME.ADD": true,
  "DAYPLAN.TIMER.TOGGLE": false,
  "EDIT.PLAN": true,
  "CHECKLIST.ADD": true,
  "FAVORITE.ADD": true,
  "FAVORITE.DELETE": false
  },
  "10": {
  "ACCEPT": false,
  "DECLINE": false,
  "COMPLETE": true,
  "APPROVE": false,
  "DISAPPROVE": false,
  "START": true,
  "PAUSE": false,
  "DELEGATE": true,
  "REMOVE": false,
  "EDIT": false,
  "DEFER": true,
  "RENEW": false,
  "CREATE": true,
  "CHANGE_DEADLINE": false,
  "CHECKLIST_ADD_ITEMS": true,
  "ADD_FAVORITE": true,
  "DELETE_FAVORITE": false,
  "RATE": false,
  "EDIT.ORIGINATOR": false,
  "CHECKLIST.REORDER": false,
  "ELAPSEDTIME.ADD": true,
  "DAYPLAN.TIMER.TOGGLE": false,
  "EDIT.PLAN": false,
  "CHECKLIST.ADD": true,
  "FAVORITE.ADD": true,
  "FAVORITE.DELETE": false
  }
  }
  },
  "time": {
  "start": 1720017732.79312,
  "finish": 1720017732.85673,
  "duration": 0.0636129379272461,
  "processing": 0.0308799743652344,
  "date_start": "2024-07-03T14:42:12+00:00",
  "date_finish": "2024-07-03T14:42:12+00:00",
  "operating_reset_at": 1720018332,
  "operating": 0
  }
  }

```
