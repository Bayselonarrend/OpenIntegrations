---
sidebar_position: 1
---

# Получить список каналов
 Получает список доступных каналов


<br/>


`Функция ПолучитьСписокКаналов(Знач Токен, Знач ИсключатьАрхивированные = Ложь, Знач Курсор = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | ИсключатьАрхивированные | --notarchived | Булево | Признак исключения архивированных каналов |
  | Курсор | --cursor | Строка | Указатель из предыдущего запроса, если строк результата > 100 |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack

<br/>




```bsl title="Пример кода"
ИсключатьАрхивированные = Истина;
  
  Ответ = OPI_Slack.ПолучитьСписокКаналов(Токен, ИсключатьАрхивированные); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                              //JSON строка
```
	


```sh title="Пример команды CLI"
    
  oint slack ПолучитьСписокКаналов --token %token% --notarchived "Истина" --cursor %cursor%

```

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
  "updated": 1713202497794,
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
  }
  ]
  }
```
