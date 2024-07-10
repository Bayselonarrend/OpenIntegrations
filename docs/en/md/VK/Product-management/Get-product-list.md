---
sidebar_position: 2
---

# Get product list
 Gets the community's product list


<br/>


`Function GetProductList(Val Selection = "", Val Parameters = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Selection | --sel | String, Number | Selection ID, if filtering is needed |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Array of product maps





```bsl title="Code example"
 
 Response = OPI_VK.GetProductList(, Parameters);
 Response = OPI_Tools.JSONString(Response);
 
```
	


```sh title="CLI command example"
 
 oint vk GetProductList --sel %sel% --auth %auth%

```

```json title="Result"
 [
 {
 "sku": "12 345",
 "is_main_variant": true,
 "is_owner": true,
 "date": 1708079311,
 "can_show_convert_to_service": true,
 "can_delete": true,
 "views_count": 1,
 "thumb_photo": "https://sun56-2.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/Gfx6FaCjN0Q.jpg?crop=0,0,1,1&size=0x400&quality=95&sign=a4094440c3769389eefbbb6f63fb3b06&c_uniq_tag=wg_JEvsvTTjzR-t_GyVXH_8VjxbraezNWRHCn7b6mBQ",
 "likes": {
 "user_likes": 0,
 "count": 0
 },
 "can_recover": false,
 "can_repost": 1,
 "reject_info": {
 "buttons": [
 {
 "url": "https://vk.com/app7702617#owner_id=-218861756&item_id=8653408&type=market",
 "type": "market_edit"
 },
 {
 "type": "market_delete"
 }
 ],
 "in_progress": false,
 "description": "Test item description",
 "moderation_status": 2,
 "title": ""
 },
 "photos": [
 {
 "has_tags": false,
 "web_view_token": "8aafd75b91f2cf1425",
 "text": "",
 "sizes": [
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/Gfx6FaCjN0Q.jpg?size=75x75&quality=95&sign=8799f9f279ce65bf9ac62a5724971675&c_uniq_tag=RBTqNLzMstWYqH3UP-8FEDlMyg31ogY38n3XLQ-lOCE&type=album",
 "width": 75,
 "type": "s",
 "height": 75
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/Gfx6FaCjN0Q.jpg?size=130x130&quality=95&sign=68127c81f17e0792a39275ac56a00349&c_uniq_tag=AYaHXxR8M9NOwGxm3W7OCKV8m8r1_TbAjXNWxH6WPyw&type=album",
 "width": 130,
 "type": "m",
 "height": 130
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/Gfx6FaCjN0Q.jpg?size=604x604&quality=95&sign=5dc945bfe9e7f79888d73004eae343eb&c_uniq_tag=V4KYZPU3iIF3RVCqYXXq8g8p0Trd2jQRKnY7AFlKDe8&type=album",
 "width": 604,
 "type": "x",
 "height": 604
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/Gfx6FaCjN0Q.jpg?size=807x807&quality=95&sign=d278b813303eb31bdb730e51ef8f6b6d&c_uniq_tag=aFbbqQ4bPqGp5BMBy917bpLCshpOoZjf5YA89T9UCec&type=album",
 "width": 807,
 "type": "y",
 "height": 807
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/Gfx6FaCjN0Q.jpg?size=1024x1024&quality=95&sign=f8881fbbded9f8840ee4b02c4c6cb879&c_uniq_tag=tHRje1Xf1jctFzjuO4X4aJBAAYxJ1_rK5JKFNIx17N8&type=album",
 "width": 1024,
 "type": "z",
 "height": 1024
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/Gfx6FaCjN0Q.jpg?size=130x130&quality=95&sign=68127c81f17e0792a39275ac56a00349&c_uniq_tag=AYaHXxR8M9NOwGxm3W7OCKV8m8r1_TbAjXNWxH6WPyw&type=album",
 "width": 130,
 "type": "o",
 "height": 130
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/Gfx6FaCjN0Q.jpg?size=200x200&quality=95&sign=cd430561bb7b2746fb6eb6fe75360ec6&c_uniq_tag=vApE_jC2x9G_pE2o_Sa0VbdXZbhyYpJ6stb7bWAnP-4&type=album",
 "width": 200,
 "type": "p",
 "height": 200
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/Gfx6FaCjN0Q.jpg?size=320x320&quality=95&sign=8e1438dda0f54fb11756668e2fee6c1a&c_uniq_tag=Vn2w0zG8YDCc0KftpKmikpLL3YyydcLrGgcqB3wKi2s&type=album",
 "width": 320,
 "type": "q",
 "height": 320
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/Gfx6FaCjN0Q.jpg?size=510x510&quality=95&sign=e91c847e2415d0ee15512c123421c276&c_uniq_tag=ZWDwoheiysNResAKNuM2WxUUsip8_r6MfNbvtGkh73Y&type=album",
 "width": 510,
 "type": "r",
 "height": 510
 }
 ],
 "access_key": "c9794503a593bd9cec",
 "user_id": 100,
 "owner_id": -218861756,
 "id": 457239678,
 "date": 1708079308,
 "album_id": -53
 },
 {
 "has_tags": false,
 "web_view_token": "624c0066d8978afcac",
 "text": "",
 "sizes": [
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/WiZKcZ4m7Lg.jpg?size=75x75&quality=95&sign=2d38b31b4c3e10582b0679289e30e9b7&c_uniq_tag=NHINy4_e18wRuW7wSk8qdZAyddbb6UvEYe3tCKVzy1c&type=album",
 "width": 75,
 "type": "s",
 "height": 75
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/WiZKcZ4m7Lg.jpg?size=130x130&quality=95&sign=dcab9e1f769ca79c1e68297cd4044c0a&c_uniq_tag=fBtDGHdUJpSPkEySW8vLlWPPExva3dsBFyQPrLk0ydI&type=album",
 "width": 130,
 "type": "m",
 "height": 130
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/WiZKcZ4m7Lg.jpg?size=604x604&quality=95&sign=ff313c468d0b77929619430847063235&c_uniq_tag=babY_J2d40AbSOscXypcBkEgicxrrDxlYD74ZDTjIJA&type=album",
 "width": 604,
 "type": "x",
 "height": 604
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/WiZKcZ4m7Lg.jpg?size=807x807&quality=95&sign=5ed25ec65ddf75807a40592fa3a57b85&c_uniq_tag=QXMQTItlMkDqUZvYOS36ygz-eqDElNch6kznQpHNtUs&type=album",
 "width": 807,
 "type": "y",
 "height": 807
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/WiZKcZ4m7Lg.jpg?size=1024x1024&quality=95&sign=43a67fdc1397e5eb5c5c87c9dcc64a16&c_uniq_tag=b7XxwzUXLkL9jIg7PjcUdEGQJUMcnn_D6ZwTWaBwXkQ&type=album",
 "width": 1024,
 "type": "z",
 "height": 1024
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/WiZKcZ4m7Lg.jpg?size=130x130&quality=95&sign=dcab9e1f769ca79c1e68297cd4044c0a&c_uniq_tag=fBtDGHdUJpSPkEySW8vLlWPPExva3dsBFyQPrLk0ydI&type=album",
 "width": 130,
 "type": "o",
 "height": 130
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/WiZKcZ4m7Lg.jpg?size=200x200&quality=95&sign=87d8cd030f6312d3e914895882a0fd1f&c_uniq_tag=5s7vPvuFFNHVaieG0xd_Izcw3WnuOR2mRRlDZtw8zJU&type=album",
 "width": 200,
 "type": "p",
 "height": 200
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/WiZKcZ4m7Lg.jpg?size=320x320&quality=95&sign=37a2a53a35d6a2c1451e5ccd524b878c&c_uniq_tag=BX5IGPc0xpKDoYtTPlHGSbIoucM1H2-cpOg_7VQGgAs&type=album",
 "width": 320,
 "type": "q",
 "height": 320
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/WiZKcZ4m7Lg.jpg?size=510x510&quality=95&sign=925dbfb3a9b9b85d328880f9342cc7d8&c_uniq_tag=JGGgvPjVHXrx7PgK3FVuk9X1KNeg5skBMMNeSN9fg4s&type=album",
 "width": 510,
 "type": "r",
 "height": 510
 }
 ],
 "access_key": "266753958e3c5635cb",
 "user_id": 100,
 "owner_id": -218861756,
 "id": 457239679,
 "date": 1708079309,
 "album_id": -53
 },
 {
 "has_tags": false,
 "web_view_token": "4d22638dbca11b42dc",
 "text": "",
 "sizes": [
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/FuhHZ4B20Po.jpg?size=75x75&quality=95&sign=b5c353c838e289bf4dfe012e93c8d96f&c_uniq_tag=M99VG2d-cv9h8UPexKNwfDIpFp59CFVbZ5B8ksQLr4I&type=album",
 "width": 75,
 "type": "s",
 "height": 75
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/FuhHZ4B20Po.jpg?size=130x130&quality=95&sign=4b24ca5c809108db6b21bc3c22d91433&c_uniq_tag=tsVEaIow1-Z7fdq4AQh2LhwdNEX2tGaGrmbY-nU2ztc&type=album",
 "width": 130,
 "type": "m",
 "height": 130
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/FuhHZ4B20Po.jpg?size=604x604&quality=95&sign=0a958b351a1d2301159c30e4e57f3fd3&c_uniq_tag=02RQFt-o1HuSw8GYCWY_a7STB4ua28_zFb7a4CD5BO8&type=album",
 "width": 604,
 "type": "x",
 "height": 604
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/FuhHZ4B20Po.jpg?size=807x807&quality=95&sign=18fd0f4c4d1097074cc761211e5904c7&c_uniq_tag=HS0b1Fur_f2LFs3_NHY8kCaJyQrv11_I6wjaeMYcmA8&type=album",
 "width": 807,
 "type": "y",
 "height": 807
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/FuhHZ4B20Po.jpg?size=1024x1024&quality=95&sign=6f59f9c6c1bb8ee0458c9d970a95eb37&c_uniq_tag=9N6uQC5vMHptVulrxwY6a_uJIx3ND4Q65klbzMDGguE&type=album",
 "width": 1024,
 "type": "z",
 "height": 1024
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/FuhHZ4B20Po.jpg?size=130x130&quality=95&sign=4b24ca5c809108db6b21bc3c22d91433&c_uniq_tag=tsVEaIow1-Z7fdq4AQh2LhwdNEX2tGaGrmbY-nU2ztc&type=album",
 "width": 130,
 "type": "o",
 "height": 130
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/FuhHZ4B20Po.jpg?size=200x200&quality=95&sign=80a6e97e3262ccc6ff80e30d609b39c8&c_uniq_tag=5fZY8t9mBrikvu-J0q4JkrOg0wHERphSEGIfscG2_t0&type=album",
 "width": 200,
 "type": "p",
 "height": 200
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/FuhHZ4B20Po.jpg?size=320x320&quality=95&sign=4bff4c938faaab606aeb85451951a175&c_uniq_tag=-mFXyFqoRGG2T0uDx1ZKZiMrU7vCzIUuzN56k1Xrd7o&type=album",
 "width": 320,
 "type": "q",
 "height": 320
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/FuhHZ4B20Po.jpg?size=510x510&quality=95&sign=bcefcff03c4cd3f6ca30f41f6e6f19df&c_uniq_tag=1BHfm_IEucSBPtWGWR-xDhdJ8w5L_tw0Tf3iTj8UixU&type=album",
 "width": 510,
 "type": "r",
 "height": 510
 }
 ],
 "access_key": "78ed3a6ff11c40a07c",
 "user_id": 100,
 "owner_id": -218861756,
 "id": 457239680,
 "date": 1708079310,
 "album_id": -53
 }
 ],
 "cart_quantity": 0,
 "albums_ids": [
 9
 ],
 "weight": 100,
 "dimensions": {
 "length": 40,
 "height": 30,
 "width": 20
 },
 "title": "EditedTestProduct",
 "other_items": [
 {
 "item_ids": [
 "-218861756_8655960",
 "-218861756_8655800",
 "-218861756_8655797",
 "-218861756_8653766",
 "-218861756_8653760",
 "-218861756_8653404",
 "-218861756_8653395",
 "-218861756_8653393",
 "-218861756_8653391",
 "-218861756_8653387"
 ],
 "referrer_item_type": "other_goods",
 "view_type": 1,
 "title": "Other items"
 }
 ],
 "reposts": {
 "count": 0
 },
 "price": {
 "old_amount_text": "15 ₽",
 "old_amount": "1500",
 "discount_rate": -93,
 "text": "1 ₽",
 "currency": {
 "title": "₽",
 "name": "RUB",
 "id": 643
 },
 "amount": "100"
 },
 "can_edit": true,
 "owner_id": -218861756,
 "can_comment": 1,
 "is_adult": false,
 "id": 8653408,
 "description": "Product description",
 "owner_info": {
 "market_type": "pro",
 "category": "TestCollection",
 "is_corporated_market": false,
 "name": "Test",
 "category_url": "/market-218861756?section=album_9",
 "avatar": []
 },
 "category": {
 "section": {
 "name": "Stationery",
 "id": 10016
 },
 "name": "Batteries",
 "id": 20173,
 "inner_type": "market_market_category_old"
 },
 "promotion": {
 "is_available": false
 },
 "availability": 0
 }
 ]
```
