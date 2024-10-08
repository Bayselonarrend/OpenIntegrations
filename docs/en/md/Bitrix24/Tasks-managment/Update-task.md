---
sidebar_position: 4
---

# Update task
 Update a task



`Function UpdateTask(Val URL, Val TaskID, Val FieldsStructure, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | Number, String | Task ID |
  | FieldsStructure | --fields | Structure of KeyAndValue | Task fields structure |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [tasks.task.update](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_update.php)
:::
<br/>


```bsl title="Code example"
    // The complete structure of the fields can be obtained by the GetTaskFieldsStructure() function()

    TaskData = New Structure;
    TaskData.Insert("TITLE"      , "Another task title");
    TaskData.Insert("DESCRIPTION", "Another task description");
    TaskData.Insert("PRIORITY"   , "1");

    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    TaskID = "2262";

    Result = OPI_Bitrix24.UpdateTask(URL, TaskID, TaskData);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";
    TaskID = "2264";

    Result = OPI_Bitrix24.UpdateTask(URL, TaskID, TaskData, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 UpdateTask --url "b24-ar17wx.bitrix24.by" --task "1080" --fields %fields% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "task": {
   "id": "2368",
   "parentId": null,
   "title": "Another task title",
   "description": "Another task description",
   "mark": null,
   "priority": "1",
   "multitask": "N",
   "notViewed": "N",
   "replicate": "N",
   "stageId": "0",
   "createdBy": "1",
   "createdDate": "2024-10-07T22:24:46+03:00",
   "responsibleId": "1",
   "changedBy": "1",
   "changedDate": "2024-10-07T22:24:53+03:00",
   "statusChangedBy": null,
   "closedBy": null,
   "closedDate": null,
   "activityDate": "2024-10-07T22:24:46+03:00",
   "dateStart": null,
   "deadline": "2024-10-09T01:24:00+03:00",
   "startDatePlan": "2024-10-07T22:24:46+03:00",
   "endDatePlan": "2024-10-08T00:00:00+03:00",
   "guid": "{26a945e8-1736-401b-858b-77917b7f7de5}",
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
   "outlookVersion": "3",
   "viewedDate": null,
   "sorting": null,
   "durationFact": null,
   "isMuted": "N",
   "isPinned": "N",
   "isPinnedInGroup": "N",
   "flowId": null,
   "descriptionInBbcode": "Y",
   "status": "2",
   "statusChangedDate": "2024-10-07T22:24:53+03:00",
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
    "name": "Антон Титовец",
    "link": "/company/personal/user/1/",
    "icon": "https://b24-ar17wx.bitrix24.by/b28528874/resize_cache/30/c0120a8d7c10d63c83e32398d1ec4d9e/main/d7e/d7e99cf556e4ab676463dae2c00ddfbb/a7e0af6899300e3c684caeca5c334d81.jpg",
    "workPosition": null
   },
   "responsible": {
    "id": "1",
    "name": "Антон Титовец",
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
  "start": 1728329093.16927,
  "finish": 1728329093.35068,
  "duration": 0.181410074234009,
  "processing": 0.154278039932251,
  "date_start": "2024-10-07T22:24:53+03:00",
  "date_finish": "2024-10-07T22:24:53+03:00",
  "operating_reset_at": 1728329693,
  "operating": 0.154258012771606
 }
}
```
