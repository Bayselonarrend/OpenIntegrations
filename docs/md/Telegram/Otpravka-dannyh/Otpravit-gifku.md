---
sidebar_position: 6
---

# Отправить гифку
 Отправляет гифку в чат или канал


*Функция ОтправитьГифку(Знач Токен, Знач IDЧата, Знач Текст, Знач Гифка, Знач Клавиатура = "", Знач Разметка = "Markdown") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chat | Строка,Число | ID целевого чата или IDЧата*IDТемы |
  | Текст | --text | Строка | Текст сообщения |
  | Гифка | --gif | ДвоичныеДанные,Строка | Файл гифки |
  | Клавиатура | --keyboard | Строка | JSON клавиатуры или путь к .json |
  | Разметка | --parsemode | Строка | Вид обработки текста (HTML, Markdown, MarkdownV2) |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Telegram

```bsl title="Пример кода"
	
    Токен    = "6129457865:AAFyzNYOAFbu...";
    IDЧата   = "461699897";
    IDКанала = "@testsichee";
    Текст    = "Строковое значение";
    Гифка    = "https://openintegrations.dev/test_data/animation.gif";
    
    ГифкаПуть = ПолучитьИмяВременногоФайла("gif");
    КопироватьФайл(Гифка, ГифкаПуть);
    
    ГифкаДД   = Новый ДвоичныеДанные(ГифкаПуть);
    
    Результат = OPI_Telegram.ОтправитьГифку(Токен, IDЧата, Текст, Гифка);
    
    OPI_ПолучениеДанныхТестов.ЗаписатьЛог(Результат, "ОтправитьГифку");
    
  
    Результат = OPI_Telegram.ОтправитьГифку(Токен, IDКанала, Текст, ГифкаПуть);
    
    OPI_ПолучениеДанныхТестов.ЗаписатьЛог(Результат, "ОтправитьГифку (Путь)");
    
      
    Результат = OPI_Telegram.ОтправитьГифку(Токен, IDКанала, Текст, ГифкаДД);

	
```

```sh title="Пример команд CLI"
    
  oint telegram ОтправитьГифку --token "6129457865:AAFyzNYOAFbu..." --chat "461699897" --text "Строковое значение" --gif "https://openintegrations.dev/test_data/animation.gif" --keyboard %keyboard% --parsemode %parsemode%

```


```json title="Результат"

{
 "ok": true,
 "result": {
  "message_id": 4583,
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
  "date": 1716912922,
  "animation": {
   "file_name": "animation.gif.mp4",
   "mime_type": "video/mp4",
   "duration": 3,
   "width": 220,
   "height": 220,
   "thumbnail": {
    "file_id": "AAMCAgADGQMAAhHnZlYDGcv1q979l-q7QAZU2eG-ozIAAjxTAAK-_rFKL0-gO37ABLEBAAdtAAM1BA",
    "file_unique_id": "AQADPFMAAr7-sUpy",
    "file_size": 11352,
    "width": 220,
    "height": 220
   },
   "thumb": {
    "file_id": "AAMCAgADGQMAAhHnZlYDGcv1q979l-q7QAZU2eG-ozIAAjxTAAK-_rFKL0-gO37ABLEBAAdtAAM1BA",
    "file_unique_id": "AQADPFMAAr7-sUpy",
    "file_size": 11352,
    "width": 220,
    "height": 220
   },
   "file_id": "CgACAgIAAxkDAAIR52ZWAxnL9ave_Zfqu0AGVNnhvqMyAAI8UwACvv6xSi9PoDt-wASxNQQ",
   "file_unique_id": "AgADPFMAAr7-sUo",
   "file_size": 84940
  },
  "document": {
   "file_name": "animation.gif.mp4",
   "mime_type": "video/mp4",
   "thumbnail": {
    "file_id": "AAMCAgADGQMAAhHnZlYDGcv1q979l-q7QAZU2eG-ozIAAjxTAAK-_rFKL0-gO37ABLEBAAdtAAM1BA",
    "file_unique_id": "AQADPFMAAr7-sUpy",
    "file_size": 11352,
    "width": 220,
    "height": 220
   },
   "thumb": {
    "file_id": "AAMCAgADGQMAAhHnZlYDGcv1q979l-q7QAZU2eG-ozIAAjxTAAK-_rFKL0-gO37ABLEBAAdtAAM1BA",
    "file_unique_id": "AQADPFMAAr7-sUpy",
    "file_size": 11352,
    "width": 220,
    "height": 220
   },
   "file_id": "CgACAgIAAxkDAAIR52ZWAxnL9ave_Zfqu0AGVNnhvqMyAAI8UwACvv6xSi9PoDt-wASxNQQ",
   "file_unique_id": "AgADPFMAAr7-sUo",
   "file_size": 84940
  },
  "caption": "Строковое значение"
 }
}

```
