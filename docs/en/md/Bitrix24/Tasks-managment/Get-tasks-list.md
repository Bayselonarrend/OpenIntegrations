﻿---
sidebar_position: 2
---

# Get tasks list
 Get tasks list (50 at one response max))



`Function GetTasksList(Val URL, Val Filter = "", Val Indent = 0, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | Filter | --filter | Structure of KeyAndValue | Structure of task filter (see GetTaskFieldsStructure) |
  | Indent | --offset | Number, String | Offset of tasks list |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [tasks.task.list](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_list.php)
:::
<br/>


```bsl title="Code example"
    // Full filter structure you can find at GetTasksFilterStructure method
    Filter = New Structure;
    Filter.Insert("CREATED_BY" , 1);
    Filter.Insert("RESPONSIBLE_ID", 10);

    Indent = 1;
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.GetTasksList(URL, Filter);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetTasksList(URL, , Indent, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetTasksList --url "b24-ar17wx.bitrix24.by" --filter %filter% --offset "1" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "tasks": [
   {
    "id": "268",
    "parentId": null,
    "title": "Другой заголовок задачи",
    "description": "Другое описание задачи",
    "mark": null,
    "priority": "1",
    "multitask": "N",
    "notViewed": "N",
    "replicate": "N",
    "stageId": "0",
    "createdBy": "1",
    "createdDate": "2024-07-03T16:21:01+03:00",
    "responsibleId": "10",
    "changedBy": "1",
    "changedDate": "2024-07-03T16:21:14+03:00",
    "statusChangedBy": "1",
    "closedBy": "0",
    "closedDate": null,
    "activityDate": "2024-07-04T20:03:10+03:00",
    "dateStart": "2024-07-03T16:21:12+03:00",
    "deadline": "2024-07-04T16:21:00+03:00",
    "startDatePlan": null,
    "endDatePlan": null,
    "guid": "{29e9893d-226b-43a1-80bb-60af6434070f}",
    "xmlId": null,
    "commentsCount": "4",
    "serviceCommentsCount": "4",
    "allowChangeDeadline": "N",
    "allowTimeTracking": "N",
    "taskControl": "N",
    "addInReport": "N",
    "forkedByTemplateId": null,
    "timeEstimate": "0",
    "timeSpentInLogs": null,
    "matchWorkTime": "N",
    "forumTopicId": "258",
    "forumId": "11",
    "siteId": "s1",
    "subordinate": "N",
    "exchangeModified": null,
    "exchangeId": null,
    "outlookVersion": "9",
    "viewedDate": "2024-07-04T20:03:10+03:00",
    "sorting": "1024.0000000",
    "durationFact": null,
    "isMuted": "N",
    "isPinned": "N",
    "isPinnedInGroup": "N",
    "flowId": null,
    "descriptionInBbcode": "Y",
    "status": "2",
    "statusChangedDate": "2024-07-03T16:21:14+03:00",
    "durationPlan": null,
    "durationType": "days",
    "favorite": "N",
    "groupId": "0",
    "auditors": [],
    "accomplices": [],
    "newCommentsCount": 0,
    "group": [],
    "creator": {
     "id": "1",
     "name": "Антон Титовец",
     "link": "/company/personal/user/1/",
     "icon": "https://b24-ar17wx.bitrix24.by/b28528874/resize_cache/30/c0120a8d7c10d63c83e32398d1ec4d9e/main/d7e/d7e99cf556e4ab676463dae2c00ddfbb/a7e0af6899300e3c684caeca5c334d81.jpg",
     "workPosition": null
    },
    "responsible": {
     "id": "10",
     "name": "Techno Pizza",
     "link": "/company/personal/user/10/",
     "icon": "/bitrix/images/tasks/default_avatar.png",
     "workPosition": null
    },
    "accomplicesData": [],
    "auditorsData": [],
    "subStatus": "-1"
   },
   {
    "id": "270",
    "parentId": null,
    "title": "Другой заголовок задачи",
    "description": "Другое описание задачи",
    "mark": null,
    "priority": "1",
    "multitask": "N",
    "notViewed": "N",
    "replicate": "N",
    "stageId": "0",
    "createdBy": "1",
    "createdDate": "2024-07-03T16:21:02+03:00",
    "responsibleId": "10",
    "changedBy": "1",
    "changedDate": "2024-07-03T16:21:14+03:00",
    "statusChangedBy": "1",
    "closedBy": "0",
    "closedDate": null,
    "activityDate": "2024-07-04T20:03:10+03:00",
    "dateStart": "2024-07-03T16:21:13+03:00",
    "deadline": "2024-07-04T16:21:00+03:00",
    "startDatePlan": null,
    "endDatePlan": null,
    "guid": "{c8004012-7ca9-42da-b985-a1c0e90a285a}",
    "xmlId": null,
    "commentsCount": "4",
    "serviceCommentsCount": "4",
    "allowChangeDeadline": "N",
    "allowTimeTracking": "N",
    "taskControl": "N",
    "addInReport": "N",
    "forkedByTemplateId": null,
    "timeEstimate": "0",
    "timeSpentInLogs": null,
    "matchWorkTime": "N",
    "forumTopicId": "260",
    "forumId": "11",
    "siteId": "s1",
    "subordinate": "N",
    "exchangeModified": null,
    "exchangeId": null,
    "outlookVersion": "9",
    "viewedDate": "2024-07-04T20:03:10+03:00",
    "sorting": null,
    "durationFact": null,
    "isMuted": "N",
    "isPinned": "N",
    "isPinnedInGroup": "N",
    "flowId": null,
    "descriptionInBbcode": "Y",
    "status": "2",
    "statusChangedDate": "2024-07-03T16:21:14+03:00",
    "durationPlan": null,
    "durationType": "days",
    "favorite": "N",
    "groupId": "0",
    "auditors": [],
    "accomplices": [],
    "newCommentsCount": 0,
    "group": [],
    "creator": {
     "id": "1",
     "name": "Антон Титовец",
     "link": "/company/personal/user/1/",
     "icon": "https://b24-ar17wx.bitrix24.by/b28528874/resize_cache/30/c0120a8d7c10d63c83e32398d1ec4d9e/main/d7e/d7e99cf556e4ab676463dae2c00ddfbb/a7e0af6899300e3c684caeca5c334d81.jpg",
     "workPosition": null
    },
...
```
