---
sidebar_position: 3
---

# Create task
 Create new task by fields structure (see GetTaskFieldsStructure)



`Function CreateTask(Val URL, Val FieldsStructure, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FieldsStructure | --fields | Structure of KeyAndValue | Task fields structure (see GetTaskFieldsStructure) |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [tasks.task.add](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_add.php)
:::
<br/>


```bsl title="Code example"
    // The complete structure of the fields can be obtained by the GetTaskFieldsStructure() function()

    CurrentDate = OPI_Tools.GetCurrentDate();
    Hour        = 3600;
    Day         = 24;
    Responsible = 1;

    TaskData = New Structure;
    TaskData.Insert("TITLE"         , "New task");
    TaskData.Insert("DESCRIPTION"   , "New task description");
    TaskData.Insert("PRIORITY"      , "2");
    TaskData.Insert("DEADLINE"      , CurrentDate + Hour * Day);
    TaskData.Insert("RESPONSIBLE_ID", Responsible);

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.CreateTask(URL, TaskData);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "ec4dc366006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.CreateTask(URL, TaskData, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 CreateTask --url "b24-ar17wx.bitrix24.by" --fields %fields% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": {
  "task": {
  "id": "110",
  "parentId": null,
  "title": "New task",
  "description": "New task description",
  "mark": null,
  "priority": "2",
  "multitask": "N",
  "notViewed": "N",
  "replicate": "N",
  "stageId": "0",
  "createdBy": "1",
  "createdDate": "2024-06-15T17:42:04+00:00",
  "responsibleId": "1",
  "changedBy": "1",
  "changedDate": "2024-06-15T17:42:04+00:00",
  "statusChangedBy": null,
  "closedBy": null,
  "closedDate": null,
  "activityDate": "2024-06-15T17:42:04+00:00",
  "dateStart": null,
  "deadline": "2024-06-16T17:42:00+00:00",
  "startDatePlan": null,
  "endDatePlan": null,
  "guid": "{8d5b2535-b856-4da0-8e67-df7eb35c1add}",
  "xmlId": null,
  "commentsCount": null,
  "serviceCommentsCount": null,
  "allowChangeDeadline": "N",
  "allowTimeTracking": "N",
  "taskControl": "N",
  "addInReport": "N",
  "forkedByTemplateId": null,
  "timeEstimate": "0",
  "timeSpentInLogs": null,
  "matchWorkTime": "N",
  "forumTopicId": null,
  "forumId": null,
  "siteId": "s1",
  "subordinate": "N",
  "exchangeModified": null,
  "exchangeId": null,
  "outlookVersion": "1",
  "viewedDate": null,
  "sorting": null,
  "durationFact": null,
  "isMuted": "N",
  "isPinned": "N",
  "isPinnedInGroup": "N",
  "flowId": null,
  "descriptionInBbcode": "Y",
  "status": "2",
  "statusChangedDate": "2024-06-15T17:42:04+00:00",
  "durationPlan": null,
  "durationType": "days",
  "favorite": "N",
  "groupId": "0",
  "auditors": [],
  "accomplices": [],
  "checklist": [],
  "group": [],
  "creator": {
  "id": "1",
  "name": "Anton Titovets",
  "link": "/company/personal/user/1/",
  "icon": "https://b24-ar17wx.bitrix24.by/b28528874/resize_cache/30/c0120a8d7c10d63c83e32398d1ec4d9e/main/d7e/d7e99cf556e4ab676463dae2c00ddfbb/a7e0af6899300e3c684caeca5c334d81.jpg",
  "workPosition": null
  },
  "responsible": {
  "id": "1",
  "name": "Anton Titovets",
  "link": "/company/personal/user/1/",
  "icon": "https://b24-ar17wx.bitrix24.by/b28528874/resize_cache/30/c0120a8d7c10d63c83e32398d1ec4d9e/main/d7e/d7e99cf556e4ab676463dae2c00ddfbb/a7e0af6899300e3c684caeca5c334d81.jpg",
  "workPosition": null
  },
  "accomplicesData": [],
  "auditorsData": [],
  "newCommentsCount": 0,
  "action": {
  "accept": false,
  "decline": false,
  "complete": true,
  "approve": false,
  "disapprove": false,
  "start": true,
  "pause": false,
  "delegate": true,
  "remove": true,
  "edit": true,
  "defer": true,
  "renew": false,
  "create": true,
  "changeDeadline": true,
  "checklistAddItems": true,
  "addFavorite": true,
  "deleteFavorite": false,
  "rate": true,
  "edit.originator": false,
  "checklist.reorder": true,
  "elapsedtime.add": true,
  "dayplan.timer.toggle": false,
  "edit.plan": true,
  "checklist.add": true,
  "favorite.add": true,
  "favorite.delete": false
  },
  "checkListTree": {
  "nodeId": 0,
  "fields": {
  "id": null,
  "copiedId": null,
  "entityId": null,
  "userId": 1,
  "createdBy": null,
  "parentId": null,
  "title": "",
  "sortIndex": null,
  "displaySortIndex": "",
  "isComplete": false,
  "isImportant": false,
  "completedCount": 0,
  "members": [],
  "attachments": []
  },
  "action": [],
  "descendants": []
  },
  "checkListCanAdd": true
  }
  },
  "time": {
  "start": 1718473324.36745,
  "finish": 1718473324.48918,
  "duration": 0.121729135513306,
  "processing": 0.0939490795135498,
  "date_start": "2024-06-15T17:42:04+00:00",
  "date_finish": "2024-06-15T17:42:04+00:00",
  "operating_reset_at": 1718473924,
  "operating": 0
  }
  }
```
