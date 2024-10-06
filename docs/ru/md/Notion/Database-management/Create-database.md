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
 "id": "11782aa7-fc4e-8167-b90a-c8b2f3c5c72e",
 "cover": null,
 "icon": null,
 "created_time": "2024-10-06T14:27:00Z",
 "created_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "last_edited_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "last_edited_time": "2024-10-06T14:27:00Z",
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
   "id": "%3F%60%7BP",
   "name": "Номер",
   "type": "number",
   "number": {
    "format": "number"
   }
  },
  "Телефон": {
   "id": "%40Me%5C",
   "name": "Телефон",
   "type": "phone_number",
   "phone_number": {}
  },
  "Дата создания": {
   "id": "%40qjA",
   "name": "Дата создания",
   "type": "date",
   "date": {}
  },
  "Почта": {
   "id": "Fh%5CZ",
   "name": "Почта",
   "type": "email",
   "email": {}
  },
  "Статус": {
   "id": "KB%5DZ",
   "name": "Статус",
   "type": "select",
   "select": {
    "options": [
     {
      "id": "4856776c-7581-47d8-974d-22a13d730813",
      "name": "Новый",
      "color": "green",
      "description": null
     },
     {
      "id": "e37de655-b6c5-490e-a2d1-70e833bb40a7",
      "name": "В работе",
      "color": "yellow",
      "description": null
     },
     {
      "id": "d3eec698-deea-416d-8dda-0caf992c6d33",
      "name": "Удаленный",
      "color": "red",
      "description": null
     }
    ]
   }
  },
  "Картинка": {
   "id": "YvwY",
   "name": "Картинка",
   "type": "files",
   "files": {}
  },
  "Пользователь": {
   "id": "%5B%3Ao%5D",
   "name": "Пользователь",
   "type": "people",
   "people": {}
  },
  "Активен": {
   "id": "%5CXyn",
   "name": "Активен",
   "type": "checkbox",
   "checkbox": {}
  },
  "Сайт": {
   "id": "fdQE",
   "name": "Сайт",
   "type": "url",
   "url": {}
  },
  "Описание": {
   "id": "sZRq",
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
 "url": "https://www.notion.so/11782aa7fc4e8167b90ac8b2f3c5c72e",
 "public_url": null,
 "archived": false,
 "in_trash": false,
 "request_id": "9e3acf22-b221-48ef-bd78-eda43ee4b8a3"
}
```
