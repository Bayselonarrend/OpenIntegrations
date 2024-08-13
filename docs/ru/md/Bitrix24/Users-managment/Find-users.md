---
sidebar_position: 6
---

# Найти пользователей
 Получает список пользователей по заданному фильтру



`Функция НайтиПользователей(Знач URL, Знач СтруктураФильтра, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | СтруктураФильтра | --filter | Структура Из КлючИЗначение | Фильтр. См. ПолучитьСтруктуруФильтраПользователей |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [user.update](https://dev.1c-bitrix.ru/rest_help/users/user_update.php)
:::
<br/>


```bsl title="Пример кода"
  URL = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
  
  СтруктураФильтра = Новый Структура;
  СтруктураФильтра.Вставить("NAME"              , "Виталий");
  СтруктураФильтра.Вставить("LAST_NAME"         , "Альпака");
  СтруктураФильтра.Вставить("WORK_POSITION"     , "DevOps инженер");
  СтруктураФильтра.Вставить("UF_DEPARTMENT_NAME", "Отдел маркетинга");
  СтруктураФильтра.Вставить("USER_TYPE"         , "employee");
  
  Результат = OPI_Bitrix24.НайтиПользователей(URL, СтруктураФильтра);
  
  URL   = "b24-ar17wx.bitrix24.by";
  Токен = "fe3fa966006e9f06006b12e400000001000...";
  
  СтруктураФильтра = Новый Структура;
  СтруктураФильтра.Вставить("UF_DEPARTMENT_NAME", "Битрикс");
  
  Результат = OPI_Bitrix24.НайтиПользователей(URL, СтруктураФильтра, Токен);
```
	


```sh title="Пример команды CLI"
    
  oint bitrix24 НайтиПользователей --url %url% --filter %filter% --token %token%

```

```json title="Результат"
{
 "result": [
  {
   "ID": "12",
   "XML_ID": "56479740",
   "ACTIVE": true,
   "NAME": "Bay",
   "LAST_NAME": "Selonarrend",
   "EMAIL": "oarismos@gmail.com",
   "LAST_LOGIN": "2024-07-13T07:17:17+00:00",
   "DATE_REGISTER": "2024-07-13T00:00:00+00:00",
   "IS_ONLINE": "N",
   "TIMESTAMP_X": {},
   "LAST_ACTIVITY_DATE": {},
   "PERSONAL_GENDER": "",
   "PERSONAL_BIRTHDAY": "",
   "UF_EMPLOYMENT_DATE": "",
   "UF_DEPARTMENT": [
    1
   ],
   "USER_TYPE": "employee"
  },
  {
   "ID": "18",
   "XML_ID": "56701916",
   "ACTIVE": true,
   "EMAIL": "hey@exepmple.com",
   "LAST_LOGIN": "",
   "DATE_REGISTER": "2024-07-28T00:00:00+00:00",
   "IS_ONLINE": "N",
   "TIMESTAMP_X": {},
   "PERSONAL_GENDER": "",
   "PERSONAL_BIRTHDAY": "",
   "UF_EMPLOYMENT_DATE": "",
   "UF_DEPARTMENT": [
    1
   ],
   "USER_TYPE": "employee"
  },
  {
   "ID": "34",
   "XML_ID": "56702240",
   "ACTIVE": false,
   "EMAIL": "537fafa9-e5ea-4221-bd46-4f6db2609634@exepmple.org",
   "LAST_LOGIN": "",
   "DATE_REGISTER": "2024-07-28T00:00:00+00:00",
   "IS_ONLINE": "N",
   "TIMESTAMP_X": {},
   "PERSONAL_GENDER": "",
   "PERSONAL_BIRTHDAY": "",
   "UF_EMPLOYMENT_DATE": "",
   "UF_DEPARTMENT": [
    1
   ],
   "USER_TYPE": "employee"
  },
  {
   "ID": "38",
   "XML_ID": "56702244",
   "ACTIVE": false,
   "EMAIL": "442145e1-75e4-4c85-ac6d-e4da44c859a8@exepmple.org",
   "LAST_LOGIN": "",
   "DATE_REGISTER": "2024-07-28T00:00:00+00:00",
   "IS_ONLINE": "N",
   "TIMESTAMP_X": {},
   "PERSONAL_GENDER": "",
   "PERSONAL_BIRTHDAY": "",
   "UF_EMPLOYMENT_DATE": "",
   "UF_DEPARTMENT": [
    1
   ],
   "USER_TYPE": "employee"
  },
  {
   "ID": "42",
   "XML_ID": "56702314",
   "ACTIVE": true,
   "EMAIL": "3f70caee-2203-46ec-b53c-24f1c7092056@exepmple.org",
   "LAST_LOGIN": "",
   "DATE_REGISTER": "2024-07-28T00:00:00+00:00",
   "IS_ONLINE": "N",
   "TIMESTAMP_X": {},
   "PERSONAL_GENDER": "",
   "PERSONAL_BIRTHDAY": "",
   "UF_EMPLOYMENT_DATE": "",
   "UF_DEPARTMENT": [
    1
   ],
   "USER_TYPE": "employee"
  },
  {
   "ID": "46",
   "XML_ID": "56702336",
   "ACTIVE": false,
   "EMAIL": "f23e7d22-016d-4711-aa0f-439951951f35@exepmple.org",
   "LAST_LOGIN": "",
   "DATE_REGISTER": "2024-07-28T00:00:00+00:00",
   "IS_ONLINE": "N",
   "TIMESTAMP_X": {},
   "PERSONAL_GENDER": "",
   "PERSONAL_BIRTHDAY": "",
   "UF_EMPLOYMENT_DATE": "",
   "UF_DEPARTMENT": [
    1
   ],
   "USER_TYPE": "employee"
  },
  {
   "ID": "50",
   "XML_ID": "56702654",
   "ACTIVE": false,
   "EMAIL": "360bd8ae-146c-497b-ae87-0699855f21b7@exepmple.org",
   "LAST_LOGIN": "",
   "DATE_REGISTER": "2024-07-28T00:00:00+00:00",
   "IS_ONLINE": "N",
   "TIMESTAMP_X": {},
   "PERSONAL_GENDER": "",
   "PERSONAL_BIRTHDAY": "",
   "UF_EMPLOYMENT_DATE": "",
   "UF_DEPARTMENT": [
    1
   ],
   "USER_TYPE": "employee"
  },
  {
   "ID": "54",
   "XML_ID": "56721830",
   "ACTIVE": false,
   "EMAIL": "15ea8982-762a-44a0-9c53-c97530015c46@exepmple.org",
   "LAST_LOGIN": "",
   "DATE_REGISTER": "2024-07-29T00:00:00+00:00",
   "IS_ONLINE": "N",
   "TIMESTAMP_X": {},
   "PERSONAL_GENDER": "",
   "PERSONAL_BIRTHDAY": "",
   "UF_EMPLOYMENT_DATE": "",
   "UF_DEPARTMENT": [
    1
   ],
   "USER_TYPE": "employee"
  },
  {
   "ID": "1",
   "XML_ID": "53818298",
   "ACTIVE": true,
   "NAME": "Антон",
   "LAST_NAME": "Титовец",
   "EMAIL": "no-reply@bitrix24.com",
   "LAST_LOGIN": "2024-07-30T06:49:41+00:00",
   "DATE_REGISTER": "2024-02-10T00:00:00+00:00",
   "IS_ONLINE": "N",
   "TIME_ZONE_OFFSET": "0",
   "TIMESTAMP_X": {},
   "LAST_ACTIVITY_DATE": {},
   "PERSONAL_GENDER": "",
   "PERSONAL_BIRTHDAY": "",
   "PERSONAL_PHOTO": "https://cdn-ru.bitrix24.by/b28528874/main/d7e/d7e99cf556e4ab676463dae2c00ddfbb/a7e0af6899300e3c684caeca5c334d81.jpg",
   "UF_EMPLOYMENT_DATE": "",
   "UF_DEPARTMENT": [
    1,
    50
   ],
   "USER_TYPE": "employee"
  },
  {
   "ID": "10",
   "XML_ID": "56016490",
   "ACTIVE": true,
   "NAME": "Techno",
   "LAST_NAME": "Pizza",
   "EMAIL": "iscript13@gmail.com",
   "LAST_LOGIN": "2024-07-13T14:46:11+00:00",
   "DATE_REGISTER": "2024-06-15T00:00:00+00:00",
   "IS_ONLINE": "N",
   "TIMESTAMP_X": {},
   "LAST_ACTIVITY_DATE": {},
   "PERSONAL_GENDER": "",
   "PERSONAL_BIRTHDAY": "",
   "UF_EMPLOYMENT_DATE": "",
   "UF_DEPARTMENT": [
    1,
    50
   ],
   "USER_TYPE": "employee"
  },
  {
   "ID": "60",
   "XML_ID": "56731232",
   "ACTIVE": true,
   "NAME": "Виталий",
   "LAST_NAME": "Альпака",
   "EMAIL": "87394c27-0694-457e-bcc9-39ccf92ffbf7@exepmple.org",
   "LAST_LOGIN": "",
   "DATE_REGISTER": "2024-07-30T00:00:00+00:00",
   "IS_ONLINE": "N",
   "TIMESTAMP_X": {},
   "PERSONAL_GENDER": "",
   "PERSONAL_BIRTHDAY": "",
   "PERSONAL_MOBILE": "88003553535",
   "UF_EMPLOYMENT_DATE": "",
   "UF_DEPARTMENT": [
    1
   ],
   "USER_TYPE": "employee"
  }
 ],
 "total": 11,
 "time": {
  "start": 1722328393.63268,
  "finish": 1722328393.68509,
  "duration": 0.0524110794067383,
  "processing": 0.0202820301055908,
  "date_start": "2024-07-30T08:33:13+00:00",
  "date_finish": "2024-07-30T08:33:13+00:00",
  "operating_reset_at": 1722328993,
  "operating": 0
 }
}
```
