---
sidebar_position: 6
---

# Получить структуру сделки
 Получает структуру с описанием полей для создания сделки



`Функция ПолучитьСтруктуруСделки(Знач URL, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrix24

<br/>

:::tip
Метод в документации API: [crm.deal.fields](https://dev.1c-bitrix.ru/rest_help/crm/cdeals/crm_deal_fields.php)
:::
<br/>


```bsl title="Пример кода"
    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Результат = OPI_Bitrix24.ПолучитьСтруктуруСделки(URL);

    URL            = "b24-ar17wx.bitrix24.by";
    Токен          = "6476c766006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ПолучитьСтруктуруСделки(URL, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьСтруктуруСделки --url "b24-ar17wx.bitrix24.by" --token "6476c766006e9f06006b12e400000001000..."

```

```json title="Результат"
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
   "title": "Название"
  },
  "TYPE_ID": {
   "type": "crm_status",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "statusType": "DEAL_TYPE",
   "title": "Тип"
  },
  "CATEGORY_ID": {
   "type": "crm_category",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": true,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Воронка"
  },
  "STAGE_ID": {
   "type": "crm_status",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "statusType": "DEAL_STAGE",
   "title": "Стадия сделки"
  },
  "STAGE_SEMANTIC_ID": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": true,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Группа стадии"
  },
  "IS_NEW": {
   "type": "char",
   "isRequired": false,
   "isReadOnly": true,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Новая сделка"
  },
  "IS_RECURRING": {
   "type": "char",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Регулярная сделка"
  },
  "IS_RETURN_CUSTOMER": {
   "type": "char",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Повторная сделка"
  },
  "IS_REPEATED_APPROACH": {
   "type": "char",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Повторное обращение"
  },
  "PROBABILITY": {
   "type": "integer",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Вероятность"
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
  "TAX_VALUE": {
   "type": "double",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Ставка налога"
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
   "title": "Контакты"
  },
  "QUOTE_ID": {
   "type": "crm_quote",
   "isRequired": false,
   "isReadOnly": true,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Предложение",
   "settings": {
    "parentEntityTypeId": 7
   }
  },
  "BEGINDATE": {
   "type": "date",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Дата начала"
  },
  "CLOSEDATE": {
   "type": "date",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Дата завершения"
  },
  "OPENED": {
   "type": "char",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Доступна для всех"
  },
  "CLOSED": {
   "type": "char",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Закрыта"
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
   "title": "Кем создана"
  },
  "MODIFY_BY_ID": {
   "type": "user",
   "isRequired": false,
   "isReadOnly": true,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Кем изменена"
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
  "LEAD_ID": {
   "type": "crm_lead",
   "isRequired": false,
   "isReadOnly": true,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Лид",
   "settings": {
    "parentEntityTypeId": 1
   }
  },
  "ADDITIONAL_INFO": {
   "type": "string",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Дополнительная информация"
  },
  "LOCATION_ID": {
   "type": "location",
   "isRequired": false,
   "isReadOnly": false,
   "isImmutable": false,
   "isMultiple": false,
   "isDynamic": false,
   "title": "Местоположение"
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
  }
 },
 "time": {
  "start": 1724580112.9612,
  "finish": 1724580112.99473,
  "duration": 0.0335350036621094,
  "processing": 0.0105230808258057,
  "date_start": "2024-08-25T10:01:52+00:00",
  "date_finish": "2024-08-25T10:01:52+00:00",
  "operating_reset_at": 1724580712,
  "operating": 0
 }
}
```
