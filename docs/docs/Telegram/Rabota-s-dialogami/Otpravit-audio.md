---
sidebar_position: 5
---

# Отправить аудио
Отправляет аудиофайл в чат или канал


*Функция ОтправитьАудио(Знач Токен, Знач IDЧата, Знач Текст, Знач Аудио, Знач Клавиатура = "") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chat | Строка/Число | ID целевого чата. Если необходима отправка в определенную тему, её номер нужно указывать через * (IDЧата*IDТемы) |
  | Текст | --text | Строка | Текст сообщения |
  | Аудио | --audio | Двоичные данные / Строка | Двоичные данные аудио или путь к файлу |
  | Клавиатура | --keyboard | Строка (необяз.) | JSON клавиатуры. См. [Сформировать клавиатуру по массиву кнопок](./Sformirovat-klaviaturu-po-massivu-knopok) |
  | Разметка | --parsemode | Строка (необяз.) | Вид обработки текста (HTML, Markdown, MarkdownV2). Markdown по умолчанию |
  
  Вовзращаемое значение: Соответствие - сериализованный JSON ответа от Telegram


```bsl title="Пример кода"
	
	Токен       = 111111111:AACccNYOAFbuhAL5GAaaBbbbOjZYFvLZZZZ;
	Описание    = "Крутая песня";
	ПутьКПесне  = "C:\song.mp3";
	
	Ответ = OPI_Telegram.ОтправитьАудио(Токен, 1234567890, Описание, ПутьКПесне); //Соответствие
	Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                                   //JSON строка                                            
	
```

```sh title="Пример команд CLI"

    oint telegram ОтправитьАудио --token "%token%" --chat %channelid% --text "Крутая песня" --audio "C:\song.mp3"

```

![Результат](img/8.png)

```json title="Результат"

{
 "result": {
  "caption": "Крутая песня",
  "audio": {
   "file_size": 9229352,
   "file_id": "CQACAgIAAxkDAAMZZZk4hgQeno7HIq5rbfhqofcfr6AAAog8AAIG99FI8QhH6WO7rcI0BA",
   "performer": "Motorhead",
   "title": "Dogs",
   "mime_type": "audio/mpeg",
   "file_name": "audio",
   "file_unique_id": "AgADiDwAAgb30Ug",
   "duration": 228
  },
  "date": 1704540294,
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
  "message_id": 25
 },
 "ok": true
}

```
