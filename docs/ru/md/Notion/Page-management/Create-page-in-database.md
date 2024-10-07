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
 "id": "11882aa7-fc4e-81dc-a8ca-f2d448d95d2f",
 "created_time": "2024-10-07T18:41:00Z",
 "last_edited_time": "2024-10-07T18:41:00Z",
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
  "database_id": "11882aa7-fc4e-8126-b9de-fe7880674854"
 },
 "archived": false,
 "in_trash": false,
 "properties": {
  "Картинка": {
   "id": "QGhS",
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
  "Описание": {
   "id": "X_VD",
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
   "id": "_Uq%40",
   "type": "select",
   "select": {
    "id": "e550ba9a-971f-4dd5-af1b-84379fa7b725",
    "name": "Новый",
    "color": "green"
   }
  },
  "Дата создания": {
   "id": "dKb~",
   "type": "date",
   "date": {
    "start": "2024-10-07T12:41:00+03:00",
    "end": null,
    "time_zone": null
   }
  },
  "Телефон": {
   "id": "nx%3A%40",
   "type": "phone_number",
   "phone_number": "88005553535"
  },
  "Почта": {
   "id": "sMXk",
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
  "Активен": {
   "id": "upgM",
   "type": "checkbox",
   "checkbox": true
  },
  "Пользователь": {
   "id": "yVy%5B",
   "type": "people",
   "people": []
  },
  "Номер": {
   "id": "%7B%3FVr",
   "type": "number",
   "number": 1
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
 "url": "https://www.notion.so/11882aa7fc4e81dca8caf2d448d95d2f",
 "public_url": null,
 "request_id": "9a301e83-a841-4b89-aa3d-85d31746e294"
}
```
