---
sidebar_position: 7
---

# Отправить группу медиафайлов
 Отправляет набор файлов в чат или канал. Варианты типов медиа: audio, document, photo, video


*Функция ОтправитьМедиагруппу(Знач Токен, Знач IDЧата, Знач Текст, Знач СоответствиеФайлов, Знач Клавиатура = "", Знач Разметка = "Markdown") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chat | Строка,Число | ID целевого чата или IDЧата*IDТемы |
  | Текст | --text | Строка | Текст сообщения |
  | СоответствиеФайлов | --media | Соответствие из Строка | JSON файлов или путь к .json |
  | Клавиатура | --keyboard | Строка | JSON клавиатуры или путь к .json |
  | Разметка | --parsemode | Строка | Вид обработки текста (HTML, Markdown, MarkdownV2) |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Telegram

```bsl title="Пример кода"
	
  
  Токен              = "111111111:AACccNYOAFbuhAL5GAaaBbbbOjZYFvLZZZZ";
  Описание           = "Группа картинок";
  СоответствиеФайлов = Новый Соответствие;
  СоответствиеФайлов.Вставить("C:\OPI\alpaca.png"     , "photo");
  СоответствиеФайлов.Вставить("C:\OPI\alpaca_text.png", "photo");
  
  Ответ = OPI_Telegram.ОтправитьМедиагруппу(Токен, 1234567890, Описание, СоответствиеФайлов); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ_);                                                //JSON строка
  
	
```

```sh title="Пример команды CLI"
    
      oint telegram ОтправитьМедиагруппу --token "111111111:AACccNYOAFbuhAL5GAaaBbbbOjZYFvLZZZZ" --chat %chat% --text %text% --media %media% --keyboard %keyboard% --parsemode %parsemode%

```


```json title="Результат"

{
 "ok": true,
 "result": [
  {
   "message_id": 4644,
   "from": {
    "id": 6129457865,
    "is_bot": true,
    "first_name": "Бот Виталий",
    "username": "sicheebot"
   },
   "chat": {
    "id": 461699897,
    "first_name": "Anton",
    "last_name": "Titowets",
    "username": "JKIee",
    "type": "private"
   },
   "date": 1717072435,
   "media_group_id": "13736579485142714",
   "photo": [
    {
     "file_id": "AgACAgIAAxkDAAISJGZYcjMH_sZQUquUAgQ99ai1gbJJAAKa2TEbvv6xSgxyd39G8AuyAQADAgADcwADNQQ",
     "file_unique_id": "AQADmtkxG77-sUp4",
     "file_size": 1568,
     "width": 90,
     "height": 67
    },
    {
     "file_id": "AgACAgIAAxkDAAISJGZYcjMH_sZQUquUAgQ99ai1gbJJAAKa2TEbvv6xSgxyd39G8AuyAQADAgADbQADNQQ",
     "file_unique_id": "AQADmtkxG77-sUpy",
     "file_size": 21633,
     "width": 320,
     "height": 240
    },
    {
     "file_id": "AgACAgIAAxkDAAISJGZYcjMH_sZQUquUAgQ99ai1gbJJAAKa2TEbvv6xSgxyd39G8AuyAQADAgADeAADNQQ",
     "file_unique_id": "AQADmtkxG77-sUp9",
     "file_size": 99260,
     "width": 800,
     "height": 600
    },
    {
     "file_id": "AgACAgIAAxkDAAISJGZYcjMH_sZQUquUAgQ99ai1gbJJAAKa2TEbvv6xSgxyd39G8AuyAQADAgADeQADNQQ",
     "file_unique_id": "AQADmtkxG77-sUp-",
     "file_size": 218651,
     "width": 1280,
     "height": 960
    },
    {
     "file_id": "AgACAgIAAxkDAAISJGZYcjMH_sZQUquUAgQ99ai1gbJJAAKa2TEbvv6xSgxyd39G8AuyAQADAgADdwADNQQ",
     "file_unique_id": "AQADmtkxG77-sUp8",
     "file_size": 650214,
     "width": 2560,
     "height": 1920
    }
   ],
   "caption": "Строковое значение"
  },
  {
   "message_id": 4645,
   "from": {
    "id": 6129457865,
    "is_bot": true,
    "first_name": "Бот Виталий",
    "username": "sicheebot"
   },
   "chat": {
    "id": 461699897,
    "first_name": "Anton",
    "last_name": "Titowets",
    "username": "JKIee",
    "type": "private"
   },
   "date": 1717072435,
   "media_group_id": "13736579485142714",
   "video": {
    "duration": 5,
    "width": 640,
    "height": 480,
    "file_name": "video1",
    "mime_type": "video/mp4",
    "thumbnail": {
     "file_id": "AAMCAgADGQMAAhIlZlhyM8blQGUtyAJ_ndJRjfrrHT8AAq9QAAJgKMhK7ZjJRS8XMtIBAAdtAAM1BA",
     "file_unique_id": "AQADr1AAAmAoyEpy",
     "file_size": 20106,
     "width": 320,
     "height": 240
    },
    "thumb": {
     "file_id": "AAMCAgADGQMAAhIlZlhyM8blQGUtyAJ_ndJRjfrrHT8AAq9QAAJgKMhK7ZjJRS8XMtIBAAdtAAM1BA",
     "file_unique_id": "AQADr1AAAmAoyEpy",
     "file_size": 20106,
     "width": 320,
     "height": 240
    },
    "file_id": "BAACAgIAAxkDAAISJWZYcjPG5UBlLcgCf53SUY366x0_AAKvUAACYCjISu2YyUUvFzLSNQQ",
    "file_unique_id": "AgADr1AAAmAoyEo",
    "file_size": 1137878
   }
  }
 ]
}

```
