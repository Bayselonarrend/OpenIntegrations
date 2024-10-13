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
    Канал = "C07RKAL4EF7";
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
  "id": "C07R1A2DAS0",
  "name": "testconv2e86d4e6-e191-4d76-981d-e9680d2efc74",
  "is_channel": true,
  "is_group": false,
  "is_im": false,
  "is_mpim": false,
  "is_private": false,
  "created": 1728409452,
  "is_archived": false,
  "is_general": false,
  "unlinked": 0,
  "name_normalized": "testconv2e86d4e6-e191-4d76-981d-e9680d2efc74",
  "is_shared": false,
  "is_org_shared": false,
  "is_pending_ext_shared": false,
  "pending_shared": [],
  "context_team_id": "T06UD92BS3C",
  "updated": 1728409453555,
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
   "last_set": 1728409453
  },
  "purpose": {
   "value": "Тестовая цель",
   "creator": "U06UG1CAYH2",
   "last_set": 1728409453
  },
  "previous_names": []
 }
}
```
