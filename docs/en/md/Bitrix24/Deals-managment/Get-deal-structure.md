﻿---
sidebar_position: 6
---

# Get deal structure
 Gets a structure with field descriptions for creating a deal



`Function GetDealStructure(Val URL, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [crm.deal.fields](https://dev.1c-bitrix.ru/rest_help/crm/cdeals/crm_deal_fields.php)
:::
<br/>


```bsl title="Code example"
    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.GetDealStructure(URL);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetDealStructure(URL, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetDealStructure --url "b24-ar17wx.bitrix24.by" --token "6476c766006e9f06006b12e400000001000..."

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
