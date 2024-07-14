---
sidebar_position: 16
---

# Делегировать задачу
 Делегирует задачу на другого пользователя



`Функция ДелегироватьЗадачу(Знач URL, Знач IDЗадачи, Знач IDПользователя, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЗадачи | --task | Число,Строка | ID задачи |
  | IDПользователя | --user | Число,Строка | ID пользователя исполнителя |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [tasks.task.delegate](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_delegate.php)
:::
<br/>


```bsl title="Пример кода"
  URL            = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
  IDЗадачи       = "720";
  IDПользователя = "10";
  
  Результат = OPI_Bitrix24.ДелегироватьЗадачу(URL, IDЗадачи, IDПользователя);
  
  
  URL       = "b24-ar17wx.bitrix24.by";
  Токен     = "adf89366006e9f06006b12e400000001000...";
  IDЗадачи  = "722";
  
  Результат = OPI_Bitrix24.ДелегироватьЗадачу(URL, IDЗадачи, IDПользователя, Токен);
```
	


```sh title="Пример команды CLI"
    
  oint bitrix24 ДелегироватьЗадачу --url "b24-ar17wx.bitrix24.by" --task "170" --user "10" --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "task": {
   "id": "154",
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
   "createdDate": "2024-06-19T07:57:54+00:00",
   "responsibleId": "10",
   "changedBy": "1",
   "changedDate": "2024-06-19T07:58:08+00:00",
   "statusChangedBy": "1",
   "closedBy": "0",
   "closedDate": null,
   "activityDate": "2024-06-19T07:58:08+00:00",
   "dateStart": null,
   "deadline": "2024-06-20T07:57:00+00:00",
   "startDatePlan": null,
   "endDatePlan": null,
   "guid": "{ad8a4659-17d0-45d1-9b6d-215cf345ae56}",
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
   "forumTopicId": "142",
   "forumId": "11",
   "siteId": "s1",
   "subordinate": "N",
   "exchangeModified": null,
   "exchangeId": null,
   "outlookVersion": "3",
   "viewedDate": "2024-06-19T07:58:09+00:00",
   "sorting": null,
   "durationFact": null,
   "isMuted": "N",
   "isPinned": "N",
   "isPinnedInGroup": "N",
   "flowId": null,
   "descriptionInBbcode": "Y",
   "status": "2",
   "statusChangedDate": "2024-06-19T07:58:08+00:00",
   "durationPlan": null,
   "durationType": "days",
   "favorite": "N",
   "groupId": "0",
   "auditors": [
    "1"
   ],
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
    "id": "10",
    "name": "Techno Pizza",
    "link": "/company/personal/user/10/",
    "icon": "/bitrix/images/tasks/default_avatar.png",
    "workPosition": null
   },
   "accomplicesData": [],
   "auditorsData": {
    "1": {
     "id": "1",
     "name": "Антон Титовец",
     "link": "/company/personal/user/1/",
     "icon": "https://b24-ar17wx.bitrix24.by/b28528874/resize_cache/30/c0120a8d7c10d63c83e32398d1ec4d9e/main/d7e/d7e99cf556e4ab676463dae2c00ddfbb/a7e0af6899300e3c684caeca5c334d81.jpg",
     "workPosition": null
    }
   },
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
  "start": 1718783888.64547,
  "finish": 1718783889.13128,
  "duration": 0.485809803009033,
  "processing": 0.450714111328125,
  "date_start": "2024-06-19T07:58:08+00:00",
  "date_finish": "2024-06-19T07:58:09+00:00",
  "operating_reset_at": 1718784488,
  "operating": 0.450687170028686
 }
}
```
