﻿---
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
    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Результат = OPI_Bitrix24.ПолучитьСтруктуруЗадачи(URL);

    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "37d1fe66006e9f06006b12e400000001000...";

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
     "2": "Ждёт выполнения",
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
...
```
