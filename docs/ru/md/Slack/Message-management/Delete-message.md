﻿---
sidebar_position: 4
---

# Удалить сообщение
 Удаляет сообщение канала по timestamp



`Функция УдалитьСообщение(Знач Токен, Знач Канал, Знач Отметка, Знач ЭтоОтложенное = Ложь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | Канал | --channel | Строка | Идентификатор канала |
  | Отметка | --stamp | Строка | Временная отметка или ID сообщения |
  | ЭтоОтложенное | --issheduled | Булево | Признак удаления отложенного сообщения |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack

<br/>




```bsl title="Пример кода"
    Токен   = "xoxb-6965308400114-696804637...";
    Канал   = "C06UFNUTKUL";
    Отметка = "1727627095.229429";

    Результат = OPI_Slack.УдалитьСообщение(Токен, Канал, Отметка);
```



```sh title="Пример команды CLI"
    
  oint slack УдалитьСообщение --token %token% --channel "C06UFNUTKUL" --stamp "1714146538.221929" --issheduled %issheduled%

```

```json title="Результат"
{
 "ok": true,
 "channel": "C06UFNUTKUL",
 "ts": "1728409447.484679"
}
```
