---
sidebar_position: 3
---

# Get products by ID
 Gets information about products by array of IDs


*Function GetProductsByID(Val Products, Val Parameters = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Products | --items | String, Array of String | Array of product IDs |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Key-Value Pair - Serialized JSON response from VK

```bsl title="Code example"
	
 
 ProductsArray = New Array;
 ProductsArray.Add("8656033");
 ProductsArray.Add("8656034");
 
 Response = OPI_VK.GetProductsByID(ProductsArray, Parameters);
 Response = OPI_Tools.JSONString(Response);
 
 
	
```

```sh title="CLI command example"
 
 oint vk GetProductsByID --items %items% --auth %auth%


```


```json title="Result"

{
 "response": {
 "items": [
 {
 "sku": "12 345",
 "is_main_variant": true,
 "is_owner": true,
 "date": 1708170274,
 "can_show_convert_to_service": true,
 "can_delete": true,
 "properties": [
 {
 "variants": [
 {
 "title": "Yellow (change.)",
 "id": 971
 },
 {
 "title": "Blue (change.)",
 "id": 972
 },
 {
 "title": "Red (change.)",
 "id": 973
 }
 ],
 "type": "text",
 "title": "Color (change.)",
 "id": 258
 }
 ],
 "views_count": 0,
 "thumb_photo": "https://sun56-2.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/_s-jhmAAmOs.jpg?crop=0,0,1,1&size=0x400&quality=95&sign=589be01d2fc8e371862518142ccb7462&c_uniq_tag=3UKP-MAlxuqYtgy6jOhFLiWDMayz_V8bqjCYnh35JhM",
 "likes": {
 "user_likes": 0,
 "count": 0
 },
 "can_repost": 1,
 "can_recover": false,
 "photos": [
 {
 "has_tags": false,
 "web_view_token": "92862d343958147ed4",
 "text": "",
 "sizes": [
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/_s-jhmAAmOs.jpg?size=75x75&quality=95&sign=75b8b9ecc41139c3c1b0d17bbf6e0c32&c_uniq_tag=FXd5BlAEmMnIGfUpqwLUWhaJwb8irsAIJ4-lUHfbZ_E&type=album",
 "width": 75,
 "type": "s",
 "height": 75
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/_s-jhmAAmOs.jpg?size=130x130&quality=95&sign=70543f236ac062f0010f885208bc55b6&c_uniq_tag=RIT_VUoSuci5B2h1VizCJyAlynAAD8GjsNsXcM225qc&type=album",
 "width": 130,
 "type": "m",
 "height": 130
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/_s-jhmAAmOs.jpg?size=604x604&quality=95&sign=8d173aac7ac1259e516a6d926ce80544&c_uniq_tag=ap7TLKtgI6zBnvGjJaFp_zROOKQiBg6NENjMCk1ZdBc&type=album",
 "width": 604,
 "type": "x",
 "height": 604
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/_s-jhmAAmOs.jpg?size=807x807&quality=95&sign=d7536ec7a9f84e511f21182dea67a70a&c_uniq_tag=VIIaPDSt68vRlOqCymz9grEM5RQG1Ocx0wyevX4xb6Q&type=album",
 "width": 807,
 "type": "y",
 "height": 807
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/_s-jhmAAmOs.jpg?size=1024x1024&quality=95&sign=106d75b1819f1976d40d66200db9ef8c&c_uniq_tag=Bo7Hk6h0bNaaYET9k36N25VbSyysB6r2RT_66bUW_hs&type=album",
 "width": 1024,
 "type": "z",
 "height": 1024
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/_s-jhmAAmOs.jpg?size=130x130&quality=95&sign=70543f236ac062f0010f885208bc55b6&c_uniq_tag=RIT_VUoSuci5B2h1VizCJyAlynAAD8GjsNsXcM225qc&type=album",
 "width": 130,
 "type": "o",
 "height": 130
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/_s-jhmAAmOs.jpg?size=200x200&quality=95&sign=8b70ea4984f97979ce995dd37bcf3133&c_uniq_tag=Y4CfVHj6Hih0lhp8txhKpNhaVSgQnjr7WlH_B01N1EU&type=album",
 "width": 200,
 "type": "p",
 "height": 200
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/_s-jhmAAmOs.jpg?size=320x320&quality=95&sign=0a5c91e112ef0c02425bdbf27f2a65a1&c_uniq_tag=V9Q3PNtkF8XD02aYEbvcbny0jrGZ5LUTaanYB5ulArI&type=album",
 "width": 320,
 "type": "q",
 "height": 320
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/_s-jhmAAmOs.jpg?size=510x510&quality=95&sign=45b47460e1a4dce2692355265114f996&c_uniq_tag=IuTEvNe-qW6JGpt4guLe2R3vH4l4899EaWrr77ZtQlk&type=album",
 "width": 510,
 "type": "r",
 "height": 510
 }
 ],
 "access_key": "66dc21beb4d43f2a3c",
 "user_id": 100,
 "owner_id": -218861756,
 "id": 457239799,
 "date": 1708170270,
 "album_id": -53
 },
 {
 "has_tags": false,
 "web_view_token": "a6344b5c5e566b3d0f",
 "text": "",
 "sizes": [
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/jVXnxHBkfM4.jpg?size=75x75&quality=95&sign=008ec0a154820e532df70a27551bed4f&c_uniq_tag=V6vBDJlnnQSlWj7dtWCH_i1oXJgW_m1q47Dtgiip_Es&type=album",
 "width": 75,
 "type": "s",
 "height": 75
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/jVXnxHBkfM4.jpg?size=130x130&quality=95&sign=5249e2e00c2a3cd91c46f9c0d6c87108&c_uniq_tag=o3riwc5uwsy0Od6lw80XJzs1d7UP0WXQA0zjNuKJtjo&type=album",
 "width": 130,
 "type": "m",
 "height": 130
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/jVXnxHBkfM4.jpg?size=604x604&quality=95&sign=458343fa9344319daced2b0996e5ee74&c_uniq_tag=ausjWwNUoPL003iQ4jKsFx_46Hf-lpCcaAOrGXV82cQ&type=album",
 "width": 604,
 "type": "x",
 "height": 604
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/jVXnxHBkfM4.jpg?size=807x807&quality=95&sign=487b910daf99d58f09bb84e7f4955e12&c_uniq_tag=pGkpJrVh8zKvIdRG74G9NuXamkrHe25ybGMfmcVGKfk&type=album",
 "width": 807,
 "type": "y",
 "height": 807
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/jVXnxHBkfM4.jpg?size=1024x1024&quality=95&sign=db36ba2bdc5176946b44c9d7bddc173b&c_uniq_tag=LupvbVz1DM9ZHGGCd2GWH8rVcanmneNhRvzt_keB_r0&type=album",
 "width": 1024,
 "type": "z",
 "height": 1024
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/jVXnxHBkfM4.jpg?size=130x130&quality=95&sign=5249e2e00c2a3cd91c46f9c0d6c87108&c_uniq_tag=o3riwc5uwsy0Od6lw80XJzs1d7UP0WXQA0zjNuKJtjo&type=album",
 "width": 130,
 "type": "o",
 "height": 130
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/jVXnxHBkfM4.jpg?size=200x200&quality=95&sign=92b5fbc6456d64a450f2798d0f4b2907&c_uniq_tag=wilVvQyyONq1VsFP42UIlM6DnUetObxgjPwEOU87bcI&type=album",
 "width": 200,
 "type": "p",
 "height": 200
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/jVXnxHBkfM4.jpg?size=320x320&quality=95&sign=6fb75856a87c217c4e033c17ef340c70&c_uniq_tag=gGcnPnWWjfd5zD7qQMhZdDV_BjGWb3vk_p4Q0mXIFlo&type=album",
 "width": 320,
 "type": "q",
 "height": 320
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/jVXnxHBkfM4.jpg?size=510x510&quality=95&sign=9f4deabcdf7a1e52128a1cc08b3f51ba&c_uniq_tag=cX_tQwscXoWRbH4WF-rq7EFmr8Sddv_P4JQ7rEzF9Ws&type=album",
 "width": 510,
 "type": "r",
 "height": 510
 }
 ],
 "access_key": "306f176545bea47727",
 "user_id": 100,
 "owner_id": -218861756,
 "id": 457239800,
 "date": 1708170272,
 "album_id": -53
 },
 {
 "has_tags": false,
 "web_view_token": "0f912989fe5cda4777",
 "text": "",
 "sizes": [
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/F5zJCyhU2K8.jpg?size=75x75&quality=95&sign=68afdefe830d4be39b04ba23a61c26ce&c_uniq_tag=Xc5-AjRx8tqr0Zo5pMZ4jIGFgD1YoRU1La4aDMIQEC4&type=album",
 "width": 75,
 "type": "s",
 "height": 75
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/F5zJCyhU2K8.jpg?size=130x130&quality=95&sign=82e01ddf5fa7dc6a8cdbadf254759259&c_uniq_tag=ZzK-w6E9jC_DsexMRVdZDE5egemG8PDAjKoZygNLKr0&type=album",
 "width": 130,
 "type": "m",
 "height": 130
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/F5zJCyhU2K8.jpg?size=604x604&quality=95&sign=79f669caf7b26acfdeed6715c85fe9ed&c_uniq_tag=17W-VKiO2S8SrmCSItPAoWq5PKqcQhHggCVD3jAf6B0&type=album",
 "width": 604,
 "type": "x",
 "height": 604
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/F5zJCyhU2K8.jpg?size=807x807&quality=95&sign=3bc1e4917a25c52fb37a821f7c83bf85&c_uniq_tag=P1wmEHLW5WNZhBYfsoKFdKFFWGoVj89Y7v6JmqpcumE&type=album",
 "width": 807,
 "type": "y",
 "height": 807
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/F5zJCyhU2K8.jpg?size=1024x1024&quality=95&sign=f7f1d87da40cc7070770d2a2f45f557b&c_uniq_tag=XZ-FwW1W54vlkhc3jVRdBI2xEQ53BSLTyKVPl3RGAXU&type=album",
 "width": 1024,
 "type": "z",
 "height": 1024
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/F5zJCyhU2K8.jpg?size=130x130&quality=95&sign=82e01ddf5fa7dc6a8cdbadf254759259&c_uniq_tag=ZzK-w6E9jC_DsexMRVdZDE5egemG8PDAjKoZygNLKr0&type=album",
 "width": 130,
 "type": "o",
 "height": 130
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/F5zJCyhU2K8.jpg?size=200x200&quality=95&sign=3e7d2483ff4d3a889cc38eea4727d471&c_uniq_tag=xQQVVr-_nJ8Vxha5_EpmDfTxow2rZM516lXgezq74p8&type=album",
 "width": 200,
 "type": "p",
 "height": 200
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/F5zJCyhU2K8.jpg?size=320x320&quality=95&sign=f118def9cbea6e5e4eeb8e33a9d0c0b3&c_uniq_tag=1TTdudzMdBLTi3Jo7BZGXK16S_fIMBxE2zvlYDVrPmc&type=album",
 "width": 320,
 "type": "q",
 "height": 320
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/F5zJCyhU2K8.jpg?size=510x510&quality=95&sign=f78d1f8e32dd8d7826749d236165afaf&c_uniq_tag=JwqjdnieaCRm_wk4q3GmzwSiuYuS6Xz0QTjN_ncx7rM&type=album",
 "width": 510,
 "type": "r",
 "height": 510
 }
 ],
 "access_key": "fbd338a4c3be88ff3c",
 "user_id": 100,
 "owner_id": -218861756,
 "id": 457239801,
 "date": 1708170273,
 "album_id": -53
 }
 ],
 "cart_quantity": 0,
 "albums_ids": [],
 "weight": 100,
 "dimensions": {
 "length": 40,
 "height": 30,
 "width": 20
 },
 "title": "TestProduct (Yellow)",
 "other_items": [
 {
 "item_ids": [
 "-218861756_8656034",
 "-218861756_8655800",
 "-218861756_8655797",
 "-218861756_8653766",
 "-218861756_8653760",
 "-218861756_8653408",
 "-218861756_8653404",
 "-218861756_8653395",
 "-218861756_8653393",
 "-218861756_8653391"
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
 "can_comment": 1,
 "owner_id": -218861756,
 "is_adult": false,
 "id": 8656033,
 "variants_grid": [
 {
 "variants": [
 {
 "is_selected": true,
 "item_id": 8656033,
 "name": "Yellow (change.)",
 "variant_id": 971
 }
 ],
 "type": "text",
 "name": "Color (change.)"
 }
 ],
 "description": "Product description",
 "owner_info": {
 "market_type": "pro",
 "category": "Batteries",
 "is_corporated_market": false,
 "name": "Test",
 "category_url": "/market-218861756",
 "avatar": []
 },
 "property_values": [
 {
 "property_name": "Color (change.)",
 "variant_name": "Yellow (change.)",
 "variant_id": 971
 }
 ],
 "category": {
 "section": {
 "name": "Stationery",
 "id": 10016
 },
 "name": "Batteries",
 "id": 20173,
 "inner_type": "market_market_category_old"
 },
 "availability": 0,
 "promotion": {
 "is_available": true
 }
 },
 {
 "sku": "12 345",
 "is_main_variant": true,
 "is_owner": true,
 "date": 1708170288,
 "can_show_convert_to_service": true,
 "can_delete": true,
 "properties": [
 {
 "variants": [
 {
 "title": "Yellow (change.)",
 "id": 971
 },
 {
 "title": "Blue (change.)",
 "id": 972
 },
 {
 "title": "Red (change.)",
 "id": 973
 }
 ],
 "type": "text",
 "title": "Color (change.)",
 "id": 258
 }
 ],
 "views_count": 0,
 "thumb_photo": "https://sun56-2.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/e3aoPo9yc_M.jpg?crop=0,0,1,1&size=0x400&quality=95&sign=6fe8502b6de244ccb70eebb1ff4ab23a&c_uniq_tag=Juovt6U5F84vc8uZw_2u5ejCgNGxNqYse3fKfIORYsA",
 "likes": {
 "user_likes": 0,
 "count": 0
 },
 "can_repost": 1,
 "can_recover": false,
 "photos": [
 {
 "has_tags": false,
 "web_view_token": "93d071511c9e966e9a",
 "text": "",
 "sizes": [
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/e3aoPo9yc_M.jpg?size=75x75&quality=95&sign=dfe0b24adf5f3705cf02a1702f45036b&c_uniq_tag=EQgp0KDeFcPWq8dm6l05egD_z2uHaN-DT8Cr5dQQkBo&type=album",
 "width": 75,
 "type": "s",
 "height": 75
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/e3aoPo9yc_M.jpg?size=130x130&quality=95&sign=29176aff6558e2a971556b274d6e62e8&c_uniq_tag=1GLs-TDaHQLExpYAtCfuXfgVLEM4Y9lAFZAQfSar204&type=album",
 "width": 130,
 "type": "m",
 "height": 130
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/e3aoPo9yc_M.jpg?size=604x604&quality=95&sign=779f24d1abc0fe24a4a424b7a57bb093&c_uniq_tag=QNmQQTT76Mhu8Oinz-5qrMzwVVwKmJFABeTE9bd-M04&type=album",
 "width": 604,
 "type": "x",
 "height": 604
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/e3aoPo9yc_M.jpg?size=807x807&quality=95&sign=68cf71539a9242931d48a0cd0be1a0ce&c_uniq_tag=MQO9LYERwp1e6tS9OJYz-YeyEAoWa4yTD6CX3C_FUzA&type=album",
 "width": 807,
 "type": "y",
 "height": 807
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/e3aoPo9yc_M.jpg?size=1024x1024&quality=95&sign=b609734c59b0229115c911fc20f3df2d&c_uniq_tag=bdm1GIOMPi0B6oy29CZnJYw23shE3eghtMSsCI8JYGg&type=album",
 "width": 1024,
 "type": "z",
 "height": 1024
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/e3aoPo9yc_M.jpg?size=130x130&quality=95&sign=29176aff6558e2a971556b274d6e62e8&c_uniq_tag=1GLs-TDaHQLExpYAtCfuXfgVLEM4Y9lAFZAQfSar204&type=album",
 "width": 130,
 "type": "o",
 "height": 130
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/e3aoPo9yc_M.jpg?size=200x200&quality=95&sign=c64e879b106ab293043bb60563312cb6&c_uniq_tag=3vfMLZacvzwhJSWS51xEo0DHeRFy6KS_TLPN0xEQWBY&type=album",
 "width": 200,
 "type": "p",
 "height": 200
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/e3aoPo9yc_M.jpg?size=320x320&quality=95&sign=59810b1b5192658255ab539a40149880&c_uniq_tag=-MpQ7yEq8wm5U6P-GJWHqfOSq6xA8l3czg2ggwlSNnQ&type=album",
 "width": 320,
 "type": "q",
 "height": 320
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/e3aoPo9yc_M.jpg?size=510x510&quality=95&sign=36ab4a9f54e0a96f4ea92302e855894d&c_uniq_tag=tHaCIm_9DjSqiDUDZUBe_tjn7zOH5oZfwwpWXYRx_70&type=album",
 "width": 510,
 "type": "r",
 "height": 510
 }
 ],
 "access_key": "10037480cb2af9af0d",
 "user_id": 100,
 "owner_id": -218861756,
 "id": 457239802,
 "date": 1708170285,
 "album_id": -53
 },
 {
 "has_tags": false,
 "web_view_token": "d1181c5d59752488a2",
 "text": "",
 "sizes": [
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/mv73TKmJ_FU.jpg?size=75x75&quality=95&sign=d5cfeb6f122274ca04226d23818c2436&c_uniq_tag=g_yta3-5oqlvRCBKknktnRsJ7lnlP2VnnxLk9cfxkHg&type=album",
 "width": 75,
 "type": "s",
 "height": 75
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/mv73TKmJ_FU.jpg?size=130x130&quality=95&sign=ddd0426be9fa770ee416d091e1d5db3d&c_uniq_tag=DyZ9sA4W6WwLKeSGRj3G1Bitoz5G2-Y6AVt7sh8XN2o&type=album",
 "width": 130,
 "type": "m",
 "height": 130
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/mv73TKmJ_FU.jpg?size=604x604&quality=95&sign=3aafaad6b865a4326ebb066c7dd96ffc&c_uniq_tag=ZD3QYn27B-77k_Ky6EvfTkQpWRvvdquZgKq4aWhPc0M&type=album",
 "width": 604,
 "type": "x",
 "height": 604
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/mv73TKmJ_FU.jpg?size=807x807&quality=95&sign=9d3a2122bca8a751fdddc22af862740f&c_uniq_tag=OQVkuFFazrrA-5LmkWDdTdsrC6YzHpvFlMjXZNcKa8A&type=album",
 "width": 807,
 "type": "y",
 "height": 807
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/mv73TKmJ_FU.jpg?size=1024x1024&quality=95&sign=f00777c18a9e2a8690abec2518459c85&c_uniq_tag=oa7b3R9OPg0LGnMZwVd5tkmRQtFZ97uuCkmOdIPgxNQ&type=album",
 "width": 1024,
 "type": "z",
 "height": 1024
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/mv73TKmJ_FU.jpg?size=130x130&quality=95&sign=ddd0426be9fa770ee416d091e1d5db3d&c_uniq_tag=DyZ9sA4W6WwLKeSGRj3G1Bitoz5G2-Y6AVt7sh8XN2o&type=album",
 "width": 130,
 "type": "o",
 "height": 130
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/mv73TKmJ_FU.jpg?size=200x200&quality=95&sign=19663322aa62b505f4204c27d75304cd&c_uniq_tag=ZIEbwDmIZR-vEFRWjmw-Qp_PSX7EacMIEG9PF7GpBEs&type=album",
 "width": 200,
 "type": "p",
 "height": 200
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/mv73TKmJ_FU.jpg?size=320x320&quality=95&sign=454278ef305df41f60bbd66588e235da&c_uniq_tag=ZJhu-b2l8_3WCJlFirFZQxoVgtsaLK65yW0mvx8J08A&type=album",
 "width": 320,
 "type": "q",
 "height": 320
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/mv73TKmJ_FU.jpg?size=510x510&quality=95&sign=8de646064ff8be8c896b90dc2f773722&c_uniq_tag=VpnbvqL0oDTt2ZKV-irlb2RpQv229T-EHaeIyVS5Vpc&type=album",
 "width": 510,
 "type": "r",
 "height": 510
 }
 ],
 "access_key": "f3a1fb96168aea29f8",
 "user_id": 100,
 "owner_id": -218861756,
 "id": 457239803,
 "date": 1708170287,
 "album_id": -53
 },
 {
 "has_tags": false,
 "web_view_token": "81fb7553b335d5b014",
 "text": "",
 "sizes": [
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/6Dbk6jKbWh4.jpg?size=75x75&quality=95&sign=6ecdc8b90775ddf376b0b8188dbffe92&c_uniq_tag=swVsbxdS4C74XKjml3-ZfJyK2APAKb5zukLSREgvgPA&type=album",
 "width": 75,
 "type": "s",
 "height": 75
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/6Dbk6jKbWh4.jpg?size=130x130&quality=95&sign=4abcfb7fae4b783eadb29abd35d02025&c_uniq_tag=5C_zLY9QatErqJsBEuM-v8jfSUp1DeDwx15ag_gZAcE&type=album",
 "width": 130,
 "type": "m",
 "height": 130
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/6Dbk6jKbWh4.jpg?size=604x604&quality=95&sign=e15ba3df9b63bd7c793cd9fb12a08539&c_uniq_tag=i7wKGLU0jk2qPnzhl4ah1EuupPe7-XeFPRs8krcbzr4&type=album",
 "width": 604,
 "type": "x",
 "height": 604
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/6Dbk6jKbWh4.jpg?size=807x807&quality=95&sign=6ce24dc60c88b14dd50f72b157ecb68d&c_uniq_tag=4GU58hsK_GvHsoc9_SzqN2EdgRu8arCCOqIqJ8TxErI&type=album",
 "width": 807,
 "type": "y",
 "height": 807
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/6Dbk6jKbWh4.jpg?size=1024x1024&quality=95&sign=93706c2f263ea67b93a17dcb0c1a03d9&c_uniq_tag=w8oS3d2yXrNChsDA1g5jcyJmihuegLAmiNUkIwTEcfI&type=album",
 "width": 1024,
 "type": "z",
 "height": 1024
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/6Dbk6jKbWh4.jpg?size=130x130&quality=95&sign=4abcfb7fae4b783eadb29abd35d02025&c_uniq_tag=5C_zLY9QatErqJsBEuM-v8jfSUp1DeDwx15ag_gZAcE&type=album",
 "width": 130,
 "type": "o",
 "height": 130
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/6Dbk6jKbWh4.jpg?size=200x200&quality=95&sign=bd9d8e4629660da0502be09ecbf30c0c&c_uniq_tag=SH9RVt_MXCjYWtCw68wDIz7ILMHO3QMF4t8GWvtA7qY&type=album",
 "width": 200,
 "type": "p",
 "height": 200
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/6Dbk6jKbWh4.jpg?size=320x320&quality=95&sign=513e44d6745d2dcf3134e0518584841d&c_uniq_tag=60HVud6C_z47D5l2delWwgf0ghIvEaFfvA5s1_MoPWE&type=album",
 "width": 320,
 "type": "q",
 "height": 320
 },
 {
 "url": "https://sun9-32.userapi.com/impg/XRrzu8dbsPmwF35EnWBibiQ-Sgo7O5rgWY4fUg/6Dbk6jKbWh4.jpg?size=510x510&quality=95&sign=13e3f25a80b3c8e332bd8f9d0abde28c&c_uniq_tag=TTjqylVQf7Wgu03X6HCu1TqVTy07G11FecGeXsiZUbk&type=album",
 "width": 510,
 "type": "r",
 "height": 510
 }
 ],
 "access_key": "4aa836406d898be665",
 "user_id": 100,
 "owner_id": -218861756,
 "id": 457239804,
 "date": 1708170288,
 "album_id": -53
 }
 ],
 "cart_quantity": 0,
 "albums_ids": [],
 "weight": 100,
 "dimensions": {
 "length": 40,
 "height": 30,
 "width": 20
 },
 "title": "TestProduct (Red)",
 "other_items": [
 {
 "item_ids": [
 "-218861756_8656033",
 "-218861756_8655800",
 "-218861756_8655797",
 "-218861756_8653766",
 "-218861756_8653760",
 "-218861756_8653408",
 "-218861756_8653404",
 "-218861756_8653395",
 "-218861756_8653393",
 "-218861756_8653391"
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
 "can_comment": 1,
 "owner_id": -218861756,
 "is_adult": false,
 "id": 8656034,
 "variants_grid": [
 {
 "variants": [
 {
 "is_selected": true,
 "item_id": 8656034,
 "name": "Red (change.)",
 "variant_id": 973
 }
 ],
 "type": "text",
 "name": "Color (change.)"
 }
 ],
 "description": "Product description",
 "owner_info": {
 "market_type": "pro",
 "category": "Batteries",
 "is_corporated_market": false,
 "name": "Test",
 "category_url": "/market-218861756",
 "avatar": []
 },
 "property_values": [
 {
 "property_name": "Color (change.)",
 "variant_name": "Red (change.)",
 "variant_id": 973
 }
 ],
 "category": {
 "section": {
 "name": "Stationery",
 "id": 10016
 },
 "name": "Batteries",
 "id": 20173,
 "inner_type": "market_market_category_old"
 },
 "availability": 0,
 "promotion": {
 "is_available": true
 }
 }
 ],
 "count": 2
 }
 }

```
