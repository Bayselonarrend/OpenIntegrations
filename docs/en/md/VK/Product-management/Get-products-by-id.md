---
sidebar_position: 3
---

# Get products by ID
 Gets information about products by array of IDs



`Function GetProductsByID(Val Products, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Products | --items | String, Array of String | Array of product IDs |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();

    Item1 = "9670998";
    Item2 = "9671000";

    ProductsArray = New Array;
    ProductsArray.Add(Item1);
    ProductsArray.Add(Item2);

    Result = OPI_VK.GetProductsByID(ProductsArray, Parameters);
```



```sh title="CLI command example"
    
  oint vk GetProductsByID --items %items% --auth "GetVKParameters()"

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
...
```
