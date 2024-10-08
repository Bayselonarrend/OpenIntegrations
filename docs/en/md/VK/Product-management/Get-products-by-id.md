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
  "count": 2,
  "items": [
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
    "description": "Product description",
    "id": 9681308,
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
    "title": "Test product (with prop)",
    "other_items": [
     {
      "title": "Другие товары сообщества",
      "view_type": 1,
      "item_ids": [
       "-218861756_9681309",
       "-218861756_9642576",
       "-218861756_9640025",
       "-218861756_9578921",
       "-218861756_9499082",
       "-218861756_9423489",
       "-218861756_9387853",
       "-218861756_9320009",
       "-218861756_9320008",
       "-218861756_9259547"
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
    "photos": [
     {
      "album_id": -53,
      "date": 1728328242,
      "id": 457249025,
      "owner_id": -218861756,
      "access_key": "7bd6a6ebac2dd69ede",
      "sizes": [
       {
        "height": 56,
        "type": "s",
        "width": 75,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/MNDFN2P7zrJ2hRmwR7_P6HVMAt-572KkMh3vDn7xZj-fOuHz4nn7CHneg-dySIn476UXW7CoYtkJv4bCCTYsbwr6.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=75x56"
       },
       {
        "height": 97,
        "type": "m",
        "width": 130,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/MNDFN2P7zrJ2hRmwR7_P6HVMAt-572KkMh3vDn7xZj-fOuHz4nn7CHneg-dySIn476UXW7CoYtkJv4bCCTYsbwr6.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=130x97"
       },
       {
        "height": 453,
        "type": "x",
        "width": 604,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/MNDFN2P7zrJ2hRmwR7_P6HVMAt-572KkMh3vDn7xZj-fOuHz4nn7CHneg-dySIn476UXW7CoYtkJv4bCCTYsbwr6.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=604x453"
       },
       {
        "height": 605,
        "type": "y",
        "width": 807,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/MNDFN2P7zrJ2hRmwR7_P6HVMAt-572KkMh3vDn7xZj-fOuHz4nn7CHneg-dySIn476UXW7CoYtkJv4bCCTYsbwr6.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=807x605"
       },
       {
        "height": 960,
        "type": "z",
        "width": 1280,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/MNDFN2P7zrJ2hRmwR7_P6HVMAt-572KkMh3vDn7xZj-fOuHz4nn7CHneg-dySIn476UXW7CoYtkJv4bCCTYsbwr6.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=1280x960"
       },
       {
        "height": 1920,
        "type": "w",
        "width": 2560,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/MNDFN2P7zrJ2hRmwR7_P6HVMAt-572KkMh3vDn7xZj-fOuHz4nn7CHneg-dySIn476UXW7CoYtkJv4bCCTYsbwr6.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=2560x1920"
       },
       {
        "height": 97,
        "type": "o",
        "width": 130,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/MNDFN2P7zrJ2hRmwR7_P6HVMAt-572KkMh3vDn7xZj-fOuHz4nn7CHneg-dySIn476UXW7CoYtkJv4bCCTYsbwr6.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=130x97"
       },
       {
        "height": 150,
        "type": "p",
        "width": 200,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/MNDFN2P7zrJ2hRmwR7_P6HVMAt-572KkMh3vDn7xZj-fOuHz4nn7CHneg-dySIn476UXW7CoYtkJv4bCCTYsbwr6.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=200x150"
       },
       {
        "height": 240,
        "type": "q",
        "width": 320,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/MNDFN2P7zrJ2hRmwR7_P6HVMAt-572KkMh3vDn7xZj-fOuHz4nn7CHneg-dySIn476UXW7CoYtkJv4bCCTYsbwr6.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=320x240"
       },
       {
        "height": 382,
        "type": "r",
        "width": 510,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/MNDFN2P7zrJ2hRmwR7_P6HVMAt-572KkMh3vDn7xZj-fOuHz4nn7CHneg-dySIn476UXW7CoYtkJv4bCCTYsbwr6.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=510x382"
       }
      ],
      "text": "",
      "user_id": 100,
      "web_view_token": "0845110b65a0fdac53",
      "has_tags": false,
      "orig_photo": {
       "height": 1920,
       "type": "base",
       "url": "https://sun9-13.userapi.com/s/v1/ig2/MNDFN2P7zrJ2hRmwR7_P6HVMAt-572KkMh3vDn7xZj-fOuHz4nn7CHneg-dySIn476UXW7CoYtkJv4bCCTYsbwr6.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu",
       "width": 2560
      }
     },
     {
      "album_id": -53,
      "date": 1728328245,
      "id": 457249026,
      "owner_id": -218861756,
      "access_key": "96116ec13e03efd090",
      "sizes": [
       {
        "height": 56,
        "type": "s",
        "width": 75,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/EIfWtVxM9AyjK1lv-QpMozlU3QVIdE28ZRyvMuRzxAkSRLA5VgZ2yVrw9Sbw5IIvuo_HbHO-uypOsrOjBXtYGYJq.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=75x56"
       },
...
```
