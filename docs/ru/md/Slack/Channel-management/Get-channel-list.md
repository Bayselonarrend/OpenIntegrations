---
sidebar_position: 1
---

# Получить список каналов
 Получает список доступных каналов



`Функция ПолучитьСписокКаналов(Знач Токен, Знач ИсключатьАрхивированные = Ложь, Знач Курсор = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | ИсключатьАрхивированные | --notarchived | Булево | Признак исключения архивированных каналов |
  | Курсор | --cursor | Строка | Указатель из предыдущего запроса, если строк результата > 100 |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack

<br/>




```bsl title="Пример кода"
    Токен = "xoxb-6965308400114-696804637...";

    Результат = OPI_Slack.ПолучитьСписокКаналов(Токен);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```bash
            oint slack ПолучитьСписокКаналов --token "***"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint slack ПолучитьСписокКаналов ^
              --token "***"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "ok": true,
 "channels": [
  {
   "id": "C06UD92DF1Q",
   "name": "general",
   "is_channel": true,
   "is_group": false,
   "is_im": false,
   "is_mpim": false,
   "is_private": false,
   "created": 1713202497,
   "is_archived": false,
   "is_general": true,
   "unlinked": 0,
   "name_normalized": "general",
   "is_shared": false,
   "is_org_shared": false,
   "is_pending_ext_shared": false,
   "pending_shared": [],
   "context_team_id": "T06UD92BS3C",
   "updated": 1724394518358,
   "parent_conversation": null,
   "creator": "U06UABH3APP",
   "is_ext_shared": false,
   "shared_team_ids": [
    "T06UD92BS3C"
   ],
   "pending_connected_team_ids": [],
   "is_member": false,
   "topic": {
    "value": "",
    "creator": "",
    "last_set": 0
   },
   "purpose": {
    "value": "This is the one channel that will always include everyone. It’s a great spot for announcements and team-wide conversations.",
    "creator": "U06UABH3APP",
    "last_set": 1713202497
   },
   "properties": {
    "use_case": "welcome"
   },
   "previous_names": [],
   "num_members": 1
  },
  {
   "id": "C06UFNUTKUL",
   "name": "slack-api-librarry",
   "is_channel": true,
   "is_group": false,
   "is_im": false,
   "is_mpim": false,
   "is_private": false,
   "created": 1713202541,
   "is_archived": false,
   "is_general": false,
   "unlinked": 0,
   "name_normalized": "slack-api-librarry",
   "is_shared": false,
   "is_org_shared": false,
   "is_pending_ext_shared": false,
   "pending_shared": [],
   "context_team_id": "T06UD92BS3C",
   "updated": 1724394515808,
   "parent_conversation": null,
   "creator": "U06UABH3APP",
   "is_ext_shared": false,
   "shared_team_ids": [
    "T06UD92BS3C"
   ],
   "pending_connected_team_ids": [],
   "is_member": true,
   "topic": {
    "value": "",
    "creator": "",
    "last_set": 0
   },
   "purpose": {
    "value": "This channel is for everything #slack-api-librarry. Hold meetings, share docs, and make decisions together with your team.",
    "creator": "U06UABH3APP",
    "last_set": 1713202541
   },
   "properties": {
    "tabs": [
     {
      "id": "files",
      "label": "",
      "type": "files"
     }
    ],
    "use_case": "project"
   },
   "previous_names": [],
   "num_members": 2
  },
  {
   "id": "C06UW6XHU5V",
   "name": "testconvd9226ab3-0341-4abb-97c4-a185b7ace9e8",
   "is_channel": true,
   "is_group": false,
   "is_im": false,
   "is_mpim": false,
   "is_private": false,
   "created": 1713701752,
   "is_archived": true,
   "is_general": false,
   "unlinked": 0,
   "name_normalized": "testconvd9226ab3-0341-4abb-97c4-a185b7ace9e8",
   "is_shared": false,
   "is_org_shared": false,
   "is_pending_ext_shared": false,
   "pending_shared": [],
   "context_team_id": "T06UD92BS3C",
   "updated": 1724394515915,
   "parent_conversation": null,
   "creator": "U06UG1CAYH2",
   "is_ext_shared": false,
   "shared_team_ids": [
    "T06UD92BS3C"
   ],
   "pending_connected_team_ids": [],
   "is_member": false,
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
   "num_members": 0
  },
  {
   "id": "C06UWD6523Z",
   "name": "testconvdfd146d0-f8c0-4e9f-9df8-56cc13c7e1dc",
   "is_channel": true,
   "is_group": false,
   "is_im": false,
   "is_mpim": false,
   "is_private": false,
   "created": 1713712534,
   "is_archived": true,
   "is_general": false,
   "unlinked": 0,
   "name_normalized": "testconvdfd146d0-f8c0-4e9f-9df8-56cc13c7e1dc",
   "is_shared": false,
...
```
