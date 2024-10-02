---
sidebar_position: 2
---

# Получить базу данных
 Получить данные о базе данных



`Функция ПолучитьБазуДанных(Знач Токен, Знач База) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | База | --base | Строка | ID базы данных |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Notion

<br/>




```bsl title="Пример кода"
    Токен = "secret_9RsfMrRMqZwqp0Zl0B...";
    База  = "11282aa7-fc4e-810b-ab77-cef5a2a3443e";

    Результат = OPI_Notion.ПолучитьБазуДанных(Токен, База);
```



```sh title="Пример команды CLI"
    
  oint notion ПолучитьБазуДанных --token "secret_9RsfMrRMqZwqp0Zl0B..." --base "048ba0ce4f474e33900540d24..."

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
 "description": [
  {
   "type": "text",
   "text": {
    "content": "Тестовое описание",
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
   "plain_text": "Тестовое описание",
   "href": null
  }
 ],
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
   "type": "rich_text",
   "rich_text": {}
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
 "request_id": "407565dc-a29b-41ef-b77a-e4aa90a1d940"
}
```
