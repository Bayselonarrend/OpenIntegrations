---
sidebar_position: 7
---

# Approve task
 Approve task by ID


*Function ApproveTask(Val URL, Val TaskID, Val Token = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | TaskID | --task | Number, String | Task ID |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

```bsl title="Code example"
	
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 TaskID = "168";
 
 Result = OPI_Bitrix24.ApproveTask(URL, TaskID);
 
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "b9df7366006e9f06006b12e400000001000...";
 TaskID = "170";
 
 Result = OPI_Bitrix24.ApproveTask(URL, TaskID, Token);
	
```

```sh title="CLI command example"
 
oint bitrix24 ApproveTask --url "b24-ar17wx.bitrix24.by" --task "170" --token "b9df7366006e9f06006b12e400000001000..."

```


```json title="Result"

{
 "result": {
 "task": {
 "id": "110",
 "title": "Another task title",
 "description": "Another task description",
 "descriptionInBbcode": "Y",
 "declineReason": "",
 "priority": "1",
 "notViewed": "N",
 "statusComplete": "2",
 "multitask": "N",
 "stageId": "0",
 "responsibleId": "1",
 "responsibleName": "Anton",
 "responsibleLastName": "Titovets",
 "responsibleSecondName": null,
 "responsibleLogin": "VKuser657846756",
 "responsibleWorkPosition": null,
 "responsiblePhoto": "30",
 "dateStart": null,
 "durationFact": null,
 "timeEstimate": "0",
 "timeSpentInLogs": null,
 "replicate": "N",
 "deadline": "2024-06-16T17:42:00+00:00",
 "deadlineOrig": "16.06.2024 20:42:00",
 "startDatePlan": null,
 "endDatePlan": null,
 "createdBy": "1",
 "createdByName": "Anton",
 "createdByLastName": "Titovets",
 "createdBySecondName": null,
 "createdByLogin": "VKuser657846756",
 "createdByWorkPosition": null,
 "createdByPhoto": "30",
 "createdDate": "2024-06-15T17:42:04+00:00",
 "changedBy": "1",
 "changedDate": "2024-06-15T17:42:17+00:00",
 "statusChangedBy": "1",
 "closedBy": "1",
 "closedDate": "2024-06-15T17:42:17+00:00",
 "activityDate": "2024-06-15T17:42:17+00:00",
 "guid": "{8d5b2535-b856-4da0-8e67-df7eb35c1add}",
 "xmlId": null,
 "mark": null,
 "allowChangeDeadline": "N",
 "allowTimeTracking": "N",
 "matchWorkTime": "N",
 "taskControl": "N",
 "addInReport": "N",
 "forumTopicId": "44",
 "parentId": null,
 "commentsCount": "1",
 "serviceCommentsCount": "1",
 "forumId": "11",
 "siteId": "s1",
 "subordinate": "N",
 "exchangeModified": null,
 "exchangeId": null,
 "outlookVersion": "4",
 "viewedDate": "2024-06-15T17:42:17+00:00",
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
 "statusChangedDate": "2024-06-15T17:42:17+00:00",
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
 "start": 1718473338.92487,
 "finish": 1718473338.9957,
 "duration": 0.0708270072937012,
 "processing": 0.0335841178894043,
 "date_start": "2024-06-15T17:42:18+00:00",
 "date_finish": "2024-06-15T17:42:18+00:00",
 "operating_reset_at": 1718473938,
 "operating": 0
 }
}

```
