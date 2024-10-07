---
sidebar_position: 4
---

# Изменить задачу
 Изменяет существующую задачу



`Функция ИзменитьЗадачу(Знач URL, Знач IDЗадачи, Знач СтруктураПолей, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЗадачи | --task | Число,Строка | ID задачи |
  | СтруктураПолей | --fields | Структура Из КлючИЗначение | Структура полей задачи |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [tasks.task.update](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_update.php)
:::
<br/>


```bsl title="Пример кода"
    // Полную структуру полей можно получить функцией ПолучитьСтруктуруЗадачи()

    СтруктураЗадачи = Новый Структура;
    СтруктураЗадачи.Вставить("TITLE"      , "Другой заголовок задачи");
    СтруктураЗадачи.Вставить("DESCRIPTION", "Другое описание задачи");
    СтруктураЗадачи.Вставить("PRIORITY"   , "1");

    URL      = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDЗадачи = "2262";

    Результат = OPI_Bitrix24.ИзменитьЗадачу(URL, IDЗадачи, СтруктураЗадачи);

    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "37d1fe66006e9f06006b12e400000001000...";
    IDЗадачи  = "2264";

    Результат = OPI_Bitrix24.ИзменитьЗадачу(URL, IDЗадачи, СтруктураЗадачи, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ИзменитьЗадачу --url "b24-ar17wx.bitrix24.by" --task "170" --fields %fields% --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "task": {
   "id": "2338",
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
   "createdDate": "2024-10-07T09:25:58+03:00",
   "responsibleId": "1",
   "changedBy": "1",
   "changedDate": "2024-10-07T09:26:05+03:00",
   "statusChangedBy": null,
   "closedBy": null,
   "closedDate": null,
   "activityDate": "2024-10-07T09:25:58+03:00",
   "dateStart": null,
   "deadline": "2024-10-08T12:25:00+03:00",
   "startDatePlan": "2024-10-07T09:25:58+03:00",
   "endDatePlan": "2024-10-08T00:00:00+03:00",
   "guid": "{9c264b5c-99e6-42b0-8599-9588aac807fd}",
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
   "statusChangedDate": "2024-10-07T09:26:05+03:00",
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
  "start": 1728282365.87155,
  "finish": 1728282366.10935,
  "duration": 0.237806081771851,
  "processing": 0.209103107452393,
  "date_start": "2024-10-07T09:26:05+03:00",
  "date_finish": "2024-10-07T09:26:06+03:00",
  "operating_reset_at": 1728282965,
  "operating": 0.209078073501587
 }
}
```
