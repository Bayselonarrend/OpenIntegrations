---
sidebar_position: 12
---

# Установить цель канала
 Устанавливает цель (описание) канала



`Функция УстановитьЦельКанала(Знач Токен, Знач Канал, Знач Цель) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | Канал | --channel | Строка | ID канала |
  | Цель | --purpose | Строка | Цель канала |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack

<br/>




```bsl title="Пример кода"
    Токен = "xoxb-6965308400114-696804637...";
    Канал = "C07PK52ES3U";
    Цель  = "Тестовая цель";

    Результат = OPI_Slack.УстановитьЦельКанала(Токен, Канал, Цель);
```



```sh title="Пример команды CLI"
    
  oint slack УстановитьЦельКанала --token %token% --channel "C070VPMKN8J" --purpose "Тестовая цель"

```

```json title="Результат"
{
 "ok": true,
 "channel": {
  "id": "C07QQ65RW02",
  "name": "testconv4d39071e-1406-4e21-a213-ac891ef8063c",
  "is_channel": true,
  "is_group": false,
  "is_im": false,
  "is_mpim": false,
  "is_private": false,
  "created": 1728306068,
  "is_archived": false,
  "is_general": false,
  "unlinked": 0,
  "name_normalized": "testconv4d39071e-1406-4e21-a213-ac891ef8063c",
  "is_shared": false,
  "is_org_shared": false,
  "is_pending_ext_shared": false,
  "pending_shared": [],
  "context_team_id": "T06UD92BS3C",
  "updated": 1728306069267,
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
   "last_set": 1728306068
  },
  "purpose": {
   "value": "Тестовая цель",
   "creator": "U06UG1CAYH2",
   "last_set": 1728306069
  },
  "previous_names": []
 }
}
```
