---
sidebar_position: 2
---

# Создать страницу в базу
 Создает страницу в базе-родителе



`Функция СоздатьСтраницуВБазу(Знач Токен, Знач Родитель, Знач Данные) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Родитель | --base | Строка | ID родительской базы |
  | Данные | --data | Соответствие Из КлючИЗначение | Соответствие свойств |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Notion

<br/>




```bsl title="Пример кода"
    Токен     = "secret_9RsfMrRMqZwqp0Zl0B...";
    База      = "11282aa7-fc4e-810b-ab77-cef5a2a3443e";
    Картинка_ = "https://openyellow.neocities.org/test_data/picture.jpg"; // URL, Двоичные данные или Путь к файлу

    Картинка = Новый Соответствие;
    Картинка.Вставить("Лого", Картинка_);

    Свойства = Новый Соответствие;
    Свойства.Вставить("Имя"               , "ООО Вектор");
    Свойства.Вставить("Описание"          , "Наш первый клиент");
    Свойства.Вставить("Номер"             , 1);
    Свойства.Вставить("Статус"            , "Обычный");
    Свойства.Вставить("Дата создания"     , OPI_Инструменты.ПолучитьТекущуюДату());
    Свойства.Вставить("Картинка"          , Картинка);
    Свойства.Вставить("Активен"           , Истина);
    Свойства.Вставить("Сайт"              , "https://vector.ru");
    Свойства.Вставить("Почта"             , "mail@vector.ru");
    Свойства.Вставить("Телефон"           , "88005553535");
    Свойства.Вставить("Статус"            , "Новый");

    Результат = OPI_Notion.СоздатьСтраницуВБазу(Токен, База, Свойства);
```



```sh title="Пример команды CLI"
    
  oint notion СоздатьСтраницуВБазу --token "secret_9RsfMrRMqZwqp0Zl0B..." --base "5dd94c34fab04bff9..." --data %data%

```

```json title="Результат"
{
 "object": "page",
 "id": "11882aa7-fc4e-81a0-b13f-f70090c8ce01",
 "created_time": "2024-10-07T06:21:00Z",
 "last_edited_time": "2024-10-07T06:21:00Z",
 "created_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "last_edited_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "cover": null,
 "icon": null,
 "parent": {
  "type": "database_id",
  "database_id": "11882aa7-fc4e-8162-a031-ce830261bcd1"
 },
 "archived": false,
 "in_trash": false,
 "properties": {
  "Номер": {
   "id": "CBK%5D",
   "type": "number",
   "number": 1
  },
  "Дата создания": {
   "id": "E%3DZE",
   "type": "date",
   "date": {
    "start": "2024-10-07T12:21:00+03:00",
    "end": null,
    "time_zone": null
   }
  },
  "Активен": {
   "id": "Rv~m",
   "type": "checkbox",
   "checkbox": true
  },
  "Картинка": {
   "id": "TDEz",
   "type": "files",
   "files": [
    {
     "name": "Лого",
     "type": "external",
     "external": {
      "url": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg"
     }
    }
   ]
  },
  "Почта": {
   "id": "%5DKRt",
   "type": "rich_text",
   "rich_text": [
    {
     "type": "text",
     "text": {
      "content": "mail@vector.ru",
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
     "plain_text": "mail@vector.ru",
     "href": null
    }
   ]
  },
  "Пользователь": {
   "id": "gB%7Cl",
   "type": "people",
   "people": []
  },
  "Описание": {
   "id": "maiK",
   "type": "rich_text",
   "rich_text": [
    {
     "type": "text",
     "text": {
      "content": "Наш первый клиент",
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
     "plain_text": "Наш первый клиент",
     "href": null
    }
   ]
  },
  "Статус": {
   "id": "%7C%3AJl",
   "type": "select",
   "select": {
    "id": "8fbbbedc-8723-4bf8-b2bc-05d47d0eec13",
    "name": "Новый",
    "color": "green"
   }
  },
  "Телефон": {
   "id": "%7DzZ%40",
   "type": "phone_number",
   "phone_number": "88005553535"
  },
  "Имя": {
   "id": "title",
   "type": "title",
   "title": [
    {
     "type": "text",
     "text": {
      "content": "ООО Вектор",
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
     "plain_text": "ООО Вектор",
     "href": null
    }
   ]
  }
 },
 "url": "https://www.notion.so/11882aa7fc4e81a0b13ff70090c8ce01",
 "public_url": null,
 "request_id": "0c5be14e-d7e9-4079-b3a3-f4cd44132806"
}
```
