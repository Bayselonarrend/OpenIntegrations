---
sidebar_position: 3
---

# Создать канал
 Создает новый канал



`Функция СоздатьКанал(Знач Токен, Знач Название, Знач Приватный = Ложь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | Название | --title | Строка | Наименование канала |
  | Приватный | --private | Булево | Создать канал приватным |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack

<br/>




```bsl title="Пример кода"
    Токен = "xoxb-6965308400114-696804637...";
    Имя   = "testconv" + Строка(Новый УникальныйИдентификатор);

    Результат = OPI_Slack.СоздатьКанал(Токен, Имя);
```



```sh title="Пример команды CLI"
    
  oint slack СоздатьКанал --token %token% --title %title% --private %private%

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
  "updated": 1728306068424,
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
   "value": "",
   "creator": "",
   "last_set": 0
  },
  "purpose": {
   "value": "",
   "creator": "",
   "last_set": 0
  },
  "previous_names": [],
  "priority": 0
 }
}
```
