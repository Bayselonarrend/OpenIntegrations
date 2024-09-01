---
sidebar_position: 5
---

# Get products content rating
 Gets products content rating by SKU



`Function GetProductsContentRating(Val ClientID, Val APIKey, Val SKU) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | SKU | --sku | Number, Array Of Number | Products identifiers in the Ozon system (SKU) |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
Method at API documentation: [post /v1/product/rating-by-sku](https://docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductRatingBySku)
:::
<br/>


```bsl title="Code example"
    ClientID = "2128753";
    APIKey   = "7cc90d26-33e4-499b...";
    SKU      = 1626044001;

    Result = OPI_Ozon.GetProductsContentRating(ClientID, APIKey, SKU);
```



```sh title="CLI command example"
    
  oint ozon GetProductsContentRating --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --sku %sku%

```

```json title="Result"
{
 "products": [
  {
   "sku": 1626044001,
   "rating": 70,
   "groups": [
    {
     "key": "important_attributes",
     "name": "Важные атрибуты",
     "rating": 100,
     "weight": 30,
     "conditions": [
      {
       "key": "important_2",
       "description": "Заполнено 2 атрибута и более",
       "fulfilled": true,
       "cost": 50
      },
      {
       "key": "important_50_percent",
       "description": "Заполнено более 50% атрибутов",
       "fulfilled": true,
       "cost": 25
      },
      {
       "key": "important_70_percent",
       "description": "Заполнено более 70% атрибутов",
       "fulfilled": true,
       "cost": 25
      }
     ],
     "improve_attributes": [],
     "improve_at_least": 0
    },
    {
     "key": "other_attributes",
     "name": "Остальные атрибуты",
     "rating": 100,
     "weight": 25,
     "conditions": [
      {
       "key": "other_2",
       "description": "Заполнено 2 атрибута и более",
       "fulfilled": true,
       "cost": 50
      },
      {
       "key": "other_50_percent",
       "description": "Заполнено более 50% атрибутов",
       "fulfilled": true,
       "cost": 50
      }
     ],
     "improve_attributes": [],
     "improve_at_least": 0
    },
    {
     "key": "text",
     "name": "Текстовое описание",
     "rating": 50,
     "weight": 20,
     "conditions": [
      {
       "key": "text_annotation_100_chars",
       "description": "Аннотация более 100 знаков",
       "fulfilled": true,
       "cost": 25
      },
      {
       "key": "text_annotation_500_chars",
       "description": "Аннотация более 500 знаков",
       "fulfilled": true,
       "cost": 25
      },
      {
       "key": "text_rich",
       "description": "Заполнен Rich-контент",
       "fulfilled": false,
       "cost": 100
      }
     ],
     "improve_attributes": [
      {
       "id": 11254,
       "name": "Rich-контент JSON"
      }
     ],
     "improve_at_least": 1
    },
    {
     "key": "media",
     "name": "Медиа",
     "rating": 20,
     "weight": 25,
     "conditions": [
      {
       "key": "media_video_cover",
       "description": "Добавлена видеообложка",
       "fulfilled": false,
       "cost": 50
      },
      {
       "key": "media_video",
       "description": "Добавлено видео",
       "fulfilled": false,
       "cost": 30
      },
      {
       "key": "media_images_3",
       "description": "Добавлено 3 изображения и более",
       "fulfilled": true,
       "cost": 20
      }
     ],
     "improve_attributes": [
      {
       "id": 21841,
       "name": "Озон.Видео: ссылка"
      },
      {
       "id": 21845,
       "name": "Озон.Видеообложка: ссылка"
      }
     ],
     "improve_at_least": 2
    }
   ]
  }
 ]
}
```
