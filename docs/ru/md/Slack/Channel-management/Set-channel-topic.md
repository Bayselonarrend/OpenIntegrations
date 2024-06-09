---
sidebar_position: 11
---

# Установить тему канала
 Устанавливает тему канала


*Функция УстановитьТемуКанала(Знач Токен, Знач Канал, Знач Тема) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | Канал | --channel | Строка | ID канала |
  | Тема | --theme | Строка | Тема канала |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack

```bsl title="Пример кода"
	
  
  Канал = "C070VPMKN8J";
  Тема  = "Тестовая тема";
  
  Ответ = OPI_Slack.УстановитьТемуКанала(Токен, Канал, Тема); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                 //JSON строка
  
	
```

```sh title="Пример команды CLI"
    
  oint slack УстановитьТемуКанала --token %token% --channel "C070VPMKN8J" --theme "Тестовая тема"

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
  "updated": 1714146542817,
  "parent_conversation": null,
  "creator": "U06UG1CAYH2",
  "is_ext_shared": false,
  "shared_team_ids": [
  "T06UD92BS3C"
  ],
  "pending_connected_team_ids": [],
  "is_member": false,
  "topic": {
  "value": "Тестовая тема",
  "creator": "U06UG1CAYH2",
  "last_set": 1714146542
  },
  "purpose": {
  "value": "",
  "creator": "",
  "last_set": 0
  },
  "previous_names": []
  }
  }

```
