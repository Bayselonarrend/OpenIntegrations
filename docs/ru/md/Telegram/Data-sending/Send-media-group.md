---
sidebar_position: 7
---

# Отправить группу медиафайлов
 Отправляет набор файлов в чат или канал. Варианты типов медиа: audio, document, photo, video



`Функция ОтправитьМедиагруппу(Знач Токен, Знач IDЧата, Знач Текст, Знач СоответствиеФайлов, Знач Клавиатура = "", Знач Разметка = "Markdown") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chat | Строка,Число | ID целевого чата или IDЧата*IDТемы |
  | Текст | --text | Строка | Текст сообщения |
  | СоответствиеФайлов | --media | Соответствие из Строка | JSON файлов или путь к .json |
  | Клавиатура | --keyboard | Строка | JSON клавиатуры или путь к .json |
  | Разметка | --parsemode | Строка | Вид обработки текста (HTML, Markdown, MarkdownV2) |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Telegram

<br/>

:::tip
Соответствие файлов: Ключ - Файл, Значение - один из типов медиа
:::
<br/>


```bsl title="Пример кода"
    Токен    = "6129457865:AAFyzNYOAFbu...";
    IDЧата   = "461699897";
    Текст    = "Строковое значение";
    Картинка = "https://openyellow.neocities.org/test_data/picture.jpg";
    Видео    = "https://openyellow.neocities.org/test_data/video.mp4";

    КартинкаПуть = ПолучитьИмяВременногоФайла("png");
    КопироватьФайл(Картинка, КартинкаПуть);

    ВидеоПуть = ПолучитьИмяВременногоФайла("mp4");
    КопироватьФайл(Видео, ВидеоПуть);

    ВидеоДД   = Новый ДвоичныеДанные(ВидеоПуть);

    Медиагруппа    = Новый Соответствие;
    Медиагруппа.Вставить(КартинкаПуть, "photo");
    Медиагруппа.Вставить(ВидеоДД     , "video");

    Результат = OPI_Telegram.ОтправитьМедиагруппу(Токен, IDЧата, Текст, Медиагруппа);
```



```sh title="Пример команды CLI"
    
  oint telegram ОтправитьМедиагруппу --token "111111111:AACccNYOAFbuhAL5GAaaBbbbOjZYFvLZZZZ" --chat %chat% --text %text% --media %media% --keyboard %keyboard% --parsemode %parsemode%

```

```json title="Результат"
{
 "ok": true,
 "result": [
  {
   "message_id": 8254,
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
   "date": 1728325408,
   "media_group_id": "13826603269975418",
   "photo": [
    {
     "file_id": "AgACAgIAAxkDAAIfmWb-MR8PQhrvZHiqLmG6UdiAAznzAALj5DEb1I7wSxB3bmqDIveAAQADAgADcwADNgQ",
     "file_unique_id": "AQAD4-QxG9SO8Et4",
     "file_size": 1568,
     "width": 90,
     "height": 67
    },
    {
     "file_id": "AgACAgIAAxkDAAIfmWb-MR8PQhrvZHiqLmG6UdiAAznzAALj5DEb1I7wSxB3bmqDIveAAQADAgADbQADNgQ",
     "file_unique_id": "AQAD4-QxG9SO8Ety",
     "file_size": 21633,
     "width": 320,
     "height": 240
    },
    {
     "file_id": "AgACAgIAAxkDAAIfmWb-MR8PQhrvZHiqLmG6UdiAAznzAALj5DEb1I7wSxB3bmqDIveAAQADAgADeAADNgQ",
     "file_unique_id": "AQAD4-QxG9SO8Et9",
     "file_size": 99260,
     "width": 800,
     "height": 600
    },
    {
     "file_id": "AgACAgIAAxkDAAIfmWb-MR8PQhrvZHiqLmG6UdiAAznzAALj5DEb1I7wSxB3bmqDIveAAQADAgADeQADNgQ",
     "file_unique_id": "AQAD4-QxG9SO8Et-",
     "file_size": 218651,
     "width": 1280,
     "height": 960
    },
    {
     "file_id": "AgACAgIAAxkDAAIfmWb-MR8PQhrvZHiqLmG6UdiAAznzAALj5DEb1I7wSxB3bmqDIveAAQADAgADdwADNgQ",
     "file_unique_id": "AQAD4-QxG9SO8Et8",
     "file_size": 650214,
     "width": 2560,
     "height": 1920
    }
   ],
   "caption": "Строковое значение"
  },
  {
   "message_id": 8255,
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
   "date": 1728325408,
   "media_group_id": "13826603269975418",
   "video": {
    "duration": 5,
    "width": 640,
    "height": 480,
    "file_name": "video1",
    "mime_type": "video/mp4",
    "thumbnail": {
     "file_id": "AAMCAgADFQdnBCcg8MEkt4wl01_KaOjjhetpwQAC12EAAgNlIUjB99k9Tj5_dwEAB20AAzYE",
     "file_unique_id": "AQAD12EAAgNlIUhy",
     "file_size": 20106,
     "width": 320,
     "height": 240
    },
    "thumb": {
     "file_id": "AAMCAgADFQdnBCcg8MEkt4wl01_KaOjjhetpwQAC12EAAgNlIUjB99k9Tj5_dwEAB20AAzYE",
     "file_unique_id": "AQAD12EAAgNlIUhy",
     "file_size": 20106,
     "width": 320,
     "height": 240
    },
    "file_id": "BAACAgIAAxUHZwQnIPDBJLeMJdNfymjo44XracEAAtdhAAIDZSFIwffZPU4-f3c2BA",
    "file_unique_id": "AgAD12EAAgNlIUg",
    "file_size": 1137878
   }
  }
 ]
}
```
