---
sidebar_position: 11
---

# Переслать сообщение
Пересылает сообщение между чатами или в рамках одного чата


*Функция ПереслатьСообщение(Знач Токен, Знач IDОригинала, Знач ОткудаID, Знач КудаID) Экспорт*

  | Параметр | Тип | Назначение |
  |-|-|-|
  | Токен | Строка | Токен бота |
  | IDОригинала | Строка/Число | ID сообщения для пересылки |
  | ОткудаID | Строка/Число | ID чата источника |
  | КудаID | Строка/Число | ID чата приемника. Если необходима отправка в определенную тему, её номер нужно указывать через * (КудаID*IDТемы) |
  
  Вовзращаемое значение: Соответствие - сериализованный JSON ответа от Telegram


```bsl title="Пример кода"
	
	Токен = "111111111:AACccNYOAFbuhAL5GAaaBbbbOjZYFvLZZZZ";
	
	Ответ = OPI_Telegram.ПереслатьСообщение(Токен, 211, "@testsichee", 1234567890)  //Соответствие
	Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                                     //JSON строка
	
```

![Результат](img/14.png)

```json title="Результат"

{
 "result": {
  "text": "Привет из канала",
  "forward_date": 1704551053,
  "forward_from_message_id": 211,
  "forward_from_chat": {
   "type": "channel",
   "username": "testsichee",
   "title": "Тестовый канал",
   "id": -1111111111111
  },      
  "date": 1704551074,
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
  "forward_origin": {
   "date": 1704551053,
   "chat": {
    "type": "channel",
    "username": "testsichee",
    "title": "Тестовый канал",
    "id": -1111111111111
   },
   "message_id": 211,
   "type": "channel"
  },
  "message_id": 34
 },
 "ok": true
}

```
