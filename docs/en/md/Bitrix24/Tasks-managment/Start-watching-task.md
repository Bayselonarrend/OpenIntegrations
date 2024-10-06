---
sidebar_position: 14
---

# Start watching a task
 Start watching a task by ID



`Function StartWatchingTask(Val URL, Val TaskID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | Number, String | Task ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [tasks.task.startwatch](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_startwatch.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    TaskID = "2262";

    Result = OPI_Bitrix24.StartWatchingTask(URL, TaskID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";
    TaskID = "2264";

    Result = OPI_Bitrix24.StartWatchingTask(URL, TaskID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 StartWatchingTask --url "b24-ar17wx.bitrix24.by" --task "1080" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "task": {
   "id": "2318",
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
   "createdDate": "2024-10-05T18:05:13+03:00",
   "responsibleId": "570",
   "changedBy": "1",
   "changedDate": "2024-10-05T18:05:25+03:00",
   "statusChangedBy": "1",
   "closedBy": "0",
   "closedDate": null,
   "activityDate": "2024-10-05T18:05:24+03:00",
   "dateStart": "2024-10-05T18:05:25+03:00",
   "deadline": "2024-10-06T21:05:00+03:00",
   "startDatePlan": "2024-10-05T18:05:13+03:00",
   "endDatePlan": "2024-10-06T00:00:00+03:00",
   "guid": "{d951b0ff-fd4d-40a2-814f-85810a029bad}",
   "xmlId": null,
   "commentsCount": "3",
   "serviceCommentsCount": "3",
   "allowChangeDeadline": "N",
   "allowTimeTracking": "N",
   "taskControl": "N",
   "addInReport": "N",
   "forkedByTemplateId": null,
   "timeEstimate": "0",
   "timeSpentInLogs": null,
   "matchWorkTime": "N",
   "forumTopicId": "1616",
   "forumId": "11",
   "siteId": "s1",
   "subordinate": "N",
   "exchangeModified": null,
   "exchangeId": null,
   "outlookVersion": "9",
   "viewedDate": "2024-10-05T18:05:24+03:00",
   "sorting": null,
   "durationFact": null,
   "isMuted": "N",
   "isPinned": "N",
   "isPinnedInGroup": "N",
   "flowId": null,
   "descriptionInBbcode": "Y",
   "status": "3",
   "statusChangedDate": "2024-10-05T18:05:25+03:00",
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
    "id": "570",
    "name": "Олег Лама",
    "link": "/company/personal/user/570/",
    "icon": "/bitrix/images/tasks/default_avatar.png",
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
    "start": false,
    "pause": true,
    "delegate": true,
    "remove": true,
    "edit": true,
    "defer": false,
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
  "start": 1728140725.51284,
  "finish": 1728140725.69395,
  "duration": 0.181113004684448,
  "processing": 0.155539989471436,
  "date_start": "2024-10-05T18:05:25+03:00",
  "date_finish": "2024-10-05T18:05:25+03:00",
  "operating_reset_at": 1728141325,
  "operating": 0.155516147613525
 }
}
```
