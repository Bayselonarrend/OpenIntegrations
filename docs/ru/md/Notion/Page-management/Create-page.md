---
sidebar_position: 1
---

# Создать страницу
 Создает дочернюю страницу над другой страницей-родителем



`Функция СоздатьСтраницу(Знач Токен, Знач Родитель, Знач Заголовок) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Родитель | --page | Строка | ID Родителя |
  | Заголовок | --title | Строка | Заголовок страницы |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Notion

<br/>




```bsl title="Пример кода"
    Токен     = "secret_9RsfMrRMqZwqp0Zl0B...";
    Родитель  = "5dd94c34fab04bff986b7511c0779f77";
    Заголовок = "Тестовый заголовок";

    Результат = OPI_Notion.СоздатьСтраницу(Токен, Родитель, Заголовок);
```



```sh title="Пример команды CLI"
    
  oint notion СоздатьСтраницу --token "secret_9RsfMrRMqZwqp0Zl0B..." --page "5dd94c34fab04bff9..." --title "Создано из 1С"

```

```json title="Результат"
{
 "object": "page",
 "id": "11882aa7-fc4e-81a4-b41d-dd6260f8f929",
 "created_time": "2024-10-07T18:41:00Z",
 "last_edited_time": "2024-10-07T18:41:00Z",
 "created_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "last_edited_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "cover": null,
 "icon": null,
 "parent": {
  "type": "page_id",
  "page_id": "5dd94c34-fab0-4bff-986b-7511c0779f77"
 },
 "archived": false,
 "in_trash": false,
 "properties": {
  "title": {
   "id": "title",
   "type": "title",
   "title": [
    {
     "type": "text",
     "text": {
      "content": "Тестовый заголовок",
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
     "plain_text": "Тестовый заголовок",
     "href": null
    }
   ]
  }
 },
 "url": "https://www.notion.so/11882aa7fc4e81a4b41ddd6260f8f929",
 "public_url": null,
 "request_id": "8bc85038-6095-4450-8600-28a0309c1473"
}
```
