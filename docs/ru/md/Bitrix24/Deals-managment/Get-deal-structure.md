﻿---
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
    Токен          = "37d1fe66006e9f06006b12e400000001000...";

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
...
```
