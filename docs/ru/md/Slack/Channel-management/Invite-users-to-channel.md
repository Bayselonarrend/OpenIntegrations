---
sidebar_position: 7
---

# Пригласить пользователей в канал
 Добавляет указанных пользователей в канал


*Функция ПригласитьПользователейВКанал(Знач Токен, Знач Канал, Знач МассивПользователей) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | Канал | --channel | Строка | ID канала |
  | МассивПользователей | --users | Массив Из Строка | Массив ID пользователей |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack

```bsl title="Пример кода"
	
  
  Канал = "C070VPMKN8J";
  МассивПользователей = Новый Массив;
  МассивПользователей.Добавить("U06UG1CAYH2");
  
  Ответ = OPI_Slack.ПригласитьПользователейВКанал(Токен, Канал, МассивПользователей); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                                         //JSON строка
  
	
```

```sh title="Пример команды CLI"
    
  oint slack ПригласитьПользователейВКанал --token %token% --channel "C070VPMKN8J" --users %users%

```


```json title="Результат"

{
  "ok": true,
  "channel": {
  "id": "C070VPMKN8J",
  "name": "testconv9a14fe4d-2fb1-4e47-b1e4-9bc1e4f7a05c",
  "is_channel": true,
  "is_group": false,
  "is_im": false,
  "is_mpim": false,
  "is_private": false,
  "created": 1714146542,
  "is_archived": false,
  "is_general": false,
  "unlinked": 0,
  "name_normalized": "testconv9a14fe4d-2fb1-4e47-b1e4-9bc1e4f7a05c",
  "is_shared": false,
  "is_org_shared": false,
  "is_pending_ext_shared": false,
  "pending_shared": [],
  "context_team_id": "T06UD92BS3C",
  "updated": 1714146542983,
  "parent_conversation": null,
  "creator": "U06UG1CAYH2",
  "is_ext_shared": false,
  "shared_team_ids": [
  "T06UD92BS3C"
  ],
  "pending_connected_team_ids": [],
  "is_member": true,
  "last_read": "0000000000.000000",
  "topic": {
  "value": "Тестовая тема",
  "creator": "U06UG1CAYH2",
  "last_set": 1714146542
  },
  "purpose": {
  "value": "Тестовая цель",
  "creator": "U06UG1CAYH2",
  "last_set": 1714146542
  },
  "previous_names": []
  }
  }

```
