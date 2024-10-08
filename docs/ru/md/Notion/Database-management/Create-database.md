﻿---
sidebar_position: 1
---

# Создать базу данных
 Создает базу данных



`Функция СоздатьБазуДанных(Знач Токен, Знач Родитель, Знач Заголовок, Знач Свойства = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Родитель | --page | Строка | ID страницы родителя |
  | Заголовок | --title | Строка | Заголовок базы данных |
  | Свойства | --props | Структура Из Строка | Свойства базы данных |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Notion

<br/>




```bsl title="Пример кода"
    Токен     = "secret_9RsfMrRMqZwqp0Zl0B...";
    Родитель  = "5dd94c34fab04bff986b7511c0779f77";
    Заголовок = "Тестовый заголовок";

    Свойства = Новый Соответствие;
    Свойства.Вставить("Имя"            , "title");
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
    ВыборЗначения.Вставить("Новый"    , "green");
    ВыборЗначения.Вставить("В работе" , "yellow");
    ВыборЗначения.Вставить("Удаленный", "red");

    Свойства.Вставить("Статус", ВыборЗначения);

    Результат = OPI_Notion.СоздатьБазуДанных(Токен, Родитель, Заголовок, Свойства);
```



```sh title="Пример команды CLI"
    
  oint notion СоздатьБазуДанных --token "secret_9RsfMrRMqZwqp0Zl0B..." --page "5dd94c34fab04bff9..." --title "Эта база была создана из 1С" --props %props%

```

```json title="Результат"
{
 "object": "database",
 "id": "11982aa7-fc4e-817b-8882-f2ec929e9249",
 "cover": null,
 "icon": null,
 "created_time": "2024-10-08T17:43:00Z",
 "created_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "last_edited_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "last_edited_time": "2024-10-08T17:43:00Z",
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
 ],
 "description": [],
 "is_inline": false,
 "properties": {
  "Картинка": {
   "id": "GwHP",
   "name": "Картинка",
   "type": "files",
   "files": {}
  },
  "Активен": {
   "id": "I%5Cit",
   "name": "Активен",
   "type": "checkbox",
   "checkbox": {}
  },
  "Номер": {
   "id": "LYhy",
   "name": "Номер",
   "type": "number",
   "number": {
    "format": "number"
   }
  },
  "Телефон": {
   "id": "N%3A%60j",
   "name": "Телефон",
   "type": "phone_number",
   "phone_number": {}
  },
  "Почта": {
   "id": "_GzL",
   "name": "Почта",
   "type": "email",
   "email": {}
  },
  "Пользователь": {
   "id": "fqnB",
   "name": "Пользователь",
   "type": "people",
   "people": {}
  },
  "Статус": {
   "id": "k_dl",
   "name": "Статус",
   "type": "select",
   "select": {
    "options": [
     {
      "id": "6d76ff5e-d6d1-4266-b808-5372ec81a8da",
      "name": "Новый",
      "color": "green",
      "description": null
     },
     {
      "id": "bb54e060-bb63-4529-a3e2-f3908ecefd15",
      "name": "В работе",
      "color": "yellow",
      "description": null
     },
     {
      "id": "9b82a353-458a-415b-9c4f-2caf681c3a13",
      "name": "Удаленный",
      "color": "red",
      "description": null
     }
    ]
   }
  },
  "Дата создания": {
   "id": "lFrr",
   "name": "Дата создания",
   "type": "date",
   "date": {}
  },
  "Сайт": {
   "id": "wD%5Cz",
   "name": "Сайт",
   "type": "url",
   "url": {}
  },
  "Описание": {
   "id": "zAM%7D",
   "name": "Описание",
   "type": "rich_text",
   "rich_text": {}
  },
  "Имя": {
   "id": "title",
   "name": "Имя",
   "type": "title",
   "title": {}
  }
 },
 "parent": {
  "type": "page_id",
  "page_id": "5dd94c34-fab0-4bff-986b-7511c0779f77"
 },
 "url": "https://www.notion.so/11982aa7fc4e817b8882f2ec929e9249",
 "public_url": null,
 "archived": false,
 "in_trash": false,
 "request_id": "4c5c3faf-690d-4768-9949-2f176f02a2fe"
}
```
