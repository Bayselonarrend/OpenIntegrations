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
    IDЗадачи = "2262";

    Результат = OPI_Bitrix24.ПолучитьИсториюЗадачи(URL, IDЗадачи);

    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "37d1fe66006e9f06006b12e400000001000...";
    IDЗадачи  = "2264";

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
    "id": "29422",
    "createdDate": "07.10.2024 21:45:55",
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
    "id": "29424",
    "createdDate": "07.10.2024 21:46:01",
    "field": "START_DATE_PLAN",
    "value": {
     "from": "",
     "to": "1728326755"
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
    "id": "29426",
    "createdDate": "07.10.2024 21:46:01",
    "field": "END_DATE_PLAN",
    "value": {
     "from": "",
     "to": "1728334800"
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
    "id": "29428",
    "createdDate": "07.10.2024 21:46:01",
    "field": "DURATION_PLAN_SECONDS",
    "value": {
     "from": "",
     "to": "8045"
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
    "id": "29442",
    "createdDate": "07.10.2024 21:46:02",
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
    "id": "29444",
    "createdDate": "07.10.2024 21:46:02",
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
    "id": "29446",
    "createdDate": "07.10.2024 21:46:02",
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
    "id": "29452",
    "createdDate": "07.10.2024 21:46:04",
    "field": "RESPONSIBLE_ID",
    "value": {
     "from": "1",
     "to": "586"
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
    "id": "29454",
    "createdDate": "07.10.2024 21:46:04",
    "field": "COMMENT",
    "value": {
     "from": null,
     "to": "5844"
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
    "id": "29458",
    "createdDate": "07.10.2024 21:46:04",
...
```
