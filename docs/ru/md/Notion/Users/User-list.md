﻿---
sidebar_position: 1
---

# Список пользователей
 Возвращает список пользователей рабочего пространства



`Функция СписокПользователей(Знач Токен) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Notion

<br/>




```bsl title="Пример кода"
  
  Токен = "secret_9RsfMrRMqZwqp0Zl0B...";
  Ответ = OPI_Notion.СписокПользователей(Токен);
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);
```
	


```sh title="Пример команды CLI"
    
  oint notion СписокПользователей --token "secret_9RsfMrRMqZwqp0Zl0B..."

```

```json title="Результат"
{
  "request_id": "ea9a6b96-0b02-4866-a60a-2958e514af38",
  "user": {},
  "type": "user",
  "has_more": false,
  "next_cursor": null,
  "results": [
  {
  "person": {
  "email": "ex@gmail.com"
  },
  "type": "person",
  "avatar_url": null,
  "name": "Bayselonarrends",
  "id": "ed71865a-9891-1111-86cd-11111111",
  "object": "user"
  },
  {
  "type": "bot",
  "avatar_url": null,
  "name": "1C Integration",
  "bot": {
  "workspace_name": "Bayselonarrends Notion",
  "owner": {
  "workspace": true,
  "type": "workspace"
  }
  },
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0",
  "object": "user"
  }
  ],
  "object": "list"
  }
```
