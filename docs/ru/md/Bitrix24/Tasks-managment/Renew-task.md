---
sidebar_position: 10
---

# Возобновить задачу
 Возвращает в работу задачу по ID



`Функция ВозобновитьЗадачу(Знач URL, Знач IDЗадачи, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЗадачи | --task | Число,Строка | ID задачи |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [tasks.task.renew](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_renew.php)
:::
<br/>


```bsl title="Пример кода"
    URL      = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDЗадачи = "2446";

    Результат = OPI_Bitrix24.ВозобновитьЗадачу(URL, IDЗадачи);

    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "21750a67006e9f06006b12e400000001000...";
    IDЗадачи  = "2448";

    Результат = OPI_Bitrix24.ВозобновитьЗадачу(URL, IDЗадачи, Токен);
```
    



```json title="Результат"
{
 "result": {
  "task": {
   "id": "2378",
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
   "createdDate": "2024-10-08T20:48:35+03:00",
   "responsibleId": "594",
   "changedBy": "1",
   "changedDate": "2024-10-08T20:48:46+03:00",
   "statusChangedBy": "1",
   "closedBy": "0",
   "closedDate": null,
   "activityDate": "2024-10-08T20:48:47+03:00",
   "dateStart": null,
   "deadline": "2024-10-09T23:48:00+03:00",
   "startDatePlan": "2024-10-08T20:48:35+03:00",
   "endDatePlan": "2024-10-09T00:00:00+03:00",
   "guid": "{037d66b0-f11d-4d50-bf02-0491fe52bea7}",
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
   "forumTopicId": "1652",
   "forumId": "11",
   "siteId": "s1",
   "subordinate": "N",
   "exchangeModified": null,
   "exchangeId": null,
   "outlookVersion": "7",
   "viewedDate": "2024-10-08T20:48:47+03:00",
   "sorting": null,
   "durationFact": null,
   "isMuted": "N",
   "isPinned": "N",
   "isPinnedInGroup": "N",
   "flowId": null,
   "descriptionInBbcode": "Y",
   "status": "2",
   "statusChangedDate": "2024-10-08T20:48:46+03:00",
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
    "id": "594",
    "name": "Oleg Lama",
    "link": "/company/personal/user/594/",
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
  "start": 1728409726.87713,
  "finish": 1728409727.23097,
  "duration": 0.353838920593262,
  "processing": 0.323814153671265,
  "date_start": "2024-10-08T20:48:46+03:00",
  "date_finish": "2024-10-08T20:48:47+03:00",
  "operating_reset_at": 1728410326,
  "operating": 0.32378888130188
 }
}
```
