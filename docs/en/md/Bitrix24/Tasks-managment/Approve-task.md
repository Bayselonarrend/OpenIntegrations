---
sidebar_position: 7
---

# Approve task
 Approve task by ID



`Function ApproveTask(Val URL, Val TaskID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | Number, String | Task ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [tasks.task.approve](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_approve.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    TaskID = "2262";

    Result = OPI_Bitrix24.ApproveTask(URL, TaskID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";
    TaskID = "2264";

    Result = OPI_Bitrix24.ApproveTask(URL, TaskID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 ApproveTask --url "b24-ar17wx.bitrix24.by" --task "1080" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "task": {
   "id": "2318",
   "title": "Another task title",
   "description": "Another task description",
   "descriptionInBbcode": "Y",
   "declineReason": "",
   "priority": "1",
   "notViewed": "N",
   "statusComplete": "2",
   "multitask": "N",
   "stageId": "0",
   "responsibleId": "570",
   "responsibleName": "Олег",
   "responsibleLastName": "Лама",
   "responsibleSecondName": null,
   "responsibleLogin": "9094da21-a184-41d1-a16b-fcf56aef3ba3@exepmple.org",
   "responsibleWorkPosition": null,
   "responsiblePhoto": null,
   "dateStart": null,
   "durationFact": null,
   "timeEstimate": "0",
   "timeSpentInLogs": null,
   "replicate": "N",
   "deadline": "2024-10-06T21:05:00+03:00",
   "deadlineOrig": "06.10.2024 21:05:00",
   "startDatePlan": "2024-10-05T18:05:13+03:00",
   "endDatePlan": "2024-10-06T00:00:00+03:00",
   "createdBy": "1",
   "createdByName": "Антон",
   "createdByLastName": "Титовец",
   "createdBySecondName": null,
   "createdByLogin": "VKuser657846756",
   "createdByWorkPosition": null,
   "createdByPhoto": "30",
   "createdDate": "2024-10-05T18:05:13+03:00",
   "changedBy": "1",
   "changedDate": "2024-10-05T18:05:23+03:00",
   "statusChangedBy": "1",
   "closedBy": "1",
   "closedDate": "2024-10-05T18:05:23+03:00",
   "activityDate": "2024-10-05T18:05:23+03:00",
   "guid": "{d951b0ff-fd4d-40a2-814f-85810a029bad}",
   "xmlId": null,
   "mark": null,
   "allowChangeDeadline": "N",
   "allowTimeTracking": "N",
   "matchWorkTime": "N",
   "taskControl": "N",
   "addInReport": "N",
   "forumTopicId": "1616",
   "parentId": null,
   "commentsCount": "2",
   "serviceCommentsCount": "2",
   "forumId": "11",
   "siteId": "s1",
   "subordinate": "N",
   "exchangeModified": null,
   "exchangeId": null,
   "outlookVersion": "6",
   "viewedDate": "2024-10-05T18:05:23+03:00",
   "deadlineCounted": "0",
   "forkedByTemplateId": null,
   "sorting": null,
   "durationPlanSeconds": null,
   "durationTypeAll": "days",
   "scenarioName": [
    "default"
   ],
   "isRegular": "N",
   "flowId": null,
   "isMuted": "N",
   "isPinned": "N",
   "isPinnedInGroup": "N",
   "ufCrmTask": false,
   "ufTaskWebdavFiles": false,
   "ufMailMessage": null,
   "status": "5",
   "statusChangedDate": "2024-10-05T18:05:23+03:00",
   "durationPlan": null,
   "durationType": "days",
   "favorite": "N",
   "groupId": "0",
   "auditors": [],
   "accomplices": [],
   "tags": [],
   "checklist": [],
   "files": [],
   "dependsOn": [],
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
    "complete": false,
    "approve": false,
    "disapprove": false,
    "start": false,
    "pause": false,
    "delegate": false,
    "remove": true,
    "edit": true,
    "defer": false,
    "renew": true,
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
...
```
