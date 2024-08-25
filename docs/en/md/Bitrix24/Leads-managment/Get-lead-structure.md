---
sidebar_position: 6
---

# Get lead structure
 Gets a structure with field descriptions for creating a lead



`Function GetLeadStructure(Val URL, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [crm.lead.fields](https://dev.1c-bitrix.ru/rest_help/crm/leads/crm_lead_fields.php)
:::
<br/>


```bsl title="Code example"
    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.GetLeadStructure(URL);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "6476c766006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetLeadStructure(URL, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetLeadStructure --url "b24-ar17wx.bitrix24.by" --token "ec4dc366006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "ID": {
   "type": "integer",
   "isRequired": false,
   "isReadOnly": true,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "ID"
  },
  "TITLE": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Название лида"
  },
  "HONORIFIC": {
   "type": "crm_status",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "statusType": "HONORIFIC",
   "title": "Обращение"
  },
  "NAME": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Имя"
  },
  "SECOND_NAME": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Отчество"
  },
  "LAST_NAME": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Фамилия"
  },
  "BIRTHDATE": {
   "type": "date",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Дата рождения"
  },
  "COMPANY_TITLE": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Название компании"
  },
  "SOURCE_ID": {
   "type": "crm_status",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "statusType": "SOURCE",
   "title": "Источник"
  },
  "SOURCE_DESCRIPTION": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Дополнительно об источнике"
  },
  "STATUS_ID": {
   "type": "crm_status",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "statusType": "STATUS",
   "title": "Стадия"
  },
  "STATUS_DESCRIPTION": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Дополнительно о стадии"
  },
  "STATUS_SEMANTIC_ID": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": true,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Состояние статуса"
  },
  "POST": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Должность"
  },
  "ADDRESS": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Адрес"
  },
  "ADDRESS_2": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Адрес (стр. 2)"
  },
  "ADDRESS_CITY": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Город"
  },
  "ADDRESS_POSTAL_CODE": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Почтовый индекс"
  },
  "ADDRESS_REGION": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Район"
  },
  "ADDRESS_PROVINCE": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Область"
  },
  "ADDRESS_COUNTRY": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Страна"
  },
  "ADDRESS_COUNTRY_CODE": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Код страны"
  },
  "ADDRESS_LOC_ADDR_ID": {
   "type": "integer",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Идентификатор адреса местоположения"
  },
  "CURRENCY_ID": {
   "type": "crm_currency",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Валюта"
  },
  "OPPORTUNITY": {
   "type": "double",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Сумма"
  },
  "IS_MANUAL_OPPORTUNITY": {
   "type": "char",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "IS_MANUAL_OPPORTUNITY"
  },
  "OPENED": {
   "type": "char",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Доступен для всех"
  },
  "COMMENTS": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Комментарий"
  },
  "HAS_PHONE": {
   "type": "char",
   "isRequired": false,
   "isReadOnly": true,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Задан телефон"
  },
  "HAS_EMAIL": {
   "type": "char",
   "isRequired": false,
   "isReadOnly": true,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Задан e-mail"
  },
  "HAS_IMOL": {
   "type": "char",
   "isRequired": false,
   "isReadOnly": true,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Задана открытая линия"
  },
  "ASSIGNED_BY_ID": {
   "type": "user",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Ответственный"
  },
  "CREATED_BY_ID": {
   "type": "user",
   "isRequired": false,
   "isReadOnly": true,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Кем создан"
  },
  "MODIFY_BY_ID": {
   "type": "user",
   "isRequired": false,
   "isReadOnly": true,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Кем изменен"
  },
  "MOVED_BY_ID": {
   "type": "user",
   "isRequired": false,
   "isReadOnly": true,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "MOVED_BY_ID"
  },
  "DATE_CREATE": {
   "type": "datetime",
   "isRequired": false,
   "isReadOnly": true,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Дата создания"
  },
  "DATE_MODIFY": {
   "type": "datetime",
   "isRequired": false,
   "isReadOnly": true,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Дата изменения"
  },
  "MOVED_TIME": {
   "type": "datetime",
   "isRequired": false,
   "isReadOnly": true,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "MOVED_TIME"
  },
  "COMPANY_ID": {
   "type": "crm_company",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Компания",
   "settings": {
    "parentEntityTypeId": 4
   }
  },
  "CONTACT_ID": {
   "type": "crm_contact",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "isDeprecated": true,
   "title": "Контакт"
  },
  "CONTACT_IDS": {
   "type": "crm_contact",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": true,
   "isDynamic": false,
   "title": "CONTACT_IDS"
  },
  "IS_RETURN_CUSTOMER": {
   "type": "char",
   "isRequired": false,
   "isReadOnly": true,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Повторный лид"
  },
  "DATE_CLOSED": {
   "type": "datetime",
   "isRequired": false,
   "isReadOnly": true,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Дата завершения"
  },
  "ORIGINATOR_ID": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Внешний источник"
  },
  "ORIGIN_ID": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Идентификатор элемента во внешнем источнике"
  },
  "UTM_SOURCE": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Рекламная система"
  },
  "UTM_MEDIUM": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Тип трафика"
  },
  "UTM_CAMPAIGN": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Обозначение рекламной кампании"
  },
  "UTM_CONTENT": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Содержание кампании"
  },
  "UTM_TERM": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Условие поиска кампании"
  },
  "LAST_ACTIVITY_TIME": {
   "type": "datetime",
   "isRequired": false,
   "isReadOnly": true,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "LAST_ACTIVITY_TIME"
  },
  "LAST_ACTIVITY_BY": {
   "type": "user",
   "isRequired": false,
   "isReadOnly": true,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "LAST_ACTIVITY_BY"
  },
  "PHONE": {
   "type": "crm_multifield",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": true,
   "isDynamic": false,
   "title": "Телефон"
  },
  "EMAIL": {
   "type": "crm_multifield",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": true,
   "isDynamic": false,
   "title": "E-mail"
  },
  "WEB": {
   "type": "crm_multifield",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": true,
   "isDynamic": false,
   "title": "Сайт"
  },
  "IM": {
   "type": "crm_multifield",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": true,
   "isDynamic": false,
   "title": "Мессенджер"
  },
  "LINK": {
   "type": "crm_multifield",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": true,
   "isDynamic": false,
   "title": "LINK"
  }
 },
 "time": {
  "start": 1724490193.53042,
  "finish": 1724490193.56597,
  "duration": 0.035545825958252,
  "processing": 0.0106868743896484,
  "date_start": "2024-08-24T09:03:13+00:00",
  "date_finish": "2024-08-24T09:03:13+00:00",
  "operating_reset_at": 1724490793,
  "operating": 0
 }
}
```
