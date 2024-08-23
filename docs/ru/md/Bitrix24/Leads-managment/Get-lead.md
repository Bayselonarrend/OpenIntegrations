---
sidebar_position: 3
---

# Получить лид
 Получает лид по ID



`Функция ПолучитьЛид(Знач URL, Знач IDЛида, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЛида | --lead | Число,Строка | ID лида |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrix24

<br/>

:::tip
Метод в документации API: [crm.lead.get](https://dev.1c-bitrix.ru/rest_help/crm/leads/crm_lead_get.php)
:::
<br/>


```bsl title="Пример кода"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDЛида = "";

    Результат = OPI_Bitrix24.ПолучитьЛид(URL, IDЛида);

    URL    = "b24-ar17wx.bitrix24.by";
    Токен  = "ec4dc366006e9f06006b12e400000001000...";
    IDЛида = "";

    Результат = OPI_Bitrix24.ПолучитьЛид(URL, IDЛида, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьЛид --url "b24-ar17wx.bitrix24.by" --lead %lead% --token "ec4dc366006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "ID": "30",
  "TITLE": "Мегаклиент",
  "HONORIFIC": null,
  "NAME": "Иван",
  "SECOND_NAME": null,
  "LAST_NAME": "Иванов",
  "COMPANY_TITLE": null,
  "COMPANY_ID": null,
  "CONTACT_ID": "30",
  "IS_RETURN_CUSTOMER": "N",
  "BIRTHDATE": "",
  "SOURCE_ID": null,
  "SOURCE_DESCRIPTION": null,
  "STATUS_ID": "CONVERTED",
  "STATUS_DESCRIPTION": null,
  "POST": null,
  "COMMENTS": null,
  "CURRENCY_ID": "BYN",
  "OPPORTUNITY": "0.00",
  "IS_MANUAL_OPPORTUNITY": "N",
  "HAS_PHONE": "Y",
  "HAS_EMAIL": "Y",
  "HAS_IMOL": "N",
  "ASSIGNED_BY_ID": "1",
  "CREATED_BY_ID": "1",
  "MODIFY_BY_ID": "1",
  "DATE_CREATE": "2024-08-22T17:45:23+00:00",
  "DATE_MODIFY": "2024-08-22T17:45:23+00:00",
  "DATE_CLOSED": "2024-08-22T17:45:23+00:00",
  "STATUS_SEMANTIC_ID": "S",
  "OPENED": "N",
  "ORIGINATOR_ID": null,
  "ORIGIN_ID": null,
  "MOVED_BY_ID": "1",
  "MOVED_TIME": "2024-08-22T17:45:23+00:00",
  "ADDRESS": "ул. Пушкина, д. 10",
  "ADDRESS_2": null,
  "ADDRESS_CITY": null,
  "ADDRESS_POSTAL_CODE": null,
  "ADDRESS_REGION": null,
  "ADDRESS_PROVINCE": null,
  "ADDRESS_COUNTRY": "Россия",
  "ADDRESS_COUNTRY_CODE": null,
  "ADDRESS_LOC_ADDR_ID": "58",
  "UTM_SOURCE": null,
  "UTM_MEDIUM": null,
  "UTM_CAMPAIGN": null,
  "UTM_CONTENT": null,
  "UTM_TERM": null,
  "LAST_ACTIVITY_BY": "1",
  "LAST_ACTIVITY_TIME": "2024-08-22T17:45:23+00:00",
  "EMAIL": [
   {
    "ID": "134",
    "VALUE_TYPE": "HOME",
    "VALUE": "yo@example.com",
    "TYPE_ID": "EMAIL"
   },
   {
    "ID": "136",
    "VALUE_TYPE": "WORK",
    "VALUE": "hi@example.com",
    "TYPE_ID": "EMAIL"
   }
  ],
  "PHONE": [
   {
    "ID": "138",
    "VALUE_TYPE": "WORK",
    "VALUE": "88005553535",
    "TYPE_ID": "PHONE"
   }
  ]
 },
 "time": {
  "start": 1724348725.12016,
  "finish": 1724348725.16787,
  "duration": 0.0477080345153809,
  "processing": 0.0201630592346191,
  "date_start": "2024-08-22T17:45:25+00:00",
  "date_finish": "2024-08-22T17:45:25+00:00",
  "operating_reset_at": 1724349325,
  "operating": 0
 }
}
```
