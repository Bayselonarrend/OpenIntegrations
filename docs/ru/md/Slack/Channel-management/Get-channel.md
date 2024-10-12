---
sidebar_position: 5
---

# Получить канал
 Получает информацию о канале



`Функция ПолучитьКанал(Знач Токен, Знач Канал) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | Канал | --channel | Строка | ID канала |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack

<br/>




```bsl title="Пример кода"
    Токен = "xoxb-6965308400114-696804637...";
    Канал = "C07R61HC15M";

    Результат = OPI_Slack.ПолучитьКанал(Токен, Канал);
```



```sh title="Пример команды CLI"
    
  oint slack ПолучитьКанал --token %token% --channel "C070VPMKN8J"

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
  "is_member": true,
  "last_read": "0000000000.000000",
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
