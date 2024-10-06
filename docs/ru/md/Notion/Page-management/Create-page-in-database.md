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
 "id": "11782aa7-fc4e-8103-afc2-e49f0f76aaa7",
 "created_time": "2024-10-06T14:28:00Z",
 "last_edited_time": "2024-10-06T14:28:00Z",
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
  "database_id": "11782aa7-fc4e-8167-b90a-c8b2f3c5c72e"
 },
 "archived": false,
 "in_trash": false,
 "properties": {
  "Номер": {
   "id": "%3F%60%7BP",
   "type": "number",
   "number": 1
  },
  "Телефон": {
   "id": "%40Me%5C",
   "type": "phone_number",
   "phone_number": "88005553535"
  },
  "Дата создания": {
   "id": "%40qjA",
   "type": "date",
   "date": {
    "start": "2024-10-06T08:27:00+03:00",
    "end": null,
    "time_zone": null
   }
  },
  "Почта": {
   "id": "Fh%5CZ",
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
  "Статус": {
   "id": "KB%5DZ",
   "type": "select",
   "select": {
    "id": "4856776c-7581-47d8-974d-22a13d730813",
    "name": "Новый",
    "color": "green"
   }
  },
  "Картинка": {
   "id": "YvwY",
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
  "Пользователь": {
   "id": "%5B%3Ao%5D",
   "type": "people",
   "people": []
  },
  "Активен": {
   "id": "%5CXyn",
   "type": "checkbox",
   "checkbox": true
  },
  "Описание": {
   "id": "sZRq",
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
 "url": "https://www.notion.so/11782aa7fc4e8103afc2e49f0f76aaa7",
 "public_url": null,
 "request_id": "b0c5377a-02ff-4648-876f-cfb2ad33f838"
}
```
