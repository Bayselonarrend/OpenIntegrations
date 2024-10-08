﻿---
sidebar_position: 2
---

# Отправить эфемерное сообщение
Отправляет сообщение, которое приходит в канал, но видно только конкретному пользователю



`Функция ОтправитьЭфемерноеСообщение(Знач Токен, Знач Канал, Знач Текст = "", Знач Пользователь = "", Знач Блоки = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | Канал | --channel | Строка | Идентификатор канала |
  | Текст | --text | Строка | Текст сообщения |
  | Пользователь | --user | Строка | ID пользователя |
  | Блоки | --blocks | Массив Из Структура | JSON массива описаний блоков |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack

<br/>




```bsl title="Пример кода"
    Токен        = "xoxb-6965308400114-696804637...";
    Канал        = "C06UFNUTKUL";
    Пользователь = "U06UABH3APP";
    Картинка     = "https://openyellow.neocities.org/test_data/picture.jpg";
    Текст        = "Эфимерное сообщение";

    Блок      = OPI_Slack.СформироватьБлокКартинку(Картинка, "Картинка");
    Результат = OPI_Slack.ОтправитьЭфемерноеСообщение(Токен, Канал, Текст, Пользователь, Блок);
```



```sh title="Пример команды CLI"
    
  oint slack ОтправитьЭфемерноеСообщение --token %token% --channel "C070VPMKN8J" --text %text% --user %user% --blocks %blocks%

```

```json title="Результат"
{
 "ok": true,
 "message_ts": "1728409450.000300"
}
```
