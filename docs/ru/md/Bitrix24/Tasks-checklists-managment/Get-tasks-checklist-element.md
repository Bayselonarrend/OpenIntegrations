﻿---
sidebar_position: 5
---

# Получить элемент чеклиста задачи
 Получить элемент чеклиста задачи по ID



`Функция ПолучитьЭлементЧеклистаЗадачи(Знач URL, Знач IDЗадачи, Знач IDЭлемента, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЗадачи | --task | Число, Строка | ID задачи |
  | IDЭлемента | --element | Число, Строка | ID элемента для получения |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [task.checklistitem.get](https://dev.1c-bitrix.ru/rest_help/tasks/task/checklistitem/get.php)
:::
<br/>


```bsl title="Пример кода"
    URL        = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDЗадачи   = "2262";
    IDЭлемента = "1344";

    Результат = OPI_Bitrix24.ПолучитьЭлементЧеклистаЗадачи(URL, IDЗадачи, IDЭлемента);

    IDЗадачи   = "2264";
    IDЭлемента = "1348";

    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "37d1fe66006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ПолучитьЭлементЧеклистаЗадачи(URL, IDЗадачи, IDЭлемента, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьЭлементЧеклистаЗадачи --url %url% --task %task% --element %element% --token %token%

```

```json title="Результат"
{
 "result": {
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
 },
 "time": {
  "start": 1728409731.99901,
  "finish": 1728409732.05083,
  "duration": 0.051814079284668,
  "processing": 0.0249829292297363,
  "date_start": "2024-10-08T20:48:51+03:00",
  "date_finish": "2024-10-08T20:48:52+03:00",
  "operating_reset_at": 1728410332,
  "operating": 0
 }
}
```
