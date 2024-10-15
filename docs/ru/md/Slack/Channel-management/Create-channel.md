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
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint slack СоздатьКанал --token "***" \
              --title "testconv9d2a1472-7419-436a-a418-a8a70d5b9ec3" \
              --private false
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint slack СоздатьКанал ^
              --token "***" ^
              --title "testconv9d2a1472-7419-436a-a418-a8a70d5b9ec3" ^
              --private false
        ```
    </TabItem>
</Tabs>


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
  "updated": 1728409452819,
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
