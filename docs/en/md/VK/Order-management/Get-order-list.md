---
sidebar_position: 1
---

# Get order list
 Returns the community's order list



`Function GetOrderList(Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();
    Result     = OPI_VK.GetOrderList(Parameters);
```



```sh title="CLI command example"
    
  oint vk GetOrderList --auth "GetVKParameters()"

```

```json title="Result"
[
 {
  "id": 397209,
  "group_id": 218861756,
  "user_id": 657846756,
  "date": 1708092731,
  "status": 0,
  "items_count": 1,
  "total_price": {
   "amount": "100",
   "currency": {
    "id": 643,
    "name": "RUB",
    "title": "₽"
   },
   "text": "1 ₽"
  },
  "display_order_id": "657846756-397209",
  "merchant_comment": "",
  "weight": 100,
  "tags": [],
  "dimensions": {
   "width": 20,
   "height": 30,
   "length": 40
  },
  "preview_order_items": [
   {
    "owner_id": -218861756,
    "item_id": 8653766,
    "price": {
     "amount": "100",
     "currency": {
      "id": 643,
      "name": "RUB",
      "title": "₽"
     },
     "text": "1 ₽"
    },
    "quantity": 1,
    "item": {
     "availability": 0,
     "category": {
      "inner_type": "market_market_category_old",
      "id": 20173,
      "name": "",
      "section": {
       "id": 9000,
       "name": "Все товары"
      }
     },
     "description": "Описание товара",
     "id": 8653766,
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
     "title": "Тестовый товар (Красный)",
     "date": 1708083983,
     "item_type": 0,
     "is_owner": true,
     "is_adult": false,
     "thumb_photo": "https://sun56-2.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/wosvBQJa9bQ.jpg?crop=0,0,1,1&size=0x400&quality=95&sign=6068bf9db412cd491d405a90737e5208&c_uniq_tag=k-olNZ8Ykr5YbvQQiBDDJlj5UeQvopai5F2oAP29As8",
     "cart_quantity": 0,
     "sku": "12 345",
     "reject_info": {
      "title": "Отредактируйте товар, чтобы опубликовать в Маркете ВКонтакте",
      "description": "Товар отклонён. Чтобы добавить его в «Маркет», укажите реальную цену товара или стоимость оказания услуги.",
      "moderation_status": 2,
      "info_link": "[https://vk.com/faq20323|Правила Маркета ВКонтакте]",
      "write_to_support_link": "https://vk.com/im?media=&sel=-215808305&ref=ProductId%3D-218861756_8653766",
      "in_progress": false,
      "buttons": [
       {
        "type": "market_edit",
        "url": "https://vk.com/app7702617#owner_id=-218861756&item_id=8653766&type=market"
       },
       {
        "type": "market_delete"
       }
      ]
     },
     "has_group_access": true,
     "market_url": "https://vk.com/market/product/testovy-tovar-krasny-218861756-8653766"
    },
    "title": "Тестовый товар (Красный)",
    "photo": {
     "album_id": -105,
     "date": 1708092731,
     "id": 457241543,
     "owner_id": 657846756,
     "sizes": [
      {
       "height": 75,
       "type": "s",
       "width": 75,
       "url": "https://sun9-32.userapi.com/s/v1/ig2/31vvuOgBYo0XLpwmR4BsP1ilGbMDyMakBQIYLHejeBhcKeBHxTjKG25nKWgMCYPO-BgpcfrHGhrqpB1Qk7wWCZA-.jpg?quality=95&as=32x32,48x48,72x72,108x108,160x160,240x240,360x360,480x480,540x540,640x640,720x720,1024x1024&from=bu&cs=75x75"
      },
      {
       "height": 130,
       "type": "m",
       "width": 130,
       "url": "https://sun9-32.userapi.com/s/v1/ig2/31vvuOgBYo0XLpwmR4BsP1ilGbMDyMakBQIYLHejeBhcKeBHxTjKG25nKWgMCYPO-BgpcfrHGhrqpB1Qk7wWCZA-.jpg?quality=95&as=32x32,48x48,72x72,108x108,160x160,240x240,360x360,480x480,540x540,640x640,720x720,1024x1024&from=bu&cs=130x130"
      },
      {
       "height": 604,
       "type": "x",
       "width": 604,
       "url": "https://sun9-32.userapi.com/s/v1/ig2/31vvuOgBYo0XLpwmR4BsP1ilGbMDyMakBQIYLHejeBhcKeBHxTjKG25nKWgMCYPO-BgpcfrHGhrqpB1Qk7wWCZA-.jpg?quality=95&as=32x32,48x48,72x72,108x108,160x160,240x240,360x360,480x480,540x540,640x640,720x720,1024x1024&from=bu&cs=604x604"
      },
      {
       "height": 807,
       "type": "y",
       "width": 807,
       "url": "https://sun9-32.userapi.com/s/v1/ig2/31vvuOgBYo0XLpwmR4BsP1ilGbMDyMakBQIYLHejeBhcKeBHxTjKG25nKWgMCYPO-BgpcfrHGhrqpB1Qk7wWCZA-.jpg?quality=95&as=32x32,48x48,72x72,108x108,160x160,240x240,360x360,480x480,540x540,640x640,720x720,1024x1024&from=bu&cs=807x807"
      },
      {
       "height": 1024,
       "type": "z",
       "width": 1024,
       "url": "https://sun9-32.userapi.com/s/v1/ig2/31vvuOgBYo0XLpwmR4BsP1ilGbMDyMakBQIYLHejeBhcKeBHxTjKG25nKWgMCYPO-BgpcfrHGhrqpB1Qk7wWCZA-.jpg?quality=95&as=32x32,48x48,72x72,108x108,160x160,240x240,360x360,480x480,540x540,640x640,720x720,1024x1024&from=bu&cs=1024x1024"
      },
      {
       "height": 130,
       "type": "o",
       "width": 130,
       "url": "https://sun9-32.userapi.com/s/v1/ig2/31vvuOgBYo0XLpwmR4BsP1ilGbMDyMakBQIYLHejeBhcKeBHxTjKG25nKWgMCYPO-BgpcfrHGhrqpB1Qk7wWCZA-.jpg?quality=95&as=32x32,48x48,72x72,108x108,160x160,240x240,360x360,480x480,540x540,640x640,720x720,1024x1024&from=bu&cs=130x130"
      },
      {
       "height": 200,
       "type": "p",
       "width": 200,
       "url": "https://sun9-32.userapi.com/s/v1/ig2/31vvuOgBYo0XLpwmR4BsP1ilGbMDyMakBQIYLHejeBhcKeBHxTjKG25nKWgMCYPO-BgpcfrHGhrqpB1Qk7wWCZA-.jpg?quality=95&as=32x32,48x48,72x72,108x108,160x160,240x240,360x360,480x480,540x540,640x640,720x720,1024x1024&from=bu&cs=200x200"
      },
      {
       "height": 320,
       "type": "q",
       "width": 320,
       "url": "https://sun9-32.userapi.com/s/v1/ig2/31vvuOgBYo0XLpwmR4BsP1ilGbMDyMakBQIYLHejeBhcKeBHxTjKG25nKWgMCYPO-BgpcfrHGhrqpB1Qk7wWCZA-.jpg?quality=95&as=32x32,48x48,72x72,108x108,160x160,240x240,360x360,480x480,540x540,640x640,720x720,1024x1024&from=bu&cs=320x320"
      },
      {
...
```
