---
sidebar_position: 3
---

# Отправить видео
 Отправляет видео в чат или канал


*Функция ОтправитьВидео(Знач Токен, Знач IDЧата, Знач Текст, Знач Видео, Знач Клавиатура = "", Знач Разметка = "Markdown") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chat | Строка,Число | ID целевого чата или IDЧата*IDТемы |
  | Текст | --text | Строка | Текст сообщения |
  | Видео | --video | ДвоичныеДанные,Строка | Файл видео |
  | Клавиатура | --keyboard | Строка | JSON клавиатуры или путь к .json |
  | Разметка | --parsemode | Строка | Вид обработки текста (HTML, Markdown, MarkdownV2) |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Telegram

```bsl title="Пример кода"
	
    Токен    = "6129457865:AAFyzNYOAFbu...";
    IDЧата   = "461699897";
    IDКанала = "@testsichee";
    Текст    = "Строковое значение";
    Видео    = "https://openintegrations.dev/test_data/video.mp4";
    
    ВидеоПуть = ПолучитьИмяВременногоФайла("mp4");
    КопироватьФайл(Видео, ВидеоПуть);
    
    ВидеоДД   = Новый ДвоичныеДанные(ВидеоПуть);
    
    Результат = OPI_Telegram.ОтправитьВидео(Токен, IDЧата, Текст, Видео);
    
    OPI_ПолучениеДанныхТестов.ЗаписатьЛог(Результат, "ОтправитьВидео", "Telegram");
    
  
    Результат = OPI_Telegram.ОтправитьВидео(Токен, IDКанала, Текст, ВидеоПуть);
    
    OPI_ПолучениеДанныхТестов.ЗаписатьЛог(Результат, "ОтправитьВидео (Путь)");
    
      
    Результат = OPI_Telegram.ОтправитьВидео(Токен, IDКанала, Текст, ВидеоДД);

	
```

```sh title="Пример команд CLI"
    
  oint telegram ОтправитьВидео --token "6129457865:AAFyzNYOAFbu..." --chat "461699897" --text "Строковое значение" --video "https://openintegrations.dev/test_data/video.mp4" --keyboard %keyboard% --parsemode %parsemode%

```


```json title="Результат"

{
 "ok": true,
 "result": {
  "message_id": 4580,
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
  "date": 1716912885,
  "video": {
   "duration": 5,
   "width": 640,
   "height": 480,
   "file_name": "video",
   "mime_type": "video/mp4",
   "thumbnail": {
    "file_id": "AAMCAgADGQMAAhHkZlYC9F8B0Un8MHVScfHOiFv6G0cAAjdTAAK-_rFKFwcMWDe49_4BAAdtAAM1BA",
    "file_unique_id": "AQADN1MAAr7-sUpy",
    "file_size": 20106,
    "width": 320,
    "height": 240
   },
   "thumb": {
    "file_id": "AAMCAgADGQMAAhHkZlYC9F8B0Un8MHVScfHOiFv6G0cAAjdTAAK-_rFKFwcMWDe49_4BAAdtAAM1BA",
    "file_unique_id": "AQADN1MAAr7-sUpy",
    "file_size": 20106,
    "width": 320,
    "height": 240
   },
   "file_id": "BAACAgIAAxkDAAIR5GZWAvRfAdFJ_DB1UnHxzohb-htHAAI3UwACvv6xShcHDFg3uPf-NQQ",
   "file_unique_id": "AgADN1MAAr7-sUo",
   "file_size": 1137878
  },
  "caption": "Строковое значение"
 }
}

```
