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
   "ID": "586",
   "XML_ID": "57944722",
   "ACTIVE": true,
   "NAME": "Олег",
   "LAST_NAME": "Лама",
   "EMAIL": "020a827f-cf69-49dd-86a7-fddc7f2c2907@exepmple.org",
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
  "start": 1728306525.84293,
  "finish": 1728306525.886,
  "duration": 0.0430660247802734,
  "processing": 0.0114738941192627,
  "date_start": "2024-10-07T16:08:45+03:00",
  "date_finish": "2024-10-07T16:08:45+03:00",
  "operating_reset_at": 1728307125,
  "operating": 0
 }
}
```
