---
sidebar_position: 2
---

# Получить пользователя
 Получает информацию о пользователе по ID



`Функция ПолучитьПользователя(Знач URL, Знач IDПользователя, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDПользователя | --userid | Строка, Число | ID пользователя для получения |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [user.get](https://dev.1c-bitrix.ru/rest_help/users/user_get.php)
:::
<br/>


```bsl title="Пример кода"
    URL            = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDПользователя = "490";

    Результат = OPI_Bitrix24.ПолучитьПользователя(URL, IDПользователя);

    URL            = "b24-ar17wx.bitrix24.by";
    Токен          = "37d1fe66006e9f06006b12e400000001000...";
    IDПользователя = "492";

    Результат = OPI_Bitrix24.ПолучитьПользователя(URL, IDПользователя, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьПользователя --url %url% --userid %userid% --token %token%

```

```json title="Результат"
{
 "result": [
  {
   "ID": "582",
   "XML_ID": "57933334",
   "ACTIVE": true,
   "NAME": "Олег",
   "LAST_NAME": "Лама",
   "EMAIL": "12893982-d653-4c4e-b2aa-2ff8bd109e62@exepmple.org",
   "LAST_LOGIN": "",
   "DATE_REGISTER": "2024-10-07T03:00:00+03:00",
   "IS_ONLINE": "N",
   "TIMESTAMP_X": {},
   "PERSONAL_GENDER": "",
   "PERSONAL_BIRTHDAY": "",
   "PERSONAL_MOBILE": "88003553535",
   "UF_EMPLOYMENT_DATE": "",
   "UF_DEPARTMENT": [
    7
   ],
   "USER_TYPE": "employee"
  }
 ],
 "total": 1,
 "time": {
  "start": 1728282528.92174,
  "finish": 1728282528.97256,
  "duration": 0.0508198738098144,
  "processing": 0.0126349925994873,
  "date_start": "2024-10-07T09:28:48+03:00",
  "date_finish": "2024-10-07T09:28:48+03:00",
  "operating_reset_at": 1728283128,
  "operating": 0
 }
}
```
