---
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
   "type": "rich_text",
   "rich_text": {}
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
 "request_id": "458a8356-0bad-4bfa-9e51-9b50b6aadfe1"
}
```
