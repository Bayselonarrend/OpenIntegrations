﻿---
sidebar_position: 1
---

# Get categories and product types tree
 Returns the categories and types for products in a tree view



`Function GetCategoriesAndProductTypesTree(Val ClientID, Val APIKey, Val Lang = "DEFAULT") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | Lang | --lang | String | Response language: DEFAULT (Russian), RU, EN, TR (Turkish), ZH_HANS (Chinese)) |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Ozon Seller API

<br/>

:::tip
Product creation is only available in the last level categories, compare exactly with the categories on your site. Categories are not created at the user's request

 Carefully choose the category for the product: different commission rates apply for different categories.

 Method at API documentation: [post /v1/description-category/tree](https://docs.ozon.ru/api/seller/#operation/DescriptionCategoryAPI_GetTree)
:::
<br/>


```bsl title="Code example"
    ClientID = "2128753";
    APIKey   = "7cc90d26-33e4-499b...";

    Result = OPI_Ozon.GetCategoriesAndProductTypesTree(ClientID, APIKey, "EN");

    Result = OPI_Ozon.GetCategoriesAndProductTypesTree(ClientID, APIKey);
```



```sh title="CLI command example"
    
  oint ozon GetCategoriesAndProductTypesTree --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --lang %lang%

```

```json title="Result"
{
 "result": [
  {
   "description_category_id": 17027492,
   "category_name": "Канцелярские товары",
   "disabled": false,
   "children": [
    {
     "description_category_id": 71328593,
     "category_name": "Оборудование для торговли",
     "disabled": false,
     "children": [
      {
       "type_name": "Ценник",
       "type_id": 970615927,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Коробка для товара",
       "type_id": 971448894,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Демонстрационная система",
       "type_id": 94485,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Счетчик посетителей электронный",
       "type_id": 661551652,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Дисплей торговый",
       "type_id": 970616770,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Светодиодная вывеска для магазина",
       "type_id": 970694426,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Разменный аппарат",
       "type_id": 971132995,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Полочный разделитель",
       "type_id": 970616683,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Карман информационный",
       "type_id": 970615403,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Антикражный замок для витрины",
       "type_id": 971001293,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Крючок на перфорацию",
       "type_id": 971844358,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Тележка покупательская",
       "type_id": 970855215,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Рекламный воблер",
       "type_id": 971036158,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Биркодержатель для игольчатого пистолета",
       "type_id": 971323480,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Комплектующее для торгового оборудования",
       "type_id": 972101856,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Пресс-волл",
       "type_id": 971043038,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Урна для пожертвований",
       "type_id": 970842802,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Торговый автомат механический",
       "type_id": 971065057,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Рамка информационная",
       "type_id": 970615353,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Кассета для купюроприемника",
       "type_id": 971287223,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Поручень рекламный",
       "type_id": 971432456,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Гардеробные номерки",
       "type_id": 970986820,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Информационный стенд",
       "type_id": 790183771,
       "disabled": false,
       "children": []
      },
...
```
