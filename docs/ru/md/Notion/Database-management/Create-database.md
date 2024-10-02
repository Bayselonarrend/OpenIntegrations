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
 "id": "11282aa7-fc4e-811c-9177-def14ccc3095",
 "cover": null,
 "icon": null,
 "created_time": "2024-10-01T18:37:00Z",
 "created_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "last_edited_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "last_edited_time": "2024-10-01T18:37:00Z",
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
  "Описание": {
   "id": "%3DiF~",
   "name": "Описание",
   "type": "rich_text",
   "rich_text": {}
  },
  "Дата создания": {
   "id": "COOh",
   "name": "Дата создания",
   "type": "date",
   "date": {}
  },
  "Сайт": {
   "id": "LBbt",
   "name": "Сайт",
   "type": "url",
   "url": {}
  },
  "Телефон": {
   "id": "%5Dtmh",
   "name": "Телефон",
   "type": "phone_number",
   "phone_number": {}
  },
  "Статус": {
   "id": "bWOW",
   "name": "Статус",
   "type": "select",
   "select": {
    "options": [
     {
      "id": "0d638280-6bd6-4578-a4c1-50cc8ae01134",
      "name": "Новый",
      "color": "green",
      "description": null
     },
     {
      "id": "959d19f5-ca90-43cf-b890-6f3b4024fcbb",
      "name": "В работе",
      "color": "yellow",
      "description": null
     },
     {
      "id": "77673cfa-b130-48fc-907a-1e54a6c8f621",
      "name": "Удаленный",
      "color": "red",
      "description": null
     }
    ]
   }
  },
  "Номер": {
   "id": "fD%7Dp",
   "name": "Номер",
   "type": "number",
   "number": {
    "format": "number"
   }
  },
  "Почта": {
   "id": "ktOk",
   "name": "Почта",
   "type": "email",
   "email": {}
  },
  "Активен": {
   "id": "qa%40q",
   "name": "Активен",
   "type": "checkbox",
   "checkbox": {}
  },
  "Пользователь": {
   "id": "yX%3F%5D",
   "name": "Пользователь",
   "type": "people",
   "people": {}
  },
  "Картинка": {
   "id": "%7D%5CeH",
   "name": "Картинка",
   "type": "files",
   "files": {}
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
 "url": "https://www.notion.so/11282aa7fc4e811c9177def14ccc3095",
 "public_url": null,
 "archived": false,
 "in_trash": false,
 "request_id": "2a66a23e-8251-4c41-9f18-7faefaa61abe"
}
```
