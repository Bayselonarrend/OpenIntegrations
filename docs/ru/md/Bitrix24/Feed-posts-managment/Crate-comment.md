﻿---
sidebar_position: 6
---

# Добавить комментарий
 Добавляет комментарий к новости


*Функция ДобавитьКомментарий(Знач URL, Знач IDНовости, Знач Текст, Знач Токен = "") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDНовости | --postid | Строка, Число | ID новости |
  | Текст | --text | Строка | Текст комментария |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

```bsl title="Пример кода"
	
  Текст     = "Комментарий к новости";
  IDНовости = "124";
  URL       = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
  
  Результат = OPI_Bitrix24.ДобавитьКомментарий(URL, IDНовости, Текст);
  
  
  Текст     = "Другой комментарий к новости";
  URL       = "b24-ar17wx.bitrix24.by";
  Токен     = "b9df7366006e9f06006b12e400000001000...";
  
  Результат = OPI_Bitrix24.ДобавитьКомментарий(URL, IDНовости, Текст, Токен);
	
```

```sh title="Пример команды CLI"
    
  oint bitrix24 ДобавитьКомментарий --url "b24-ar17wx.bitrix24.by" --postid "124" --text %text% --token "b9df7366006e9f06006b12e400000001000..."

```


```json title="Результат"

{
 "result": 24,
 "time": {
  "start": 1718473316.57246,
  "finish": 1718473316.67595,
  "duration": 0.103492975234985,
  "processing": 0.0729200839996338,
  "date_start": "2024-06-15T17:41:56+00:00",
  "date_finish": "2024-06-15T17:41:56+00:00",
  "operating_reset_at": 1718473916,
  "operating": 0
 }
}

```
