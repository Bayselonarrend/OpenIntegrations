---
sidebar_position: 2
---

# Получить список задач
 Получает список задач (50 шт. за запрос максимум) с фильтром или без (см. ПолучитьСтруктуруФильтраЗадач)



`Функция ПолучитьСписокЗадач(Знач URL, Знач Фильтр = "", Знач Отступ = 0, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | Фильтр | --filter | Структура из КлючИЗначение | Структура отбора задач (см. ПолучитьСтруктуруФильтраЗадач) |
  | Отступ | --offset | Число, Строка | Отступ от начала списка для полчения задач > 50 шт. рекурсивно |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [tasks.task.list](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_list.php)
:::
<br/>


```bsl title="Пример кода"
    // Полную структуру фильтра можно найти в функции ПолучитьСтруктуруФильтраЗадач
    Фильтр = Новый Структура;
    Фильтр.Вставить("CREATED_BY"    , 1);
    Фильтр.Вставить("RESPONSIBLE_ID", 10);

    Отступ   = 1;
    URL      = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Результат = OPI_Bitrix24.ПолучитьСписокЗадач(URL, Фильтр);

    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "c3abf666006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ПолучитьСписокЗадач(URL, , Отступ, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьСписокЗадач --url "b24-ar17wx.bitrix24.by" --filter %filter% --offset %offset% --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "tasks": [
   {
    "id": "2",
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
    "subStatus": "2"
   },
   {
    "id": "4",
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
     "name": "Антон Титовец",
     "link": "/company/personal/user/1/",
     "icon": "https://b24-ar17wx.bitrix24.by/b28528874/resize_cache/30/c0120a8d7c10d63c83e32398d1ec4d9e/main/d7e/d7e99cf556e4ab676463dae2c00ddfbb/a7e0af6899300e3c684caeca5c334d81.jpg",
     "workPosition": null
    },
...
```
