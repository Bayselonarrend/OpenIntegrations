﻿---
sidebar_position: 3
---

# Отправить видео
 Отправляет видео в чат или канал



`Функция ОтправитьВидео(Знач Токен, Знач IDЧата, Знач Текст, Знач Видео, Знач Клавиатура = "", Знач Разметка = "Markdown") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chat | Строка,Число | ID целевого чата или IDЧата*IDТемы |
  | Текст | --text | Строка | Текст сообщения |
  | Видео | --video | ДвоичныеДанные,Строка | Файл видео |
  | Клавиатура | --keyboard | Строка | JSON клавиатуры или путь к .json |
  | Разметка | --parsemode | Строка | Вид обработки текста (HTML, Markdown, MarkdownV2) |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Telegram

<br/>




```bsl title="Пример кода"
    Токен    = "6129457865:AAFyzNYOAFbu...";
    IDЧата   = "461699897";
    IDКанала = "@testsichee";
    Текст    = "Строковое значение";
    Видео    = "https://openyellow.neocities.org/test_data/video.mp4";

    ВидеоПуть = ПолучитьИмяВременногоФайла("mp4");
    КопироватьФайл(Видео, ВидеоПуть);

    ВидеоДД   = Новый ДвоичныеДанные(ВидеоПуть);

    Результат = OPI_Telegram.ОтправитьВидео(Токен, IDЧата, Текст, Видео);

    Результат = OPI_Telegram.ОтправитьВидео(Токен, IDКанала, Текст, ВидеоПуть);

    Результат = OPI_Telegram.ОтправитьВидео(Токен, IDКанала, Текст, ВидеоДД);
```



```sh title="Пример команды CLI"
    
  oint telegram ОтправитьВидео --token "6129457865:AAFyzNYOAFbu..." --chat "461699897" --text "Строковое значение" --video "https://openintegrations.dev/test_data/video.mp4" --keyboard %keyboard% --parsemode %parsemode%

```

```json title="Результат"
{
 "ok": true,
 "result": {
  "message_id": 8277,
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
  "date": 1728408239,
  "video": {
   "duration": 5,
   "width": 640,
   "height": 480,
   "file_name": "video",
   "mime_type": "video/mp4",
   "thumbnail": {
    "file_id": "AAMCAgADGQMAAiBVZwVqr_rWWRWdOupHTG6S76vJ6i4AAoVdAAL9yDBIsh0vx_6fbycBAAdtAAM2BA",
    "file_unique_id": "AQADhV0AAv3IMEhy",
    "file_size": 20106,
    "width": 320,
    "height": 240
   },
   "thumb": {
    "file_id": "AAMCAgADGQMAAiBVZwVqr_rWWRWdOupHTG6S76vJ6i4AAoVdAAL9yDBIsh0vx_6fbycBAAdtAAM2BA",
    "file_unique_id": "AQADhV0AAv3IMEhy",
    "file_size": 20106,
    "width": 320,
    "height": 240
   },
   "file_id": "BAACAgIAAxkDAAIgVWcFaq_61lkVnTrqR0xuku-ryeouAAKFXQAC_cgwSLIdL8f-n28nNgQ",
   "file_unique_id": "AgADhV0AAv3IMEg",
   "file_size": 1137878
  },
  "caption": "Строковое значение"
 }
}
```
