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
   "description_category_id": 92120918,
   "category_name": "Автомототехника",
   "disabled": false,
   "children": [
    {
     "description_category_id": 200000672,
     "category_name": "Спецтехника и грузовики",
     "disabled": true,
     "children": [
      {
       "type_name": "Техника коммунальная",
       "type_id": 971322202,
       "disabled": true,
       "children": []
      },
      {
       "type_name": "Спецтехника",
       "type_id": 971322229,
       "disabled": true,
       "children": []
      }
     ]
    },
    {
     "description_category_id": 17027951,
     "category_name": "Мототехника",
     "disabled": false,
     "children": [
      {
       "type_name": "Снегоход детский",
       "type_id": 971742428,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Мотоцикл",
       "type_id": 115948095,
       "disabled": true,
       "children": []
      },
      {
       "type_name": "Мопед",
       "type_id": 971309510,
       "disabled": true,
       "children": []
      },
      {
       "type_name": "Мотоцикл детский",
       "type_id": 970967803,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Сноубайк",
       "type_id": 971038323,
       "disabled": true,
       "children": []
      },
      {
       "type_name": "Гидроцикл",
       "type_id": 971322241,
       "disabled": true,
       "children": []
      },
      {
       "type_name": "Багги",
       "type_id": 971322654,
       "disabled": true,
       "children": []
      },
      {
       "type_name": "Квадроцикл",
       "type_id": 96591,
       "disabled": true,
       "children": []
      },
      {
       "type_name": "Квадроцикл детский",
       "type_id": 970828017,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Модуль для мотобуксировщика",
       "type_id": 972068815,
       "disabled": true,
       "children": []
      },
      {
       "type_name": "Автомобиль детский",
       "type_id": 971447132,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Мотобуксировщик",
       "type_id": 971049470,
       "disabled": true,
       "children": []
      },
      {
       "type_name": "Снегоход",
       "type_id": 96594,
       "disabled": true,
       "children": []
      },
      {
       "type_name": "Скутер",
       "type_id": 96593,
       "disabled": true,
       "children": []
      }
     ]
    },
    {
     "description_category_id": 74179490,
     "category_name": "Автомобили",
     "disabled": true,
     "children": [
      {
       "type_name": "Электромобиль",
       "type_id": 972085867,
       "disabled": true,
       "children": []
      },
      {
       "type_name": "Автомобиль",
       "type_id": 970636239,
       "disabled": true,
       "children": []
      }
     ]
    },
    {
     "description_category_id": 43443516,
     "category_name": "Взрослый электротранспорт",
     "disabled": true,
     "children": [
      {
       "type_name": "Электроквадроцикл",
       "type_id": 970957816,
       "disabled": true,
       "children": []
      },
      {
       "type_name": "Электрокар платформенный",
       "type_id": 971392555,
...
```
