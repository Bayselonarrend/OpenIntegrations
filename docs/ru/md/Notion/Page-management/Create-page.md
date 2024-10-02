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
 "id": "11282aa7-fc4e-8130-aeea-ff3703303064",
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
 "url": "https://www.notion.so/11282aa7fc4e8130aeeaff3703303064",
 "public_url": null,
 "request_id": "1f348c02-5a3d-4bb5-8b62-81c4a909bf4b"
}
```
