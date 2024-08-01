﻿---
sidebar_position: 1
---

# Получить список пользовательских полей задачи
 Получает список пользовательских полей для задач



`Функция ПолучитьСписокПользовательскихПолейЗадачи(Знач URL, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [task.item.userfield.getlist](https://dev.1c-bitrix.ru/rest_help/tasks/task/userfield/getlist.php)
:::
<br/>


```bsl title="Пример кода"
  URL       = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
  
  Результат = OPI_Bitrix24.ПолучитьСписокПользовательскихПолейЗадачи(URL);
  
  URL      = "b24-ar17wx.bitrix24.by";
  Токен    = "adf89366006e9f06006b12e400000001000...";
  
  Результат = OPI_Bitrix24.ПолучитьСписокПользовательскихПолейЗадачи(URL);
```
	


```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьСписокПользовательскихПолейЗадачи --url %url% --token %token%

```

```json title="Результат"
{
 "result": [
  {
   "ID": "11",
   "ENTITY_ID": "TASKS_TASK",
   "FIELD_NAME": "UF_CRM_TASK",
   "USER_TYPE_ID": "crm",
   "XML_ID": null,
   "SORT": "100",
   "MULTIPLE": "Y",
   "MANDATORY": "N",
   "SHOW_FILTER": "N",
   "SHOW_IN_LIST": "Y",
   "EDIT_IN_LIST": "Y",
   "IS_SEARCHABLE": "N",
   "SETTINGS": {
    "LEAD": "Y",
    "CONTACT": "Y",
    "COMPANY": "Y",
    "DEAL": "Y",
    "ORDER": "Y",
    "SMART_INVOICE": "Y"
   }
  },
  {
   "ID": "101",
   "ENTITY_ID": "TASKS_TASK",
   "FIELD_NAME": "UF_TASK_WEBDAV_FILES",
   "USER_TYPE_ID": "disk_file",
   "XML_ID": "TASK_WEBDAV_FILES",
   "SORT": "100",
   "MULTIPLE": "Y",
   "MANDATORY": "N",
   "SHOW_FILTER": "N",
   "SHOW_IN_LIST": "Y",
   "EDIT_IN_LIST": "Y",
   "IS_SEARCHABLE": "Y",
   "SETTINGS": []
  },
  {
   "ID": "117",
   "ENTITY_ID": "TASKS_TASK",
   "FIELD_NAME": "UF_MAIL_MESSAGE",
   "USER_TYPE_ID": "mail_message",
   "XML_ID": "",
   "SORT": "100",
   "MULTIPLE": "N",
   "MANDATORY": "N",
   "SHOW_FILTER": "N",
   "SHOW_IN_LIST": "N",
   "EDIT_IN_LIST": "N",
   "IS_SEARCHABLE": "N",
   "SETTINGS": []
  },
  {
   "ID": "259",
   "ENTITY_ID": "TASKS_TASK",
   "FIELD_NAME": "UF_BIRTHDAY_FIELD",
   "USER_TYPE_ID": "date",
   "XML_ID": null,
   "SORT": "100",
   "MULTIPLE": "N",
   "MANDATORY": "N",
   "SHOW_FILTER": "N",
   "SHOW_IN_LIST": "Y",
   "EDIT_IN_LIST": "Y",
   "IS_SEARCHABLE": "N",
   "SETTINGS": {
    "DEFAULT_VALUE": {
     "TYPE": "NONE",
     "VALUE": ""
    }
   }
  },
  {
   "ID": "261",
   "ENTITY_ID": "TASKS_TASK",
   "FIELD_NAME": "UF_TEXT_FIELD",
   "USER_TYPE_ID": "string",
   "XML_ID": "NEW_TEXT_FIELD",
   "SORT": "100",
   "MULTIPLE": "N",
   "MANDATORY": "N",
   "SHOW_FILTER": "N",
   "SHOW_IN_LIST": "Y",
   "EDIT_IN_LIST": "Y",
   "IS_SEARCHABLE": "N",
   "SETTINGS": {
    "SIZE": 20,
    "ROWS": 1,
    "REGEXP": "",
    "MIN_LENGTH": 0,
    "MAX_LENGTH": 0,
    "DEFAULT_VALUE": ""
   }
  }
 ],
 "total": 0,
 "time": {
  "start": 1722114799.57,
  "finish": 1722114799.58769,
  "duration": 0.0176839828491211,
  "processing": 0.000379085540771484,
  "date_start": "2024-07-27T21:13:19+00:00",
  "date_finish": "2024-07-27T21:13:19+00:00",
  "operating_reset_at": 1722115399,
  "operating": 0
 }
}
```