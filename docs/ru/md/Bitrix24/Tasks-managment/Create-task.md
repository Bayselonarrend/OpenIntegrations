---
sidebar_position: 3
---

# Создать задачу
 Создает новую задачу по структуре полей (см. ПолучитьСтруктуруЗадачи)



`Функция СоздатьЗадачу(Знач URL, Знач СтруктураПолей, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | СтруктураПолей | --fields | Структура Из КлючИЗначение | Структура полей задачи (см. ПолучитьСтруктуруЗадачи) |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [tasks.task.add](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_add.php)
:::
<br/>


```bsl title="Пример кода"
    // Полную структуру полей можно получить функцией ПолучитьСтруктуруЗадачи()

    ТекущаяДата = OPI_Инструменты.ПолучитьТекущуюДату();
    Час         = 3600;
    Сутки       = 24;
    Исполнитель = 1;

    СтруктураЗадачи = Новый Структура;
    СтруктураЗадачи.Вставить("TITLE"         , "Новая задача");
    СтруктураЗадачи.Вставить("DESCRIPTION"   , "Новое описание задачи");
    СтруктураЗадачи.Вставить("PRIORITY"      , "2");
    СтруктураЗадачи.Вставить("DEADLINE"      , ТекущаяДата + Час * Сутки);
    СтруктураЗадачи.Вставить("RESPONSIBLE_ID", Исполнитель);

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Результат = OPI_Bitrix24.СоздатьЗадачу(URL, СтруктураЗадачи);

    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "37d1fe66006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.СоздатьЗадачу(URL, СтруктураЗадачи, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 СоздатьЗадачу --url "b24-ar17wx.bitrix24.by" --fields %fields% --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "task": {
   "id": "2358",
   "parentId": null,
   "title": "Новая задача",
   "description": "Новое описание задачи",
   "mark": null,
   "priority": "2",
   "multitask": "N",
   "notViewed": "N",
   "replicate": "N",
   "stageId": "0",
   "createdBy": "1",
   "createdDate": "2024-10-07T21:45:55+03:00",
   "responsibleId": "1",
   "changedBy": "1",
   "changedDate": "2024-10-07T21:45:55+03:00",
   "statusChangedBy": null,
   "closedBy": null,
   "closedDate": null,
   "activityDate": "2024-10-07T21:45:55+03:00",
   "dateStart": null,
   "deadline": "2024-10-09T00:45:00+03:00",
   "startDatePlan": null,
   "endDatePlan": null,
   "guid": "{81c3e7c5-3c32-4ee4-95b0-0a3642898058}",
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
   "viewedDate": null,
   "sorting": null,
   "durationFact": null,
   "isMuted": "N",
   "isPinned": "N",
   "isPinnedInGroup": "N",
   "flowId": null,
   "descriptionInBbcode": "Y",
   "status": "2",
   "statusChangedDate": "2024-10-07T21:45:55+03:00",
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
  "start": 1728326755.84378,
  "finish": 1728326755.96506,
  "duration": 0.121275901794434,
  "processing": 0.0942318439483642,
  "date_start": "2024-10-07T21:45:55+03:00",
  "date_finish": "2024-10-07T21:45:55+03:00",
  "operating_reset_at": 1728327355,
  "operating": 0
 }
}
```
