---
sidebar_position: 1
---

# Получить статистику
 Получает общую статистику сообщества за период



`Функция ПолучитьСтатистику(Знач ДатаНачала, Знач ДатаОкончания, Знач Параметры = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | ДатаНачала | --datefrom | Дата | Дата начала периода |
  | ДатаОкончания | --dateto | Дата | Дата окончания периода |
  | Параметры | --auth | Структура из Строка | JSON авторизации или путь к .json |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK

<br/>




```bsl title="Пример кода"
    Параметры       = ПолучитьПараметрыВК();

    ТекущаяДата     = OPI_Инструменты.ПолучитьТекущуюДату();
    ДатаНачала      = НачалоДня(ТекущаяДата);
    ДатаОкончания   = КонецДня(ДатаНачала);

    Результат = OPI_VK.ПолучитьСтатистику(ДатаНачала, ДатаОкончания, Параметры);
```



```sh title="Пример команды CLI"
    
  oint vk ПолучитьСтатистику --datefrom %datefrom% --dateto %dateto% --auth %auth%

```

```json title="Результат"
{
 "response": [
  {
   "activity": {
    "comments": 1,
    "likes": 1
   },
   "period_from": 1728172800,
   "period_to": 1728259199,
   "reach": {
    "age": [
     {
      "value": "12-18",
      "count": 0
     },
     {
      "value": "18-21",
      "count": 0
     },
     {
      "value": "21-24",
      "count": 1
     },
     {
      "value": "24-27",
      "count": 0
     },
     {
      "value": "27-30",
      "count": 0
     },
     {
      "value": "30-35",
      "count": 0
     },
     {
      "value": "35-45",
      "count": 0
     },
     {
      "value": "45-100",
      "count": 0
     }
    ],
    "cities": [],
    "countries": [
     {
      "code": "BY",
      "count": 1,
      "name": "Беларусь",
      "value": 3
     }
    ],
    "mobile_reach": 1,
    "reach": 1,
    "reach_subscribers": 1,
    "sex": [
     {
      "value": "f",
      "count": 0
     },
     {
      "value": "m",
      "count": 1
     }
    ],
    "sex_age": [
     {
      "value": "f;12-18",
      "count": 0
     },
     {
      "value": "f;18-21",
      "count": 0
     },
     {
      "value": "f;21-24",
      "count": 0
     },
     {
      "value": "f;24-27",
      "count": 0
     },
     {
      "value": "f;27-30",
      "count": 0
     },
     {
      "value": "f;30-35",
      "count": 0
     },
     {
      "value": "f;35-45",
      "count": 0
     },
     {
      "value": "f;45-100",
      "count": 0
     },
     {
      "value": "m;12-18",
      "count": 0
     },
     {
      "value": "m;18-21",
      "count": 0
     },
     {
      "value": "m;21-24",
      "count": 1
     },
     {
      "value": "m;24-27",
      "count": 0
     },
     {
      "value": "m;27-30",
      "count": 0
     },
     {
      "value": "m;30-35",
      "count": 0
     },
     {
      "value": "m;35-45",
      "count": 0
     },
     {
      "value": "m;45-100",
      "count": 0
     }
    ]
   },
   "visitors": {
    "cities": [],
    "countries": [
     {
      "code": "SC",
      "count": 1,
      "name": "Сейшелы",
      "value": 175
     },
     {
      "code": "RU",
      "count": 1,
      "name": "Россия",
      "value": 1
     }
    ],
    "mobile_views": 0,
...
```
