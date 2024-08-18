---
sidebar_position: 21
---

# Mute task
 Mute task by ID



`Function MuteTask(Val URL, Val TaskID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | Number, String | Task ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [tasks.task.mute](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/mute_unmute.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/ztbe...";
    TaskID = "1074";

    Result = OPI_Bitrix24.MuteTask(URL, TaskID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "c03fa966006e9f06006b12e400000001000...";
    TaskID = "1076";

    Result = OPI_Bitrix24.MuteTask(URL, TaskID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 MuteTask --url "b24-ar17wx.bitrix24.by" --task "1080" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": {
  "task": {
  "id": "290",
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
  "createdDate": "2024-07-03T14:41:38+00:00",
  "responsibleId": "1",
  "changedBy": "1",
  "changedDate": "2024-07-03T14:41:45+00:00",
  "statusChangedBy": null,
  "closedBy": null,
  "closedDate": null,
  "activityDate": "2024-07-03T14:41:38+00:00",
  "dateStart": null,
  "deadline": "2024-07-04T14:41:00+00:00",
  "startDatePlan": null,
  "endDatePlan": null,
  "guid": "{dca98bf4-187c-4489-ad23-8735dd49e2fc}",
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
  "outlookVersion": "2",
  "viewedDate": null,
  "sorting": null,
  "durationFact": null,
  "isMuted": "Y",
  "isPinned": "N",
  "isPinnedInGroup": "N",
  "flowId": null,
  "descriptionInBbcode": "Y",
  "status": "2",
  "statusChangedDate": "2024-07-03T14:41:45+00:00",
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
  "start": 1720017708.44201,
  "finish": 1720017708.51044,
  "duration": 0.0684309005737305,
  "processing": 0.0346000194549561,
  "date_start": "2024-07-03T14:41:48+00:00",
  "date_finish": "2024-07-03T14:41:48+00:00",
  "operating_reset_at": 1720018308,
  "operating": 0
  }
  }
```
