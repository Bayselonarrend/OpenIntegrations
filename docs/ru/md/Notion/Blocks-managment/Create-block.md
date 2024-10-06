---
sidebar_position: 1
---

# Создать блок
 Создает новый блок на основе существующего блока



`Функция СоздатьБлок(Знач Токен, Знач Родитель, Знач Блок, Знач ВставитьПосле = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Родитель | --page | Строка | ID родительского блока или страницы |
  | Блок | --block | Строка,Соответствие Из КлючИЗначение | ID блока или сам блок образец |
  | ВставитьПосле | --prev | Строка | ID блока, после которого необходимо встаивть новый |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Notion

<br/>




```bsl title="Пример кода"
    Токен     = "secret_9RsfMrRMqZwqp0Zl0B...";
    Родитель  = "5dd94c34fab04bff986b7511c0779f77";
    Блок      = "d7021bdd15b944ababcb02bd2b1a5f6a";

    ДанныеБлока = OPI_Notion.ВернутьБлок(Токен, Блок);
    Результат   = OPI_Notion.СоздатьБлок(Токен, Родитель, ДанныеБлока);
```



```sh title="Пример команды CLI"
    
  oint notion СоздатьБлок --token "secret_9RsfMrRMqZwqp0Zl0B..." --page "5dd94c34fab04bff9..." --block %block% --prev %prev%

```

```json title="Результат"
{
 "object": "list",
 "results": [
  {
   "object": "block",
   "id": "11782aa7-fc4e-8190-8ad2-f18cce6f4c74",
   "parent": {
    "type": "page_id",
    "page_id": "5dd94c34-fab0-4bff-986b-7511c0779f77"
   },
   "created_time": "2024-10-06T14:28:00Z",
   "last_edited_time": "2024-10-06T14:28:00Z",
   "created_by": {
    "object": "user",
    "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
   },
   "last_edited_by": {
    "object": "user",
    "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
   },
   "has_children": false,
   "archived": false,
   "in_trash": false,
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
   }
  }
 ],
 "next_cursor": null,
 "has_more": false,
 "type": "block",
 "block": {},
 "request_id": "6442f99c-aea3-4ef6-9a14-778f0e4162d4"
}
```
