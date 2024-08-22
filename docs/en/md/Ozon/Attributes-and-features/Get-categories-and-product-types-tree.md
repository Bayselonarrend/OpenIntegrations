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
   "description_category_id": 17027485,
   "category_name": "Хобби и творчество",
   "disabled": false,
   "children": [
    {
     "description_category_id": 88621580,
     "category_name": "Оборудование для творчества",
     "disabled": false,
     "children": [
      {
       "type_name": "Пленка для аэрографии",
       "type_id": 970849152,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Сопло для аэрографа",
       "type_id": 970849029,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Набор для чистки аэрографа",
       "type_id": 970849022,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Компрессор для аэрографа",
       "type_id": 970849026,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Аэрограф для творчества",
       "type_id": 970843532,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Игла для аэрографа",
       "type_id": 970849028,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Шланг для аэрографа",
       "type_id": 970849042,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Расходные материалы для аэрографа",
       "type_id": 971880987,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Трафарет для аэрографии",
       "type_id": 970849027,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Средство для чистки аэрографа",
       "type_id": 970849043,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Диффузор для аэрографа",
       "type_id": 970849040,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Емкость для аэрографа",
       "type_id": 971748069,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Краска для аэрографа",
       "type_id": 970849024,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Подставка для аэрографа",
       "type_id": 970849041,
       "disabled": false,
       "children": []
      }
     ]
    },
 	...
    }
   ]
  }
 ]
}
```
