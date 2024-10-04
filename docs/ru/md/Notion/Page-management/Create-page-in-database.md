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
 "id": "11282aa7-fc4e-81a1-83fa-d321789b6885",
 "created_time": "2024-10-01T18:37:00Z",
 "last_edited_time": "2024-10-01T18:37:00Z",
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
  "database_id": "11282aa7-fc4e-811c-9177-def14ccc3095"
 },
 "archived": false,
 "in_trash": false,
 "properties": {
  "Описание": {
   "id": "%3DiF~",
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
  "Дата создания": {
   "id": "COOh",
   "type": "date",
   "date": {
    "start": "2024-10-01T12:37:00+03:00",
    "end": null,
    "time_zone": null
   }
  },
  "Телефон": {
   "id": "%5Dtmh",
   "type": "phone_number",
   "phone_number": "88005553535"
  },
  "Статус": {
   "id": "bWOW",
   "type": "select",
   "select": {
    "id": "0d638280-6bd6-4578-a4c1-50cc8ae01134",
    "name": "Новый",
    "color": "green"
   }
  },
  "Номер": {
   "id": "fD%7Dp",
   "type": "number",
   "number": 1
  },
  "Почта": {
   "id": "ktOk",
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
   "id": "qa%40q",
   "type": "checkbox",
   "checkbox": true
  },
  "Пользователь": {
   "id": "yX%3F%5D",
   "type": "people",
   "people": []
  },
  "Картинка": {
   "id": "%7D%5CeH",
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
 "url": "https://www.notion.so/11282aa7fc4e81a183fad321789b6885",
 "public_url": null,
 "request_id": "9abff120-5e5c-42af-b2a9-5dda12196e7a"
}
```
