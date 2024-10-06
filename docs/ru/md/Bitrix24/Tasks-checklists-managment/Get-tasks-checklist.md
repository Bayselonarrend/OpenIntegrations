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
   "ID": "1402",
   "TASK_ID": "2328",
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
   "ID": "1404",
   "TASK_ID": "2328",
   "PARENT_ID": "1402",
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
  "start": 1728225160.5789,
  "finish": 1728225160.62511,
  "duration": 0.0462110042572022,
  "processing": 0.0223078727722168,
  "date_start": "2024-10-06T17:32:40+03:00",
  "date_finish": "2024-10-06T17:32:40+03:00",
  "operating_reset_at": 1728225760,
  "operating": 0
 }
}
```
