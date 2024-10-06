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
   "type": "rich_text",
   "rich_text": {}
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
 "request_id": "68889524-14e9-48bf-bebb-4bb83006b73d"
}
```
