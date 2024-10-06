---
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

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

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
   "description_category_id": 99999999,
   "category_name": "Кино, музыка, видеоигры, софт",
   "disabled": false,
   "children": [
    {
     "description_category_id": 17027903,
     "category_name": "Подарочный сертификат Ozon",
     "disabled": true,
     "children": [
      {
       "type_name": "Банковская карта",
       "type_id": 971229967,
       "disabled": true,
       "children": []
      },
      {
       "type_name": "Электронный подарочный сертификат",
       "type_id": 94957,
       "disabled": true,
       "children": []
      },
      {
       "type_name": "Подарочный сертификат",
       "type_id": 94955,
       "disabled": true,
       "children": []
      },
      {
       "type_name": "Ozon.Card",
       "type_id": 277418272,
       "disabled": true,
       "children": []
      },
      {
       "type_name": "Ozon Premium",
       "type_id": 241039050,
       "disabled": true,
       "children": []
      }
     ]
    },
    {
     "description_category_id": 46590429,
     "category_name": "Кино, музыка, видеоигры, софт",
     "disabled": false,
     "children": [
      {
       "type_name": "Видеоигра",
       "type_id": 409596018,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Программа",
       "type_id": 392638731,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Фильм",
       "type_id": 392638730,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Музыкальный диск",
       "type_id": 392547272,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Пластинка виниловая винтажная",
       "type_id": 971888494,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Пластинка виниловая современная",
       "type_id": 971888493,
       "disabled": false,
       "children": []
      }
     ]
    },
    {
     "description_category_id": 200001489,
     "category_name": "Цифровые товары",
     "disabled": true,
     "children": [
      {
       "type_name": "Подписка на видеоигры",
       "type_id": 970591519,
       "disabled": true,
       "children": []
      },
      {
       "type_name": "Цифровая версия игр для Xbox",
       "type_id": 970730371,
       "disabled": true,
       "children": []
      },
      {
       "type_name": "Сезонный пропуск",
       "type_id": 970855496,
       "disabled": true,
       "children": []
      },
      {
       "type_name": "Ветеринарные услуги онлайн",
       "type_id": 970995726,
       "disabled": true,
       "children": []
      },
      {
       "type_name": "Подписка на облачные хранилища",
       "type_id": 970841193,
       "disabled": true,
       "children": []
      },
      {
       "type_name": "Пополнение баланса соцсетей",
       "type_id": 970997471,
       "disabled": true,
       "children": []
      },
      {
       "type_name": "Цифровая версия игр для ПК",
       "type_id": 970591520,
       "disabled": true,
       "children": []
      },
      {
       "type_name": "Подписка на музыку",
       "type_id": 970727001,
       "disabled": true,
       "children": []
      },
      {
       "type_name": "Цифровое дополнение к видеоигре",
       "type_id": 970855497,
       "disabled": true,
       "children": []
      },
      {
       "type_name": "Сертификат на гарантию",
       "type_id": 971033670,
       "disabled": true,
...
```
