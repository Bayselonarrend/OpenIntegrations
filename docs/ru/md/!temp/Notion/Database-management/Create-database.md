---
sidebar_position: 1
---

# Создать базу данных
 Создает базу данных


*Функция СоздатьБазуДанных(Знач Токен, Знач Родитель, Знач Заголовок, Знач Свойства = "") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Родитель | --page | Строка | ID страницы родителя |
  | Заголовок | --title | Строка | Заголовок базы данных |
  | Свойства | --props | Структура Из Строка | Свойства базы данных |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Notion

```bsl title="Пример кода"
	
  
  Токен     = "secret_9RsfMrRMqZwqp0Zl0B...";
  Родитель  = "5dd94c34fab04bff9...";
  Заголовок = "Эта база была создана из 1С";
  
  Свойства = Новый Соответствие;
  Свойства.Вставить("Имя"            , "title");      //Поле с типом title - обязательно
  Свойства.Вставить("Описание"       , "rich_text");
  Свойства.Вставить("Номер"          , "number");
  Свойства.Вставить("Статус"         , "status");
  Свойства.Вставить("Дата создания"  , "date");
  Свойства.Вставить("Картинка"       , "files");
  Свойства.Вставить("Активен"        , "checkbox");
  Свойства.Вставить("Сайт"           , "url");
  Свойства.Вставить("Почта"          , "email");
  Свойства.Вставить("Телефон"        , "phone_number");
  Свойства.Вставить("Пользователь"   , "people");
  
  ВыборЗначения = Новый Соответствие;
  ВыборЗначения.Вставить("Новый", "green");
  ВыборЗначения.Вставить("В работе", "yellow");
  ВыборЗначения.Вставить("Удаленный", "red");
  Свойства.Вставить("Статус", ВыборЗначения);
  
  Ответ = OPI_Notion.СоздатьБазуДанных(Токен, Родитель, Заголовок, Свойства);
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);
  

	
```

```sh title="Пример команд CLI"
    
  oint notion СоздатьБазуДанных --token %token% --page %page% --title %title% --props %props%

```


```json title="Результат"

{
  "request_id": "43adcae7-c8ee-4a7d-aba6-c2c43ad2c33b",
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
  "Сайт": {
  "url": {},
  "type": "url",
  "name": "Сайт",
  "id": "THre"
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
  "email": {},
  "type": "email",
  "name": "Почта",
  "id": "%3CO%3AD"
  }
  },
  "last_edited_time": "2024-01-26T16:49:00.000Z",
  "description": [],
  "created_by": {
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0",
  "object": "user"
  },
  "archived": false,
  "icon": null,
  "created_time": "2024-01-26T16:49:00.000Z",
  "title": [
  {
  "plain_text": "Эта база была создана из 1С",
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
  "content": "Эта база была создана из 1С"
  },
  "href": null,
  "type": "text"
  }
  ],
  "cover": null,
  "is_inline": false,
  "id": "048ba0ce-4f47-4e33-9005-40d249b01949",
  "last_edited_by": {
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0",
  "object": "user"
  },
  "object": "database"
  }

```
