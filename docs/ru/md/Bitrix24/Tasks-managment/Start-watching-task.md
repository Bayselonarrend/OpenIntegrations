---
sidebar_position: 14
---

# Начать наблюдать за задачей
 Начинает наблюдение за задачей по ID



`Функция НачатьНаблюдатьЗаЗадачей(Знач URL, Знач IDЗадачи, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЗадачи | --task | Число,Строка | ID задачи |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [tasks.task.startwatch](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_startwatch.php)
:::
<br/>


```bsl title="Пример кода"
    URL      = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDЗадачи = "2262";

    Результат = OPI_Bitrix24.НачатьНаблюдатьЗаЗадачей(URL, IDЗадачи);

    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "37d1fe66006e9f06006b12e400000001000...";
    IDЗадачи  = "2264";

    Результат = OPI_Bitrix24.НачатьНаблюдатьЗаЗадачей(URL, IDЗадачи, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 НачатьНаблюдатьЗаЗадачей --url "b24-ar17wx.bitrix24.by" --task "170" --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "task": {
   "id": "2358",
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
   "createdDate": "2024-10-07T21:45:55+03:00",
   "responsibleId": "586",
   "changedBy": "1",
   "changedDate": "2024-10-07T21:46:07+03:00",
   "statusChangedBy": "1",
   "closedBy": "0",
   "closedDate": null,
   "activityDate": "2024-10-07T21:46:06+03:00",
   "dateStart": "2024-10-07T21:46:07+03:00",
   "deadline": "2024-10-09T00:45:00+03:00",
   "startDatePlan": "2024-10-07T21:45:55+03:00",
   "endDatePlan": "2024-10-08T00:00:00+03:00",
   "guid": "{81c3e7c5-3c32-4ee4-95b0-0a3642898058}",
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
   "forumTopicId": "1640",
   "forumId": "11",
   "siteId": "s1",
   "subordinate": "N",
   "exchangeModified": null,
   "exchangeId": null,
   "outlookVersion": "9",
   "viewedDate": "2024-10-07T21:46:06+03:00",
   "sorting": null,
   "durationFact": null,
   "isMuted": "N",
   "isPinned": "N",
   "isPinnedInGroup": "N",
   "flowId": null,
   "descriptionInBbcode": "Y",
   "status": "3",
   "statusChangedDate": "2024-10-07T21:46:07+03:00",
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
    "id": "586",
    "name": "Олег Лама",
    "link": "/company/personal/user/586/",
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
  "start": 1728326767.57248,
  "finish": 1728326767.7443,
  "duration": 0.171818017959595,
  "processing": 0.14493203163147,
  "date_start": "2024-10-07T21:46:07+03:00",
  "date_finish": "2024-10-07T21:46:07+03:00",
  "operating_reset_at": 1728327367,
  "operating": 0.144911050796509
 }
}
```
