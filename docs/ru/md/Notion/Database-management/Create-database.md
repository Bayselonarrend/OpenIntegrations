---
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
 "id": "11882aa7-fc4e-8162-a031-ce830261bcd1",
 "cover": null,
 "icon": null,
 "created_time": "2024-10-07T06:21:00Z",
 "created_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "last_edited_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "last_edited_time": "2024-10-07T06:21:00Z",
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
  "Номер": {
   "id": "CBK%5D",
   "name": "Номер",
   "type": "number",
   "number": {
    "format": "number"
   }
  },
  "Дата создания": {
   "id": "E%3DZE",
   "name": "Дата создания",
   "type": "date",
   "date": {}
  },
  "Активен": {
   "id": "Rv~m",
   "name": "Активен",
   "type": "checkbox",
   "checkbox": {}
  },
  "Картинка": {
   "id": "TDEz",
   "name": "Картинка",
   "type": "files",
   "files": {}
  },
  "Почта": {
   "id": "%5DKRt",
   "name": "Почта",
   "type": "email",
   "email": {}
  },
  "Сайт": {
   "id": "dAUn",
   "name": "Сайт",
   "type": "url",
   "url": {}
  },
  "Пользователь": {
   "id": "gB%7Cl",
   "name": "Пользователь",
   "type": "people",
   "people": {}
  },
  "Описание": {
   "id": "maiK",
   "name": "Описание",
   "type": "rich_text",
   "rich_text": {}
  },
  "Статус": {
   "id": "%7C%3AJl",
   "name": "Статус",
   "type": "select",
   "select": {
    "options": [
     {
      "id": "8fbbbedc-8723-4bf8-b2bc-05d47d0eec13",
      "name": "Новый",
      "color": "green",
      "description": null
     },
     {
      "id": "07e425da-fe59-4b57-9b0a-dcd6ed148014",
      "name": "В работе",
      "color": "yellow",
      "description": null
     },
     {
      "id": "39ca2d21-ef71-4865-95cd-ead627943bf1",
      "name": "Удаленный",
      "color": "red",
      "description": null
     }
    ]
   }
  },
  "Телефон": {
   "id": "%7DzZ%40",
   "name": "Телефон",
   "type": "phone_number",
   "phone_number": {}
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
 "url": "https://www.notion.so/11882aa7fc4e8162a031ce830261bcd1",
 "public_url": null,
 "archived": false,
 "in_trash": false,
 "request_id": "bbfa055e-aca7-4ec2-89e9-412f06ecf902"
}
```
