﻿---
sidebar_position: 2
---

# Изменить стадию канбана
 Изменяет свойства существующей стадии канбана или Моего плана



`Функция ИзменитьСтадиюКанбана(Знач URL, Знач Наименование, Знач IDСтадии, Знач Цвет = "", Знач IDПредыдущей = 0, Знач КакАдминистратор = Ложь, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | Наименование | --title | Строка | Новое наименование стадии |
  | IDСтадии | --stage | Строка, Число | ID стадии для изменения |
  | Цвет | --color | Строка | HEX нового цвета стадии |
  | IDПредыдущей | --prevstage | Строка, Число | ID стадии, после которой необходимо вставить выбранную |
  | КакАдминистратор | --admin | Булево | Позволяет добавлять стадии без проверки прав (для администраторов) |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [task.stages.update](https://dev.1c-bitrix.ru/rest_help/tasks/task/kanban/task_stages_update.php)
:::
<br/>


```bsl title="Пример кода"
    Наименование = "Новое имя стадии стадии";
    Цвет         = "000000";
    IDСтадии     = "730";

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Результат = OPI_Bitrix24.ИзменитьСтадиюКанбана(URL, Наименование, IDСтадии, Цвет);

    Наименование = "Новое имя стадии стадии 2";
    Цвет         = "000000";
    IDСтадии     = "732";

    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "37d1fe66006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ИзменитьСтадиюКанбана(URL, Наименование, IDСтадии, Цвет, 6, Истина, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ИзменитьСтадиюКанбана --url %url% --title %title% --stage %stage% --color %color% --prevstage %prevstage% --admin %admin% --token %token%

```

```json title="Результат"
{
 "result": true,
 "time": {
  "start": 1728409778.18036,
  "finish": 1728409778.25574,
  "duration": 0.0753860473632812,
  "processing": 0.0437319278717041,
  "date_start": "2024-10-08T20:49:38+03:00",
  "date_finish": "2024-10-08T20:49:38+03:00",
  "operating_reset_at": 1728410378,
  "operating": 0
 }
}
```
