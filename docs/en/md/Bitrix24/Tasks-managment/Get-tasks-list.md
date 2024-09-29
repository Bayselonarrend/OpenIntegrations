---
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
    Token = "c3abf666006e9f06006b12e400000001000...";

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
  "id": "2",
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
  "createdDate": "2024-06-15T12:55:13+00:00",
  "responsibleId": "1",
  "changedBy": "1",
  "changedDate": "2024-06-15T12:55:13+00:00",
  "statusChangedBy": null,
  "closedBy": null,
  "closedDate": null,
  "activityDate": "2024-06-15T12:55:13+00:00",
  "dateStart": null,
  "deadline": "2024-06-25T12:55:00+00:00",
  "startDatePlan": null,
  "endDatePlan": null,
  "guid": "{9f511c6f-eca4-4cc2-9164-90b2b86f0d29}",
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
  "viewedDate": "2024-06-15T16:13:41+00:00",
  "sorting": null,
  "durationFact": null,
  "isMuted": "N",
  "isPinned": "N",
  "isPinnedInGroup": "N",
  "flowId": null,
  "descriptionInBbcode": "Y",
  "status": "2",
  "statusChangedDate": "2024-06-15T12:55:13+00:00",
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
  "subStatus": "2"
  },
  {
  "id": "4",
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
  "createdDate": "2024-06-15T13:05:37+00:00",
  "responsibleId": "1",
  "changedBy": "1",
  "changedDate": "2024-06-15T13:05:37+00:00",
  "statusChangedBy": null,
  "closedBy": null,
  "closedDate": null,
  "activityDate": "2024-06-16T13:25:27+00:00",
  "dateStart": null,
  "deadline": "2024-06-16T13:05:00+00:00",
  "startDatePlan": null,
  "endDatePlan": null,
  "guid": "{c496405d-166b-4ac9-af68-abe59e47030f}",
  "xmlId": null,
  "commentsCount": "1",
  "serviceCommentsCount": "1",
  "allowChangeDeadline": "N",
  "allowTimeTracking": "N",
  "taskControl": "N",
  "addInReport": "N",
  "forkedByTemplateId": null,
  "timeEstimate": "0",
  "timeSpentInLogs": null,
  "matchWorkTime": "N",
  "forumTopicId": "58",
  "forumId": "11",
  "siteId": "s1",
  "subordinate": "N",
  "exchangeModified": null,
  "exchangeId": null,
  "outlookVersion": "1",
  "viewedDate": "2024-06-16T13:25:27+00:00",
  "sorting": null,
  "durationFact": null,
  "isMuted": "N",
  "isPinned": "N",
  "isPinnedInGroup": "N",
  "flowId": null,
  "descriptionInBbcode": "Y",
  "status": "2",
  "statusChangedDate": "2024-06-15T13:05:37+00:00",
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
  "name": "Anton Titovets",
  "link": "/company/personal/user/1/",
  "icon": "https://b24-ar17wx.bitrix24.by/b28528874/resize_cache/30/c0120a8d7c10d63c83e32398d1ec4d9e/main/d7e/d7e99cf556e4ab676463dae2c00ddfbb/a7e0af6899300e3c684caeca5c334d81.jpg",
  "workPosition": null
  },
...
```
