---
sidebar_position: 1
---

# Get order list
 Returns the community's order list


*Function GetOrderList(Val Parameters = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK 

```bsl title="Code example"
	
 Parameters = GetVKParameters();
 Result = OPI_VK.GetOrderList(Parameters);
	
```

```sh title="CLI command example"
 
 oint vk GetOrderList --auth %auth%


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
 "text": "1 ₽"
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
 "text": "1 ₽"
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
 "name": "All goods"
 }
 },
 "description": "Product description",
 "id": 8653766,
 "owner_id": -218861756,
 "price": {
 "amount": "100",
 "currency": {
 "id": 643,
 "name": "RUB",
 "title": "₽"
 },
 "text": "1 ₽",
 "discount_rate": -93,
 "old_amount": "1500",
 "old_amount_text": "15 ₽"
 },
 "title": "TestProduct (Red)",
 "date": 1708083983,
 "item_type": 0,
 "is_owner": true,
 "is_adult": false,
 "thumb_photo": "https://sun6-22.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/wosvBQJa9bQ.jpg?crop=0,0,1,1&size=0x400&quality=95&sign=6068bf9db412cd491d405a90737e5208&c_uniq_tag=k-olNZ8Ykr5YbvQQiBDDJlj5UeQvopai5F2oAP29As8",
 "is_main_variant": true,
 "property_values": [],
 "cart_quantity": 0,
 "sku": "12 345",
 "reject_info": {
 "title": "Moderation",
 "description": "Denied",
 "moderation_status": 2,
 "info_link": "[https://vk.com/faq20323|Market rules VKontakte]",
 "write_to_support_link": "https://vk.ru/im?media=&sel=-215808305&ref=ProductId%3D-218861756_8653766",
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
 "has_group_access": true
 },
 "title": "TestProduct (Red)",
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
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/wosvBQJa9bQ.jpg?size=75x75&quality=95&sign=2381700819636478eed1d74cb2342a06&c_uniq_tag=PFGPvoMq1W4_tW4Zs_yuMQQH_dccpW_VhCO5KzZbgmA&type=album"
 },
 {
 "height": 130,
 "type": "m",
 "width": 130,
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/wosvBQJa9bQ.jpg?size=130x130&quality=95&sign=ec1b9f298b5a5b4f40bfd77d0d37db39&c_uniq_tag=3gV224HcqJQb6U5eVvEz8FPgqw4dsawG5sm37_Cohdk&type=album"
 },
 {
 "height": 604,
 "type": "x",
 "width": 604,
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/wosvBQJa9bQ.jpg?size=604x604&quality=95&sign=9025e54dce56c9ffea6234b208d605ce&c_uniq_tag=klrzQ_lMUnW6X_EKtFapT5BNwVqsFSHAsOriM9kg2R4&type=album"
 },
 {
 "height": 807,
 "type": "y",
 "width": 807,
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/wosvBQJa9bQ.jpg?size=807x807&quality=95&sign=2e62222df7b36319795604b61f47b4de&c_uniq_tag=qqBUlUsU--W6-e7SmdLdpZ6QG9-_jM_W2Z7_776wI0w&type=album"
 },
 {
 "height": 1024,
 "type": "z",
 "width": 1024,
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/wosvBQJa9bQ.jpg?size=1024x1024&quality=95&sign=cc0f2380133dbabee8f4e5661dded251&c_uniq_tag=Pix70Am17hEb8Cug1vSry2cmGepMsSOglR9jEuCikNo&type=album"
 },
 {
 "height": 130,
 "type": "o",
 "width": 130,
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/wosvBQJa9bQ.jpg?size=130x130&quality=95&sign=ec1b9f298b5a5b4f40bfd77d0d37db39&c_uniq_tag=3gV224HcqJQb6U5eVvEz8FPgqw4dsawG5sm37_Cohdk&type=album"
 },
 {
 "height": 200,
 "type": "p",
 "width": 200,
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/wosvBQJa9bQ.jpg?size=200x200&quality=95&sign=1e549ead12d7f09f418a528f48541fdb&c_uniq_tag=C6MjAy6V4E36QVKPiD1S4SRl2TQYO2DWimX7tb8EoU8&type=album"
 },
 {
 "height": 320,
 "type": "q",
 "width": 320,
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/wosvBQJa9bQ.jpg?size=320x320&quality=95&sign=ecd2cae5d09c0411ca0452a32c1f867e&c_uniq_tag=Iuzo5hOoQm39gPIAmS9zeIdcLeumdJzt4vN-xW85kJs&type=album"
 },
 {
 "height": 510,
 "type": "r",
 "width": 510,
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/wosvBQJa9bQ.jpg?size=510x510&quality=95&sign=d53aa504f089cf710968a6cfed71585d&c_uniq_tag=fKqxZObF1j5m5Mu_QbeIDijtNIT9o7WNYsEu-N6xni4&type=album"
 }
 ],
 "text": "",
 "web_view_token": "5cf827ef295277edce",
 "has_tags": false
 },
 "variants": [
 "Red"
 ]
 }
 ],
 "delivery": {
 "address": "Minsk",
 "type_id": "default"
 },
 "recipient": {
 "name": "Titovets Anton",
 "phone": "+375447830891",
 "display_text": "Titovets Anton, +375447830891"
 },
 "payment": {
 "status": "Not paid",
 "payment_status": "not_paid"
 },
 "seller": {
 "title": "Market",
 "name": "Test",
 "group_id": 218861756,
 "contact_id": -218861756
 }
 }
]

```
