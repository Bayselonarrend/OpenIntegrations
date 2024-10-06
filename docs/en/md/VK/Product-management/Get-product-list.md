---
sidebar_position: 2
---

# Get product list
 Gets the community's product list



`Function GetProductList(Val Selection = "", Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Selection | --sel | String, Number | Selection ID, if filtering is needed |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - Array of product maps

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();
    Result     = OPI_VK.GetProductList(, Parameters);
```



```sh title="CLI command example"
    
  oint vk GetProductList --sel %sel% --auth "GetVKParameters()"

```

```json title="Result"
[
 {
  "availability": 0,
  "category": {
   "inner_type": "market_market_category_old",
   "id": 20173,
   "name": "Батарейки",
   "section": {
    "id": 10016,
    "name": "Канцелярские товары"
   }
  },
  "description": "Описание товара",
  "id": 9642576,
  "owner_id": -218861756,
  "price": {
   "amount": "100",
   "currency": {
    "id": 643,
    "name": "RUB",
    "title": "₽"
   },
   "text": "1 ₽",
   "discount_rate": -93,
   "old_amount": "1500",
   "old_amount_text": "15 ₽"
  },
  "title": "Тестовый товар (со свойством)",
  "other_items": [
   {
    "title": "Другие товары сообщества",
    "view_type": 1,
    "item_ids": [
     "-218861756_9640025",
     "-218861756_9578921",
     "-218861756_9499082",
     "-218861756_9423489",
     "-218861756_9387853",
     "-218861756_9320009",
     "-218861756_9320008",
     "-218861756_9259547",
     "-218861756_9259390",
     "-218861756_9192466"
    ],
    "referrer_item_type": "other_goods"
   }
  ],
  "dimensions": {
   "width": 20,
   "height": 30,
   "length": 40
  },
  "weight": 100,
  "albums_ids": [],
  "photos": [],
  "can_comment": 1,
  "can_repost": 1,
  "likes": {
   "count": 0,
   "user_likes": 0
  },
  "reposts": {
   "count": 0
  },
  "views_count": 0,
  "variants_grid": [],
  "owner_info": {
   "avatar": [],
   "name": "Test",
   "category": "Батарейки",
   "category_url": "/market-218861756",
   "is_corporated_market": false,
   "market_type": "pro"
  },
  "can_edit": true,
  "can_delete": true,
  "can_recover": false,
  "can_show_convert_to_service": true,
  "promotion": {
   "is_available": true
  },
  "labels": [],
  "date": 1727611884,
  "item_type": 0,
  "is_owner": true,
  "is_adult": false,
  "thumb_photo": "",
  "variants_grouping_id": 10666,
  "cart_quantity": 0,
  "sku": "12345",
  "has_group_access": true,
  "market_url": "https://vk.com/market/product/testovy-tovar-so-svoystvom-218861756-9642576"
 },
 {
  "availability": 0,
  "category": {
   "inner_type": "market_market_category_old",
   "id": 20173,
   "name": "Батарейки",
   "section": {
    "id": 10016,
    "name": "Канцелярские товары"
   }
  },
  "description": "Описание товара",
  "id": 9640025,
  "owner_id": -218861756,
  "price": {
   "amount": "100",
   "currency": {
    "id": 643,
    "name": "RUB",
    "title": "₽"
   },
   "text": "1 ₽",
   "discount_rate": -93,
   "old_amount": "1500",
   "old_amount_text": "15 ₽"
  },
  "title": "Тестовый товар (другой)",
  "other_items": [
   {
    "title": "Другие товары сообщества",
    "view_type": 1,
    "item_ids": [
     "-218861756_9642576",
     "-218861756_9578921",
     "-218861756_9499082",
     "-218861756_9423489",
     "-218861756_9387853",
     "-218861756_9320009",
     "-218861756_9320008",
     "-218861756_9259547",
     "-218861756_9259390",
     "-218861756_9192466"
    ],
    "referrer_item_type": "other_goods"
   }
  ],
  "dimensions": {
   "width": 20,
   "height": 30,
   "length": 40
  },
  "weight": 100,
  "albums_ids": [],
  "photos": [],
  "can_comment": 1,
  "can_repost": 1,
  "likes": {
...
```
