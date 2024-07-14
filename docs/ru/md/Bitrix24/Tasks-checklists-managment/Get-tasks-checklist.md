---
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
  URL       = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
  IDЗадачи  = "720";
  
  Результат = OPI_Bitrix24.ПолучитьЧеклистЗадачи(URL, IDЗадачи);
  
  
  
  URL       = "b24-ar17wx.bitrix24.by";
  Токен     = "adf89366006e9f06006b12e400000001000...";
  IDЗадачи  = "722";
  
  Результат = OPI_Bitrix24.ПолучитьЧеклистЗадачи(URL, IDЗадачи, Токен);
```
	


```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьЧеклистЗадачи --url %url% --task %task% --token %token%

```

```json title="Результат"
{
 "result": [
  {
   "ID": "94",
   "TASK_ID": "632",
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
   "ID": "96",
   "TASK_ID": "632",
   "PARENT_ID": "94",
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
  "start": 1720816507.68937,
  "finish": 1720816507.74166,
  "duration": 0.0522880554199219,
  "processing": 0.0231881141662598,
  "date_start": "2024-07-12T20:35:07+00:00",
  "date_finish": "2024-07-12T20:35:07+00:00",
  "operating_reset_at": 1720817107,
  "operating": 0
 }
}
```
