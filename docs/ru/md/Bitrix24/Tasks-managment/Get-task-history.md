---
sidebar_position: 19
---

# Получить историю задачи
 Получает историю изменений задачи



`Функция ПолучитьИсториюЗадачи(Знач URL, Знач IDЗадачи, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЗадачи | --task | Число,Строка | ID задачи |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [tasks.task.history.list](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_history_list.php)
:::
<br/>


```bsl title="Пример кода"
    URL      = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDЗадачи = "1254";

    Результат = OPI_Bitrix24.ПолучитьИсториюЗадачи(URL, IDЗадачи);

    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "7a63bc66006e9f06006b12e400000001000...";
    IDЗадачи  = "1256";

    Результат = OPI_Bitrix24.ПолучитьИсториюЗадачи(URL, IDЗадачи, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьИсториюЗадачи --url "b24-ar17wx.bitrix24.by" --task "170" --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "list": [
   {
    "id": "1044",
    "createdDate": "19.06.2024 10:57:54",
    "field": "NEW",
    "value": {
     "from": null,
     "to": null
    },
    "user": {
     "id": "1",
     "name": "Антон",
     "lastName": "Титовец",
     "secondName": null,
     "login": "VKuser657846756"
    }
   },
   {
    "id": "1052",
    "createdDate": "19.06.2024 10:58:01",
    "field": "TITLE",
    "value": {
     "from": "Новая задача",
     "to": "Другой заголовок задачи"
    },
    "user": {
     "id": "1",
     "name": "Антон",
     "lastName": "Титовец",
     "secondName": null,
     "login": "VKuser657846756"
    }
   },
   {
    "id": "1054",
    "createdDate": "19.06.2024 10:58:01",
    "field": "DESCRIPTION",
    "value": {
     "from": "",
     "to": ""
    },
    "user": {
     "id": "1",
     "name": "Антон",
     "lastName": "Титовец",
     "secondName": null,
     "login": "VKuser657846756"
    }
   },
   {
    "id": "1056",
    "createdDate": "19.06.2024 10:58:01",
    "field": "PRIORITY",
    "value": {
     "from": "2",
     "to": "1"
    },
    "user": {
     "id": "1",
     "name": "Антон",
     "lastName": "Титовец",
     "secondName": null,
     "login": "VKuser657846756"
    }
   },
   {
    "id": "1064",
    "createdDate": "19.06.2024 10:58:08",
    "field": "RESPONSIBLE_ID",
    "value": {
     "from": "1",
     "to": "10"
    },
    "user": {
     "id": "1",
     "name": "Антон",
     "lastName": "Титовец",
     "secondName": null,
     "login": "VKuser657846756"
    }
   },
   {
    "id": "1066",
    "createdDate": "19.06.2024 10:58:08",
    "field": "AUDITORS",
    "value": {
     "from": "",
     "to": "1"
    },
    "user": {
     "id": "1",
     "name": "Антон",
     "lastName": "Титовец",
     "secondName": null,
     "login": "VKuser657846756"
    }
   },
   {
    "id": "1068",
    "createdDate": "19.06.2024 10:58:08",
    "field": "COMMENT",
    "value": {
     "from": null,
     "to": "406"
    },
    "user": {
     "id": "1",
     "name": "Антон",
     "lastName": "Титовец",
     "secondName": null,
     "login": "VKuser657846756"
    }
   },
   {
    "id": "1072",
    "createdDate": "19.06.2024 10:58:10",
    "field": "STATUS",
    "value": {
     "from": "2",
     "to": "6"
    },
    "user": {
     "id": "1",
     "name": "Антон",
     "lastName": "Титовец",
     "secondName": null,
     "login": "VKuser657846756"
    }
   },
   {
    "id": "1078",
    "createdDate": "19.06.2024 10:58:12",
    "field": "STATUS",
    "value": {
     "from": "6",
     "to": "5"
    },
    "user": {
     "id": "1",
     "name": "Антон",
     "lastName": "Титовец",
     "secondName": null,
     "login": "VKuser657846756"
    }
   },
   {
    "id": "1080",
    "createdDate": "19.06.2024 10:58:12",
    "field": "COMMENT",
    "value": {
     "from": null,
     "to": "410"
    },
    "user": {
     "id": "1",
     "name": "Антон",
     "lastName": "Титовец",
     "secondName": null,
     "login": "VKuser657846756"
    }
   },
   {
    "id": "1086",
    "createdDate": "19.06.2024 10:58:16",
    "field": "STATUS",
    "value": {
     "from": "5",
     "to": "2"
    },
    "user": {
     "id": "1",
     "name": "Антон",
     "lastName": "Титовец",
     "secondName": null,
     "login": "VKuser657846756"
    }
   },
   {
    "id": "1088",
    "createdDate": "19.06.2024 10:58:17",
    "field": "COMMENT",
    "value": {
     "from": null,
     "to": "414"
    },
    "user": {
     "id": "1",
     "name": "Антон",
     "lastName": "Титовец",
     "secondName": null,
     "login": "VKuser657846756"
    }
   },
   {
    "id": "1092",
    "createdDate": "19.06.2024 10:58:18",
    "field": "STATUS",
    "value": {
     "from": "2",
     "to": "3"
    },
    "user": {
     "id": "1",
     "name": "Антон",
     "lastName": "Титовец",
     "secondName": null,
     "login": "VKuser657846756"
    }
   },
   {
    "id": "1096",
    "createdDate": "19.06.2024 10:58:22",
    "field": "AUDITORS",
    "value": {
     "from": "1",
     "to": ""
    },
    "user": {
     "id": "1",
     "name": "Антон",
     "lastName": "Титовец",
     "secondName": null,
     "login": "VKuser657846756"
    }
   },
   {
    "id": "1100",
    "createdDate": "19.06.2024 10:58:23",
    "field": "STATUS",
    "value": {
     "from": "3",
     "to": "2"
    },
    "user": {
     "id": "1",
     "name": "Антон",
     "lastName": "Титовец",
     "secondName": null,
     "login": "VKuser657846756"
    }
   }
  ]
 },
 "time": {
  "start": 1718783905.33427,
  "finish": 1718783905.37664,
  "duration": 0.0423648357391357,
  "processing": 0.00563311576843262,
  "date_start": "2024-06-19T07:58:25+00:00",
  "date_finish": "2024-06-19T07:58:25+00:00",
  "operating_reset_at": 1718784505,
  "operating": 0
 }
}
```
