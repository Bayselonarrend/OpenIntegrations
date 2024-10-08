﻿---
sidebar_position: 4
---

# Получить чеклист задачи
 Получает список элементов чеклиста задачи



`Функция ПолучитьЧеклистЗадачи(Знач URL, Знач IDЗадачи, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЗадачи | --task | Число, Строка | ID задачи |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [task.checklistitem.getlist](https://dev.1c-bitrix.ru/rest_help/tasks/task/checklistitem/getlist.php)
:::
<br/>


```bsl title="Пример кода"
    URL       = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDЗадачи  = "2262";

    Результат = OPI_Bitrix24.ПолучитьЧеклистЗадачи(URL, IDЗадачи);

    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "37d1fe66006e9f06006b12e400000001000...";
    IDЗадачи  = "2264";

    Результат = OPI_Bitrix24.ПолучитьЧеклистЗадачи(URL, IDЗадачи, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьЧеклистЗадачи --url %url% --task %task% --token %token%

```

```json title="Результат"
{
 "result": [
  {
   "ID": "1442",
   "TASK_ID": "2378",
   "PARENT_ID": 0,
   "CREATED_BY": "1",
   "TITLE": "BX_CHECKLIST_1",
   "SORT_INDEX": "0",
   "IS_COMPLETE": "N",
   "IS_IMPORTANT": "N",
   "TOGGLED_BY": null,
   "TOGGLED_DATE": "",
   "MEMBERS": [],
   "ATTACHMENTS": []
  },
  {
   "ID": "1444",
   "TASK_ID": "2378",
   "PARENT_ID": "1442",
   "CREATED_BY": "1",
   "TITLE": "Новый текст пункта чек-листа",
   "SORT_INDEX": "1",
   "IS_COMPLETE": "N",
   "IS_IMPORTANT": "N",
   "TOGGLED_BY": null,
   "TOGGLED_DATE": "",
   "MEMBERS": [],
   "ATTACHMENTS": []
  }
 ],
 "time": {
  "start": 1728409731.79594,
  "finish": 1728409731.84521,
  "duration": 0.0492649078369141,
  "processing": 0.0217220783233643,
  "date_start": "2024-10-08T20:48:51+03:00",
  "date_finish": "2024-10-08T20:48:51+03:00",
  "operating_reset_at": 1728410331,
  "operating": 0
 }
}
```
