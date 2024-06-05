---
sidebar_position: 3
---

# Получить страницу
 Получает информацию о странице по ID


*Функция ПолучитьСтраницу(Знач Токен, Знач Страница) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Страница | --page | Строка | ID страницы |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Notion

```bsl title="Пример кода"
	
      
      Токен     = "secret_9RsfMrRMqZwqp0Zl0B...";
      Страница  = "a574281614174169bf55dbae4...";
      
      Ответ = OPI_Notion.ПолучитьСтраницу(Токен, Страница);
      Ответ = OPI_Инструменты.JSONСтрокой(Ответ);
      
    
	
```

```sh title="Пример команды CLI"
    
      oint notion ПолучитьСтраницу --token "secret_9RsfMrRMqZwqp0Zl0B..." --page "a574281614174169bf55dbae4..."


```


```json title="Результат"

{
  "request_id": "61eaaa91-41fc-4523-a445-602805afb281",
  "public_url": null,
  "url": "https://www.notion.so/a574281614174169bf55dbae44f46d9c",
  "properties": {
  "Картинка": {
  "files": [
  {
  "external": {
  "url": "https://pricep-farkop.ru/wp-content/uploads/2017/02/17.jpg"
  },
  "type": "external",
  "name": "Лого"
  }
  ],
  "type": "files",
  "id": "r%3Dfa"
  },
  "Активен": {
  "checkbox": false,
  "type": "checkbox",
  "id": "q%3FQF"
  },
  "Телефон": {
  "phone_number": "88005553535",
  "type": "phone_number",
  "id": "hDII"
  },
  "Пользователь": {
  "people": [],
  "type": "people",
  "id": "%5D%40Md"
  },
  "Описание": {
  "rich_text": [
  {
  "plain_text": "Наш первый клиент",
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
  "content": "Наш первый клиент"
  },
  "href": null,
  "type": "text"
  }
  ],
  "type": "rich_text",
  "id": "KnG%3F"
  },
  "Статус": {
  "select": {
  "color": "green",
  "name": "Новый",
  "id": "202b1d30-2095-40f1-8b91-f627d475d560"
  },
  "type": "select",
  "id": "IDW%3C"
  },
  "Номер": {
  "type": "number",
  "number": 1,
  "id": "CH__"
  },
  "Дата создания": {
  "date": {
  "time_zone": null,
  "end": null,
  "start": "2024-01-26T09:45:00.000+00:00"
  },
  "type": "date",
  "id": "BQN%5B"
  },
  "Имя": {
  "title": [
  {
  "plain_text": "ООО Вектор",
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
  "content": "ООО Вектор"
  },
  "href": null,
  "type": "text"
  }
  ],
  "type": "title",
  "id": "title"
  },
  "Почта": {
  "rich_text": [
  {
  "plain_text": "vector@mail.ru",
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
  "content": "vector@mail.ru"
  },
  "href": null,
  "type": "text"
  }
  ],
  "type": "rich_text",
  "id": "%3CO%3AD"
  }
  },
  "parent": {
  "database_id": "048ba0ce-4f47-4e33-9005-40d249b01949",
  "type": "database_id"
  },
  "cover": {
  "external": {
  "url": "https://opi.neocities.org/assets/images/logo_long-e69f28017feff1759ffcfe3f4e7bbf2a.png"
  },
  "type": "external"
  },
  "archived": false,
  "created_by": {
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0",
  "object": "user"
  },
  "last_edited_time": "2024-01-26T19:30:00.000Z",
  "icon": {
  "external": {
  "url": "https://opi.neocities.org/img/logo.png"
  },
  "type": "external"
  },
  "created_time": "2024-01-26T18:45:00.000Z",
  "last_edited_by": {
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0",
  "object": "user"
  },
  "id": "a5742816-1417-4169-bf55-dbae44f46d9c",
  "object": "page"
  }

```
