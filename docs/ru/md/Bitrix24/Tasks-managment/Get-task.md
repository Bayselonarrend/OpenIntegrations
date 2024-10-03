﻿---
sidebar_position: 1
---

# Получить задачу
 Получает задачу по ID



`Функция ПолучитьЗадачу(Знач URL, Знач IDЗадачи, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЗадачи | --task | Число,Строка | ID задачи |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [tasks.task.get](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_get.php)
:::
<br/>


```bsl title="Пример кода"
    URL      = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDЗадачи = "2262";

    Результат = OPI_Bitrix24.ПолучитьЗадачу(URL, IDЗадачи);

    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "37d1fe66006e9f06006b12e400000001000...";
    IDЗадачи  = "2264";

    Результат = OPI_Bitrix24.ПолучитьЗадачу(URL, IDЗадачи, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьЗадачу --url "b24-ar17wx.bitrix24.by" --task "170" --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "task": {
   "id": "110",
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
   "createdDate": "2024-06-15T17:42:04+00:00",
   "responsibleId": "1",
   "changedBy": "1",
   "changedDate": "2024-06-15T17:42:11+00:00",
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
   "outlookVersion": "2",
   "viewedDate": null,
   "sorting": null,
   "durationFact": null,
   "isMuted": "N",
   "isPinned": "N",
   "isPinnedInGroup": "N",
   "flowId": null,
   "descriptionInBbcode": "Y",
   "status": "2",
   "statusChangedDate": "2024-06-15T17:42:11+00:00",
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
  "start": 1718473333.14793,
  "finish": 1718473333.22076,
  "duration": 0.072829008102417,
  "processing": 0.0298500061035156,
  "date_start": "2024-06-15T17:42:13+00:00",
  "date_finish": "2024-06-15T17:42:13+00:00",
  "operating_reset_at": 1718473933,
  "operating": 0
 }
}
```
