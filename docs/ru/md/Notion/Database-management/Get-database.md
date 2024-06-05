---
sidebar_position: 2
---

# Получить базу данных
 Получить данные о базе данных


*Функция ПолучитьБазуДанных(Знач Токен, Знач База) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | База | --base | Строка | ID базы данных |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Notion

```bsl title="Пример кода"
	
      
      Токен         = "secret_9RsfMrRMqZwqp0Zl0B...";
      База          = "048ba0ce4f474e33900540d24...";
      
      Ответ = OPI_Notion.ПолучитьБазуДанных(Токен, База);
      Ответ = OPI_Инструменты.JSONСтрокой(Ответ);
      
    
	
```

```sh title="Пример команды CLI"
    
      oint notion ПолучитьБазуДанных --token "secret_9RsfMrRMqZwqp0Zl0B..." --base "048ba0ce4f474e33900540d24..."


```


```json title="Результат"

{
  "request_id": "9c6e06e9-ffa5-4a3c-b4ff-0368553ca066",
  "public_url": null,
  "url": "https://www.notion.so/048ba0ce4f474e33900540d249b01949",
  "parent": {
  "page_id": "5dd94c34-fab0-4bff-986b-7511c0779f77",
  "type": "page_id"
  },
  "properties": {
  "Картинка": {
  "files": {},
  "type": "files",
  "name": "Картинка",
  "id": "r%3Dfa"
  },
  "Активен": {
  "checkbox": {},
  "type": "checkbox",
  "name": "Активен",
  "id": "q%3FQF"
  },
  "Телефон": {
  "phone_number": {},
  "type": "phone_number",
  "name": "Телефон",
  "id": "hDII"
  },
  "Пользователь": {
  "people": {},
  "type": "people",
  "name": "Пользователь",
  "id": "%5D%40Md"
  },
  "Описание": {
  "rich_text": {},
  "type": "rich_text",
  "name": "Описание",
  "id": "KnG%3F"
  },
  "Статус": {
  "select": {
  "options": [
  {
  "description": null,
  "color": "red",
  "name": "Удаленный",
  "id": "a71d6e8a-4f3e-4dfd-9f0e-4d90e400fde7"
  },
  {
  "description": null,
  "color": "yellow",
  "name": "В работе",
  "id": "aa6300b4-c635-4ab4-b5cd-87d14e45dd11"
  },
  {
  "description": null,
  "color": "green",
  "name": "Новый",
  "id": "202b1d30-2095-40f1-8b91-f627d475d560"
  }
  ]
  },
  "type": "select",
  "name": "Статус",
  "id": "IDW%3C"
  },
  "Номер": {
  "type": "number",
  "name": "Номер",
  "number": {
  "format": "number"
  },
  "id": "CH__"
  },
  "Дата создания": {
  "date": {},
  "type": "date",
  "name": "Дата создания",
  "id": "BQN%5B"
  },
  "Имя": {
  "title": {},
  "type": "title",
  "name": "Имя",
  "id": "title"
  },
  "Почта": {
  "rich_text": {},
  "type": "rich_text",
  "name": "Почта",
  "id": "%3CO%3AD"
  }
  },
  "last_edited_time": "2024-01-26T18:28:00.000Z",
  "description": [
  {
  "plain_text": "Обновленное описание базы",
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
  "content": "Обновленное описание базы"
  },
  "href": null,
  "type": "text"
  }
  ],
  "created_by": {
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0",
  "object": "user"
  },
  "archived": false,
  "icon": null,
  "created_time": "2024-01-26T16:49:00.000Z",
  "title": [
  {
  "plain_text": "Обновленный заголовок",
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
  "content": "Обновленный заголовок"
  },
  "href": null,
  "type": "text"
  }
  ],
  "cover": null,
  "is_inline": false,
  "id": "048ba0ce-4f47-4e33-9005-40d249b01949",
  "last_edited_by": {
  "id": "ed71865a-9891-46bc-86cd-a92aa499cfdb",
  "object": "user"
  },
  "object": "database"
  }

```
