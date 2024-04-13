---
sidebar_position: 3
---

# Отправить видео
Отправляет видео в чат или канал


*Функция ОтправитьВидео(Знач Токен, Знач IDЧата, Знач Текст, Знач Видео, Знач Клавиатура = "") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chat | Строка/Число | ID целевого чата. Если необходима отправка в определенную тему, её номер нужно указывать через * (IDЧата*IDТемы) |
  | Текст | --text | Строка | Текст сообщения |
  | Видео | --video | Двоичные данные / Строка | Двоичные данные видео или путь к файлу **(формат - MP4)** |
  | Клавиатура | --keyboard | Строка (необяз.) | JSON клавиатуры. См. [Сформировать клавиатуру по массиву кнопок](./Sformirovat-klaviaturu-po-massivu-knopok) |
  | Разметка | --parsemode | Строка (необяз.) | Вид обработки текста (HTML, Markdown, MarkdownV2). Markdown по умолчанию |
  
  Вовзращаемое значение: Соответствие - сериализованный JSON ответа от Telegram


```bsl title="Пример кода"
	
	Токен       = "111111111:AACccNYOAFbuhAL5GAaaBbbbOjZYFvLZZZZ";
	Описание    = "Природа";
	ПутьКВидео  = "C:\video.mp4";
	
	Ответ = OPI_Telegram.ОтправитьВидео(Токен, 1234567890, Описание, ПутьКВидео); //Соответствие
	Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                                   //JSON строка                                            
	
```

![Результат](img/6.png)

```json title="Результат"

{
 "result": {
  "caption": "Природа",
  "video": {
   "file_size": 4057213,
   "file_id": "BAACAgIAAxkDAAMWZZkqV2M0extEs35nt26fVjfzvScAAgs-AAIG98lISPM63NtOju00BA",
   "thumb": {
    "height": 240,
    "width": 320,
    "file_size": 19154,
    "file_unique_id": "AQADCz4AAgb3yUhy",
    "file_id": "AAMCAgADGQMAAxZlmSpXYzR7G0Szfme3bp9WN_O9JwACCz4AAgb3yUhI8zrc206O7QEAB20AAzQE"
   },
   "thumbnail": {
    "height": 240,
    "width": 320,
    "file_size": 19154,
    "file_unique_id": "AQADCz4AAgb3yUhy",
    "file_id": "AAMCAgADGQMAAxZlmSpXYzR7G0Szfme3bp9WN_O9JwACCz4AAgb3yUhI8zrc206O7QEAB20AAzQE"
   },
   "height": 480,
   "mime_type": "video/mp4",
   "file_name": "video",
   "width": 640,
   "file_unique_id": "AgADCz4AAgb3yUg",
   "duration": 9
  },
  "date": 1704536663,
  "chat": {
   "username": "JKIee",
   "type": "private",
   "last_name": "Titowets",
   "first_name": "Anton",
   "id": 1234567890
  },
  "from": {
   "username": "sicheebot",
   "first_name": "Sichee",
   "is_bot": true,
   "id": 0987654321
  },
  "message_id": 22
 },
 "ok": true
}

```
