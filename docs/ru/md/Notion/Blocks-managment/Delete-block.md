---
sidebar_position: 4
---

# Удалить блок
 Удаляет блок по ID



`Функция УдалитьБлок(Знач Токен, Знач ИДБлока) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | ИДБлока | --block | Строка | ID блока |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Notion

<br/>




```bsl title="Пример кода"
    Токен  = "secret_9RsfMrRMqZwqp0Zl0B...";
    Блок   = "11282aa7-fc4e-8108-ad2f-ed75fb53373d";

    Результат = OPI_Notion.УдалитьБлок(Токен, Блок);
```



```sh title="Пример команды CLI"
    
  oint notion УдалитьБлок --token "secret_9RsfMrRMqZwqp0Zl0B..." --block %block%

```

```json title="Результат"
{
 "object": "block",
 "id": "11282aa7-fc4e-8131-a317-cc9db5aab1bc",
 "parent": {
  "type": "page_id",
  "page_id": "5dd94c34-fab0-4bff-986b-7511c0779f77"
 },
 "created_time": "2024-10-01T18:37:00Z",
 "last_edited_time": "2024-10-01T18:37:00Z",
 "created_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "last_edited_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "has_children": false,
 "archived": true,
 "in_trash": true,
 "type": "to_do",
 "to_do": {
  "rich_text": [
   {
    "type": "text",
    "text": {
     "content": "YoYO",
     "link": null
    },
    "annotations": {
     "bold": false,
     "italic": false,
     "strikethrough": false,
     "underline": false,
     "code": false,
     "color": "default"
    },
    "plain_text": "YoYO",
    "href": null
   }
  ],
  "checked": false,
  "color": "default"
 },
 "request_id": "ca37158c-9843-462c-b75d-f7b722da6c3f"
}
```
