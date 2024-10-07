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
 "id": "11882aa7-fc4e-81d4-b7ed-f93f1ac48a6f",
 "created_time": "2024-10-07T13:00:00Z",
 "last_edited_time": "2024-10-07T13:00:00Z",
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
  "database_id": "11882aa7-fc4e-8177-a21d-f93dd950be9f"
 },
 "archived": false,
 "in_trash": false,
 "properties": {
  "Картинка": {
   "id": "NH%5Ew",
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
  "Статус": {
   "id": "%5Cq%5C%5C",
   "type": "select",
   "select": {
    "id": "b376836a-4eea-493e-afed-f86153e30136",
    "name": "Новый",
    "color": "green"
   }
  },
  "Пользователь": {
   "id": "%5ES~a",
   "type": "people",
   "people": []
  },
  "Почта": {
   "id": "_cOl",
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
  "Номер": {
   "id": "_upA",
   "type": "number",
   "number": 1
  },
  "Телефон": {
   "id": "%60kGw",
   "type": "phone_number",
   "phone_number": "88005553535"
  },
  "Описание": {
   "id": "sM%7B_",
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
  "Активен": {
   "id": "u~%3CP",
   "type": "checkbox",
   "checkbox": true
  },
  "Дата создания": {
   "id": "%7DluV",
   "type": "date",
   "date": {
    "start": "2024-10-07T07:00:00+03:00",
    "end": null,
    "time_zone": null
   }
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
 "url": "https://www.notion.so/11882aa7fc4e81d4b7edf93f1ac48a6f",
 "public_url": null,
 "request_id": "dde377d0-f33a-4931-8bb1-552dd13a4535"
}
```
