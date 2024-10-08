﻿---
sidebar_position: 2
---

# Добавить пользовательское поле задачи
 Добавляет новое пользовательское поле для добавления в задачу



`Функция ДобавитьПользовательскоеПолеЗадачи(Знач URL, Знач Тип, Знач Имя, Знач ВнешнийКод = "", Знач Заголовок = "", Знач Подпись = "", Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | Тип | --type | Строка | Тип поля: string, double, date, boolean |
  | Имя | --fieldname | Строка | Текстовый идентификатор (наименование) поля |
  | ВнешнийКод | --externalid | Строка | Внешний текстовый идентификатор поля |
  | Заголовок | --title | Строка | Заголовок поля |
  | Подпись | --label | Структура Из КлючИЗначение | Подпись в форме. Ключ: en или ru, Значение: Текст подписи |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [task.item.userfield.add](https://dev.1c-bitrix.ru/rest_help/tasks/task/userfield/add.php)
:::
<br/>


```bsl title="Пример кода"
    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Тип = "date";
    Имя = "BIRTHDAY_FIELD";

    Результат = OPI_Bitrix24.ДобавитьПользовательскоеПолеЗадачи(URL, Тип, Имя);

    URL   = "b24-ar17wx.bitrix24.by";
    Токен = "37d1fe66006e9f06006b12e400000001000...";

    Тип        = "string";
    Имя        = "TEXT_FIELD";
    ВнешнийКод = "BITRIX_TEXT_FIELD";
    Заголовок  = "Поле для текста";
    Подпись    = Новый Структура("en,ru", "Some field", "Некоторое поле");

    Результат = OPI_Bitrix24.ДобавитьПользовательскоеПолеЗадачи(URL, Тип, Имя, ВнешнийКод, Заголовок, Подпись, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ДобавитьПользовательскоеПолеЗадачи --url %url% --type %type% --fieldname %fieldname% --externalid %externalid% --title %title% --label %label% --token %token%

```

```json title="Результат"
{
 "result": 261,
 "time": {
  "start": 1722114794.52732,
  "finish": 1722114794.59725,
  "duration": 0.0699310302734375,
  "processing": 0.0470340251922607,
  "date_start": "2024-07-27T21:13:14+00:00",
  "date_finish": "2024-07-27T21:13:14+00:00",
  "operating_reset_at": 1722115394,
  "operating": 0
 }
}
```
