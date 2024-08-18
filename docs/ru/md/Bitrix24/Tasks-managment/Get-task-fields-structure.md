---
sidebar_position: 26
---

# Получить структуру задачи
 Получает структуру с описанем полей для создания задачи



`Функция ПолучитьСтруктуруЗадачи(Знач URL, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [tasks.task.getFields](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_getFields.php)
:::
<br/>


```bsl title="Пример кода"
    URL = "https://b24-ar17wx.bitrix24.by/rest/1/ztbe...";

    Результат = OPI_Bitrix24.ПолучитьСтруктуруЗадачи(URL);

    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "c03fa966006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ПолучитьСтруктуруЗадачи(URL, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьСтруктуруЗадачи --url "b24-ar17wx.bitrix24.by" --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "fields": {
   "ID": {
    "title": "ID",
    "type": "integer",
    "primary": true
   },
   "PARENT_ID": {
    "title": "ID базовой задачи",
    "type": "integer",
    "default": 0
   },
   "TITLE": {
    "title": "Название",
    "type": "string",
    "required": true
   },
   "DESCRIPTION": {
    "title": "Описание",
    "type": "string"
   },
   "MARK": {
    "title": "Оценка",
    "type": "enum",
    "values": {
     "N": "Отрицательная",
     "P": "Положительная"
    },
    "default": null
   },
   "PRIORITY": {
    "title": "Приоритет",
    "type": "enum",
    "values": {
     "2": "Высокий",
     "1": "Средний",
     "0": "Низкий"
    },
    "default": 1
   },
   "STATUS": {
    "title": "Статус",
    "type": "enum",
    "values": {
     "2": "Ждет выполнения",
     "3": "Выполняется",
     "4": "Ожидает контроля",
     "5": "Завершена",
     "6": "Отложена"
    },
    "default": 2
   },
   "MULTITASK": {
    "title": "Множественная задача",
    "type": "enum",
    "values": {
     "Y": "Да",
     "N": "Нет"
    },
    "default": "N"
   },
   "NOT_VIEWED": {
    "title": null,
    "type": "enum",
    "values": {
     "Y": "Да",
     "N": "Нет"
    },
    "default": "N"
   },
   "REPLICATE": {
    "title": "Повторяемая задача",
    "type": "enum",
    "values": {
     "Y": "Да",
     "N": "Нет"
    },
    "default": "N"
   },
   "GROUP_ID": {
    "title": "Проект",
    "type": "integer",
    "default": 0
   },
   "STAGE_ID": {
    "title": "Стадия",
    "type": "integer",
    "default": 0
   },
   "CREATED_BY": {
    "title": "Постановщик",
    "type": "integer",
    "required": true
   },
   "CREATED_DATE": {
    "title": null,
    "type": "datetime"
   },
   "RESPONSIBLE_ID": {
    "title": "Исполнитель",
    "type": "integer",
    "required": true
   },
   "ACCOMPLICES": {
    "title": null,
    "type": "array"
   },
   "AUDITORS": {
    "title": null,
    "type": "array"
   },
   "CHANGED_BY": {
    "title": "Изменил",
    "type": "integer"
   },
   "CHANGED_DATE": {
    "title": "Дата изменения",
    "type": "datetime"
   },
   "STATUS_CHANGED_BY": {
    "title": "Изменил статус",
    "type": "integer"
   },
   "STATUS_CHANGED_DATE": {
    "title": "Дата изменения статуса",
    "type": "datetime"
   },
   "CLOSED_BY": {
    "title": "Закрыл задачу",
    "type": "integer",
    "default": null
   },
   "CLOSED_DATE": {
    "title": "Дата закрытия",
    "type": "datetime",
    "default": null
   },
   "ACTIVITY_DATE": {
    "title": null,
    "type": "datetime",
    "default": null
   },
   "DATE_START": {
    "title": "Дата начала",
    "type": "datetime",
    "default": null
   },
   "DEADLINE": {
    "title": "Крайний срок",
    "type": "datetime",
    "default": null
   },
   "START_DATE_PLAN": {
    "title": "Плановое начало",
    "type": "datetime",
    "default": null
   },
   "END_DATE_PLAN": {
    "title": "Плановое завершение",
    "type": "datetime",
    "default": null
   },
   "GUID": {
    "title": "GUID",
    "type": "string",
    "default": null
   },
   "XML_ID": {
    "title": "XML_ID",
    "type": "string",
    "default": null
   },
   "COMMENTS_COUNT": {
    "title": "Кол-во комментариев",
    "type": "integer",
    "default": 0
   },
   "SERVICE_COMMENTS_COUNT": {
    "title": null,
    "type": "integer",
    "default": 0
   },
   "NEW_COMMENTS_COUNT": {
    "title": null,
    "type": "integer",
    "default": 0
   },
   "ALLOW_CHANGE_DEADLINE": {
    "title": null,
    "type": "enum",
    "values": {
     "Y": "Да",
     "N": "Нет"
    },
    "default": "N"
   },
   "ALLOW_TIME_TRACKING": {
    "title": null,
    "type": "enum",
    "values": {
     "Y": "Да",
     "N": "Нет"
    },
    "default": "N"
   },
   "TASK_CONTROL": {
    "title": "Принять работу",
    "type": "enum",
    "values": {
     "Y": "Да",
     "N": "Нет"
    },
    "default": "N"
   },
   "ADD_IN_REPORT": {
    "title": "Добавить в отчет",
    "type": "enum",
    "values": {
     "Y": "Да",
     "N": "Нет"
    },
    "default": "N"
   },
   "FORKED_BY_TEMPLATE_ID": {
    "title": "Создано из шаблона",
    "type": "enum",
    "values": {
     "Y": "Да",
     "N": "Нет"
    },
    "default": "N"
   },
   "TIME_ESTIMATE": {
    "title": "Затраченое время",
    "type": "integer"
   },
   "TIME_SPENT_IN_LOGS": {
    "title": "Затраченое время из истории изменений",
    "type": "integer"
   },
   "MATCH_WORK_TIME": {
    "title": "Пропустить выходные дни",
    "type": "integer"
   },
   "FORUM_TOPIC_ID": {
    "title": "FORUM_TOPIC_ID",
    "type": "integer"
   },
   "FORUM_ID": {
    "title": "FORUM_ID",
    "type": "integer"
   },
   "SITE_ID": {
    "title": "SITE_ID",
    "type": "string"
   },
   "SUBORDINATE": {
    "title": "Задача подчиненного",
    "type": "enum",
    "values": {
     "Y": "Да",
     "N": "Нет"
    },
    "default": null
   },
   "FAVORITE": {
    "title": null,
    "type": "enum",
    "values": {
     "Y": "Да",
     "N": "Нет"
    },
    "default": null
   },
   "EXCHANGE_MODIFIED": {
    "title": "EXCHANGE_MODIFIED",
    "type": "datetime",
    "default": null
   },
   "EXCHANGE_ID": {
    "title": "EXCHANGE_ID",
    "type": "integer",
    "default": null
   },
   "OUTLOOK_VERSION": {
    "title": "OUTLOOK_VERSION",
    "type": "integer",
    "default": null
   },
   "VIEWED_DATE": {
    "title": "Дата последнего просмотра",
    "type": "datetime"
   },
   "SORTING": {
    "title": "Индекс сортировки",
    "type": "double"
   },
   "DURATION_PLAN": {
    "title": "Затрачено (план)",
    "type": "integer"
   },
   "DURATION_FACT": {
    "title": "Затрачено (фактически)",
    "type": "integer"
   },
   "CHECKLIST": {
    "title": null,
    "type": "array"
   },
   "DURATION_TYPE": {
    "title": "DURATION_TYPE",
    "type": "enum",
    "values": [
     "secs",
     "mins",
     "hours",
     "days",
     "weeks",
     "monts",
     "years"
    ],
    "default": "days"
   },
   "IS_MUTED": {
    "title": null,
    "type": "enum",
    "values": {
     "Y": "Да",
     "N": "Нет"
    },
    "default": "N"
   },
   "IS_PINNED": {
    "title": null,
    "type": "enum",
    "values": {
     "Y": "Да",
     "N": "Нет"
    },
    "default": "N"
   },
   "IS_PINNED_IN_GROUP": {
    "title": null,
    "type": "enum",
    "values": {
     "Y": "Да",
     "N": "Нет"
    },
    "default": "N"
   },
   "FLOW_ID": {
    "title": null,
    "type": "integer",
    "default": 0
   },
   "UF_CRM_TASK": {
    "title": "Элементы CRM",
    "type": "crm"
   },
   "UF_TASK_WEBDAV_FILES": {
    "title": "Load files",
    "type": "disk_file"
   },
   "UF_MAIL_MESSAGE": {
    "title": null,
    "type": "mail_message"
   }
  }
 },
 "time": {
  "start": 1718473322.5296,
  "finish": 1718473322.56673,
  "duration": 0.0371248722076416,
  "processing": 0.00164389610290527,
  "date_start": "2024-06-15T17:42:02+00:00",
  "date_finish": "2024-06-15T17:42:02+00:00",
  "operating_reset_at": 1718473922,
  "operating": 0
 }
}
```
