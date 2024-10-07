---
sidebar_position: 9
---

# Вступить в канал
 Добавляет текущего бота в канал



`Функция ВступитьВКанал(Знач Токен, Знач Канал) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | Канал | --channel | Строка | ID канала |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack

<br/>




```bsl title="Пример кода"
    Токен = "xoxb-6965308400114-696804637...";
    Канал = "C07PK52ES3U";

    Результат = OPI_Slack.ВступитьВКанал(Токен, Канал);
```



```sh title="Пример команды CLI"
    
  oint slack ВступитьВКанал --token %token% --channel "C070VPMKN8J"

```

```json title="Результат"
{
 "ok": true,
 "channel": {
  "id": "C07R0U4U6D7",
  "name": "testconv76331e59-afc3-4e50-b307-7657cb0d4ea8",
  "is_channel": true,
  "is_group": false,
  "is_im": false,
  "is_mpim": false,
  "is_private": false,
  "created": 1728282089,
  "is_archived": false,
  "is_general": false,
  "unlinked": 0,
  "name_normalized": "testconv76331e59-afc3-4e50-b307-7657cb0d4ea8",
  "is_shared": false,
  "is_org_shared": false,
  "is_pending_ext_shared": false,
  "pending_shared": [],
  "context_team_id": "T06UD92BS3C",
  "updated": 1728282089834,
  "parent_conversation": null,
  "creator": "U06UG1CAYH2",
  "is_ext_shared": false,
  "shared_team_ids": [
   "T06UD92BS3C"
  ],
  "pending_connected_team_ids": [],
  "is_member": true,
  "last_read": "1728282090.282599",
  "topic": {
   "value": "Тестовая тема",
   "creator": "U06UG1CAYH2",
   "last_set": 1728282089
  },
  "purpose": {
   "value": "Тестовая цель",
   "creator": "U06UG1CAYH2",
   "last_set": 1728282089
  },
  "previous_names": [],
  "priority": 0
 }
}
```
