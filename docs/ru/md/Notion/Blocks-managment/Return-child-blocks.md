---
sidebar_position: 3
---

# Вернуть дочерние блоки
 Созвращает список дочерних блоков блока-родителя


*Функция ВернутьДочерниеБлоки(Знач Токен, Знач ИДБлока) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | ИДБлока | --block | Строка | ID блока родителя |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Notion

```bsl title="Пример кода"
	
  
  Токен = "secret_9RsfMrRMqZwqp0Zl0B...";
  Блок  = "46c1500ed40c4e89ba6a22900...";
  
  Ответ = OPI_Notion.ВернутьДочерниеБлоки(Токен, ИДБлока);
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);
  

	
```

```sh title="Пример команды CLI"
    
  oint notion ВернутьДочерниеБлоки --token "secret_9RsfMrRMqZwqp0Zl0B..." --block %block%


```


```json title="Результат"

{
  "request_id": "fea2a37b-5507-451d-a4be-14433811a69e",
  "block": {},
  "type": "block",
  "has_more": false,
  "next_cursor": null,
  "results": [
  {
  "type": "numbered_list_item",
  "archived": false,
  "created_by": {
  "id": "ed71865a-9891-46bc-86cd-a92aa499cfdb",
  "object": "user"
  },
  "last_edited_time": "2024-01-26T20:33:00.000Z",
  "created_time": "2024-01-26T17:02:00.000Z",
  "has_children": false,
  "parent": {
  "block_id": "46c1500e-d40c-4e89-ba6a-229003d81ded",
  "type": "block_id"
  },
  "last_edited_by": {
  "id": "ed71865a-9891-46bc-86cd-a92aa499cfdb",
  "object": "user"
  },
  "id": "aa4137d4-c8cc-445d-9f96-9c3968334e74",
  "numbered_list_item": {
  "color": "default",
  "rich_text": [
  {
  "plain_text": "Два",
  "annotations": {
  "color": "default",
  "code": false,
  "underline": false,
  "strikethrough": false,
  "italic": false,
  "bold": false
  },
  "text": {
  "link": null,
  "content": "Два"
  },
  "href": null,
  "type": "text"
  }
  ]
  },
  "object": "block"
  },
  {
  "type": "numbered_list_item",
  "archived": false,
  "created_by": {
  "id": "ed71865a-9891-46bc-86cd-a92aa499cfdb",
  "object": "user"
  },
  "last_edited_time": "2024-01-26T20:33:00.000Z",
  "created_time": "2024-01-26T20:30:00.000Z",
  "has_children": false,
  "parent": {
  "block_id": "46c1500e-d40c-4e89-ba6a-229003d81ded",
  "type": "block_id"
  },
  "last_edited_by": {
  "id": "ed71865a-9891-46bc-86cd-a92aa499cfdb",
  "object": "user"
  },
  "id": "6fb45895-0350-49d3-a5c7-e0cb1e24061e",
  "numbered_list_item": {
  "color": "default",
  "rich_text": [
  {
  "plain_text": "Три",
  "annotations": {
  "color": "default",
  "code": false,
  "underline": false,
  "strikethrough": false,
  "italic": false,
  "bold": false
  },
  "text": {
  "link": null,
  "content": "Три"
  },
  "href": null,
  "type": "text"
  }
  ]
  },
  "object": "block"
  }
  ],
  "object": "list"
  }

```
