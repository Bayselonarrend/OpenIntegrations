---
sidebar_position: 3
---

# Получить данные о пользователе
Получает данные о пользователе

*Функция ПолучитьДанныеПользователя(Знач Токен, Знач IDПользователя) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен канала или бота |
  | IDПользователя | --user | Строка | ID целевого пользователя |
  
  Вовзращаемое значение: Соответствие - сериализованный JSON ответа от Viber

```bsl title="Пример кода"
	
	Ответ = OPI_Viber.ПолучитьДанныеПользователя(Токен, IDПользователя);  //Соответствие
	Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                           //JSON строка
	
```

```json title="Результат"

{
 "user": {
  "device_type": "iPhone8,4",
  "mnc": 1,
  "mcc": 257,
  "api_version": 10,
  "primary_device_os": "iOS 15.6.1",
  "viber_version": "21.6.0.18",
  "country": "FR",
  "language": "ru",
  "avatar": "http://dl-media.viber.com/1/share/2/long/bots/generic-avatar%402x.png",
  "name": "Subscriber",
  "id": "d3jxe6111111NkjYGgZg=="
 },
 "chat_hostname": "SN-CHAT-07_",
 "status_message": "ok",
 "status": 0
}

```
