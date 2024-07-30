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
  URL            = ПараметрыФункции["Bitrix24_URL"];
  IDПользователя = ПараметрыФункции["Bitrix24_HookUserID"];
  
  Результат = OPI_Bitrix24.ПолучитьПользователя(URL, IDПользователя);
  
  
  
  URL            = ПараметрыФункции["Bitrix24_Domain"];
  Токен          = ПараметрыФункции["Bitrix24_Token"];
  IDПользователя = ПараметрыФункции["Bitrix24_UserID"];
  
  Результат = OPI_Bitrix24.ПолучитьПользователя(URL, IDПользователя, Токен);
```
	


```sh title="Пример команды CLI"
    
oint bitrix24 ПолучитьПользователя --url %url% --userid %userid% --token %token%

```

```json title="Результат"
{
 "result": [
  {
   "ID": "60",
   "XML_ID": "56731232",
   "ACTIVE": true,
   "NAME": "Олег",
   "LAST_NAME": "Лама",
   "EMAIL": "804d1dbb-7df4-4245-8266-938fc2541978@exepmple.org",
   "LAST_LOGIN": "",
   "DATE_REGISTER": "2024-07-30T00:00:00+00:00",
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
  "start": 1722328397.72079,
  "finish": 1722328397.76914,
  "duration": 0.0483510494232178,
  "processing": 0.0120601654052734,
  "date_start": "2024-07-30T08:33:17+00:00",
  "date_finish": "2024-07-30T08:33:17+00:00",
  "operating_reset_at": 1722328997,
  "operating": 0
 }
}
```
