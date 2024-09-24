﻿---
sidebar_position: 2
---

# Получить информацию о канале
Тут можно получить ID пользователей канала. ID для бота необходимо получать из прилетов на Webhook ID пользователя из информации о канале не подойдет для отправки сообщений через бота - они разные



`Функция ПолучитьИнформациюОКанале(Знач Токен) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Viber

<br/>




```bsl title="Пример кода"
    Токен     = "523b58ba82afffaa-7ef3b426...";
    Результат = OPI_Viber.ПолучитьИнформациюОКанале(Токен);
```



```sh title="Пример команды CLI"
    
  oint viber ПолучитьИнформациюОКанале --token %token%

```

```json title="Результат"
{
  "members": [
  {
  "role": "admin",
  "name": "John",
  "id": "d3jxe611111111kjYGgZg=="
  }
  ],
  "subcategory": "Advertising Service",
  "category": "Local Businesses",
  "location": {
  "lon": -73.96878,
  "lat": 40.7691018
  },
  "icon": "https://media-direct.cdn.viber.com/pg_download?pgtp=icons&dlid=0-04-01-05bfe24da13dddf32cf52976b099dc6965c03300763e6a9316de26986e5dea05&fltp=jpg&imsz=0000",
  "subscribers_count": 0,
  "name": "1CTestBot",
  "chat_hostname": "SN-CHAT-01_",
  "id": "pa:5925429953186752236",
  "country": "US",
  "uri": "1ctestbot",
  "status_message": "ok",
  "status": 0
  }
```
