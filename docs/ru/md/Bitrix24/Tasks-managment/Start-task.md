---
sidebar_position: 13
---

# Начать выполнение задачи
 Начинает выполнение задачи по ID



`Функция НачатьВыполнениеЗадачи(Знач URL, Знач IDЗадачи, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЗадачи | --task | Число,Строка | ID задачи |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [tasks.task.start](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_start.php)
:::
<br/>


```bsl title="Пример кода"
  URL      = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
  IDЗадачи = "720";
  
  Результат = OPI_Bitrix24.НачатьВыполнениеЗадачи(URL, IDЗадачи);
  
  URL       = "b24-ar17wx.bitrix24.by";
  Токен     = "adf89366006e9f06006b12e400000001000...";
  IDЗадачи  = "722";
  
  Результат = OPI_Bitrix24.НачатьВыполнениеЗадачи(URL, IDЗадачи, Токен);
```
	


```sh title="Пример команды CLI"
    
  oint bitrix24 НачатьВыполнениеЗадачи --url "b24-ar17wx.bitrix24.by" --task "170" --token "b9df7366006e9f06006b12e400000001000..."

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
   "changedDate": "2024-06-15T17:42:22+00:00",
   "statusChangedBy": "1",
   "closedBy": "0",
   "closedDate": null,
   "activityDate": "2024-06-15T17:42:21+00:00",
   "dateStart": "2024-06-15T17:42:22+00:00",
   "deadline": "2024-06-16T17:42:00+00:00",
   "startDatePlan": null,
   "endDatePlan": null,
   "guid": "{8d5b2535-b856-4da0-8e67-df7eb35c1add}",
   "xmlId": null,
   "commentsCount": "2",
   "serviceCommentsCount": "2",
   "allowChangeDeadline": "N",
   "allowTimeTracking": "N",
   "taskControl": "N",
   "addInReport": "N",
   "forkedByTemplateId": null,
   "timeEstimate": "0",
   "timeSpentInLogs": null,
   "matchWorkTime": "N",
   "forumTopicId": "44",
   "forumId": "11",
   "siteId": "s1",
   "subordinate": "N",
   "exchangeModified": null,
   "exchangeId": null,
   "outlookVersion": "6",
   "viewedDate": "2024-06-15T17:42:21+00:00",
   "sorting": null,
   "durationFact": null,
   "isMuted": "N",
   "isPinned": "N",
   "isPinnedInGroup": "N",
   "flowId": null,
   "descriptionInBbcode": "Y",
   "status": "3",
   "statusChangedDate": "2024-06-15T17:42:22+00:00",
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
  "start": 1718473342.85609,
  "finish": 1718473343.03046,
  "duration": 0.174365997314453,
  "processing": 0.140038967132568,
  "date_start": "2024-06-15T17:42:22+00:00",
  "date_finish": "2024-06-15T17:42:23+00:00",
  "operating_reset_at": 1718473942,
  "operating": 0.14000415802002
 }
}
```
