﻿---
sidebar_position: 3
---

# Изменить свойства базы
 Изменяет свойства существующей базы



`Функция ИзменитьСвойстваБазы(Знач Токен, Знач База, Знач Свойства = "", Знач Заголовок = "", Знач Описание = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | База | --base | Строка | ID целевой базы |
  | Свойства | --props | Соответствие из КлючИЗначение | Новые или изменяемые свойства базы данных |
  | Заголовок | --title | Строка | Новый заголовок базы |
  | Описание | --description | Строка | Новое описание базы |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Notion

<br/>




```bsl title="Пример кода"
    Токен     = "secret_9RsfMrRMqZwqp0Zl0B...";
    База      = "11282aa7-fc4e-810b-ab77-cef5a2a3443e";

    Заголовок    = "Тестовый заголовок";
    Описание     = "Тестовое описание";

    Свойства = Новый Соответствие;
    Свойства.Вставить("Почта", "rich_text"); // Тип поля "Почта" будет изменен с email на текст
    Свойства.Вставить("Сайт");               // Поле "Сайт" будет удалено

    Результат = OPI_Notion.ИзменитьСвойстваБазы(Токен, База, Свойства, Заголовок, Описание);
```



```sh title="Пример команды CLI"
    
  oint notion ИзменитьСвойстваБазы --token "secret_9RsfMrRMqZwqp0Zl0B..." --base "5dd94c34fab04bff9..." --props %props% --title "Обновленный заголовок" --description "Обновленное описание базы"

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
   "type": "rich_text",
   "rich_text": {}
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
 "request_id": "4bb4498e-c32c-491c-9da1-e1c82c99ba88"
}
```
