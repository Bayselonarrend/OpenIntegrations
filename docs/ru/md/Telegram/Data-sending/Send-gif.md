---
sidebar_position: 6
---

# Отправить гифку
 Отправляет гифку в чат или канал



`Функция ОтправитьГифку(Знач Токен, Знач IDЧата, Знач Текст, Знач Гифка, Знач Клавиатура = "", Знач Разметка = "Markdown") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chat | Строка, Число | ID целевого чата или IDЧата*IDТемы |
  | Текст | --text | Строка | Текст сообщения |
  | Гифка | --gif | ДвоичныеДанные, Строка | Файл гифки |
  | Клавиатура | --keyboard | Строка | Клавиатура. См. СформироватьКлавиатуруПоМассивуКнопок |
  | Разметка | --parsemode | Строка | Вид обработки текста (HTML, Markdown, MarkdownV2) |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Telegram

<br/>

:::tip
Метод в документации API: [sendAnimation](https://core.telegram.org/bots/api#sendanimation)
:::
<br/>


```bsl title="Пример кода"
    Токен    = "6129457865:AAFyzNYOAFbu...";
    IDЧата   = "461699897";
    IDКанала = "@testsichee";
    Текст    = "Строковое значение";
    Гифка    = "https://api.athenaeum.digital/test_data/animation.gif";

    ГифкаПуть = ПолучитьИмяВременногоФайла("gif");
    КопироватьФайл(Гифка, ГифкаПуть);

    ГифкаДД   = Новый ДвоичныеДанные(ГифкаПуть);

    Результат = OPI_Telegram.ОтправитьГифку(Токен, IDЧата, Текст, Гифка);

    Результат = OPI_Telegram.ОтправитьГифку(Токен, IDКанала, Текст, ГифкаПуть);

    Результат = OPI_Telegram.ОтправитьГифку(Токен, IDКанала, Текст, ГифкаДД);
```



```sh title="Пример команды CLI"
    
  oint telegram ОтправитьГифку --token "6129457865:AAFyzNYOAFbu..." --chat "461699897" --text "Строковое значение" --gif "https://openintegrations.dev/test_data/animation.gif" --keyboard %keyboard% --parsemode %parsemode%

```

```json title="Результат"
{
 "ok": true,
 "result": {
  "message_id": 8281,
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
  "date": 1728408327,
  "animation": {
   "file_name": "animation.gif.mp4",
   "mime_type": "video/mp4",
   "duration": 3,
   "width": 220,
   "height": 220,
   "thumbnail": {
    "file_id": "AAMCAgADGQMAAiBZZwVrB8GrJepNEDXFhbigEdscxfoAAo1dAAL9yDBIUjhALv9X_RcBAAdtAAM2BA",
    "file_unique_id": "AQADjV0AAv3IMEhy",
    "file_size": 11352,
    "width": 220,
    "height": 220
   },
   "thumb": {
    "file_id": "AAMCAgADGQMAAiBZZwVrB8GrJepNEDXFhbigEdscxfoAAo1dAAL9yDBIUjhALv9X_RcBAAdtAAM2BA",
    "file_unique_id": "AQADjV0AAv3IMEhy",
    "file_size": 11352,
    "width": 220,
    "height": 220
   },
   "file_id": "CgACAgIAAxkDAAIgWWcFawfBqyXqTRA1xYW4oBHbHMX6AAKNXQAC_cgwSFI4QC7_V_0XNgQ",
   "file_unique_id": "AgADjV0AAv3IMEg",
   "file_size": 84941
  },
  "document": {
   "file_name": "animation.gif.mp4",
   "mime_type": "video/mp4",
   "thumbnail": {
    "file_id": "AAMCAgADGQMAAiBZZwVrB8GrJepNEDXFhbigEdscxfoAAo1dAAL9yDBIUjhALv9X_RcBAAdtAAM2BA",
    "file_unique_id": "AQADjV0AAv3IMEhy",
    "file_size": 11352,
    "width": 220,
    "height": 220
   },
   "thumb": {
    "file_id": "AAMCAgADGQMAAiBZZwVrB8GrJepNEDXFhbigEdscxfoAAo1dAAL9yDBIUjhALv9X_RcBAAdtAAM2BA",
    "file_unique_id": "AQADjV0AAv3IMEhy",
    "file_size": 11352,
    "width": 220,
    "height": 220
   },
   "file_id": "CgACAgIAAxkDAAIgWWcFawfBqyXqTRA1xYW4oBHbHMX6AAKNXQAC_cgwSFI4QC7_V_0XNgQ",
   "file_unique_id": "AgADjV0AAv3IMEg",
   "file_size": 84941
  },
  "caption": "Строковое значение"
 }
}
```
