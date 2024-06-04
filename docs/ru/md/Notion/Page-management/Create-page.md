---
sidebar_position: 1
---

# Создать страницу
 Создает дочернюю страницу над другой страницей-родителем


*Функция СоздатьСтраницу(Знач Токен, Знач Родитель, Знач Заголовок) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Родитель | --page | Строка | ID Родителя |
  | Заголовок | --title | Строка | Заголовок страницы |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Notion

```bsl title="Пример кода"
	
  
  Токен     = "secret_9RsfMrRMqZwqp0Zl0B...";
  Родитель  = "5dd94c34fab04bff9...";
  Заголовок = "Создано из 1С";
  
  Ответ = OPI_Notion.СоздатьСтраницу(Токен, Родитель, Заголовок);
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);
  

	
```

```sh title="Пример команды CLI"
    
  oint notion СоздатьСтраницу --token "secret_9RsfMrRMqZwqp0Zl0B..." --page "5dd94c34fab04bff9..." --title "Создано из 1С"

```


```json title="Результат"

{
  "request_id": "f145f634-ea3a-4f74-b079-f365ecbcf583",
  "public_url": null,
  "url": "https://www.notion.so/1-4392f919813c4c8d84017d973bddaabf",
  "properties": {
  "title": {
  "title": [
  {
  "plain_text": "Создано из 1С",
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
  "content": "Создано из 1С"
  },
  "href": null,
  "type": "text"
  }
  ],
  "type": "title",
  "id": "title"
  }
  },
  "parent": {
  "page_id": "5dd94c34-fab0-4bff-986b-7511c0779f77",
  "type": "page_id"
  },
  "cover": null,
  "archived": false,
  "created_by": {
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0",
  "object": "user"
  },
  "last_edited_time": "2024-01-26T17:20:00.000Z",
  "icon": null,
  "created_time": "2024-01-26T17:20:00.000Z",
  "last_edited_by": {
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0",
  "object": "user"
  },
  "id": "4392f919-813c-4c8d-8401-7d973bddaabf",
  "object": "page"
  }

```
