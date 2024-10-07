---
sidebar_position: 13
---

# Переименовать канал
 Изменяет название канала



`Функция ПереименоватьКанал(Знач Токен, Знач Канал, Знач Название) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | Канал | --channel | Строка | ID канала |
  | Название | --title | Строка | Новое название канала |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack

<br/>




```bsl title="Пример кода"
    Токен    = "xoxb-6965308400114-696804637...";
    Канал    = "C07PK52ES3U";
    Название = "testconv" + Строка(Новый УникальныйИдентификатор);

    Результат = OPI_Slack.ПереименоватьКанал(Токен, Канал, Название);
```



```sh title="Пример команды CLI"
    
  oint slack ПереименоватьКанал --token %token% --channel "C070VPMKN8J" --title %title%

```

```json title="Результат"
{
 "ok": true,
 "channel": {
  "id": "C07QQ65RW02",
  "name": "testconvcc9f0e10-eac5-4c75-b22d-14b868e63b34",
  "is_channel": true,
  "is_group": false,
  "is_im": false,
  "is_mpim": false,
  "is_private": false,
  "created": 1728306068,
  "is_archived": false,
  "is_general": false,
  "unlinked": 0,
  "name_normalized": "testconvcc9f0e10-eac5-4c75-b22d-14b868e63b34",
  "is_shared": false,
  "is_org_shared": false,
  "is_pending_ext_shared": false,
  "pending_shared": [],
  "context_team_id": "T06UD92BS3C",
  "updated": 1728306071489,
  "parent_conversation": null,
  "creator": "U06UG1CAYH2",
  "is_ext_shared": false,
  "shared_team_ids": [
   "T06UD92BS3C"
  ],
  "pending_connected_team_ids": [],
  "is_member": true,
  "last_read": "1728306069.719369",
  "topic": {
   "value": "Тестовая тема",
   "creator": "U06UG1CAYH2",
   "last_set": 1728306068
  },
  "purpose": {
   "value": "Тестовая цель",
   "creator": "U06UG1CAYH2",
   "last_set": 1728306069
  },
  "previous_names": [
   "testconv4d39071e-1406-4e21-a213-ac891ef8063c"
  ]
 }
}
```
