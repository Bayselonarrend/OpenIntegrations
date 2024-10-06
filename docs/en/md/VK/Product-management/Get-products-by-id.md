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
    "id": 9671147,
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
       "-218861756_9671148",
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
      "date": 1728139861,
      "id": 457248933,
      "owner_id": -218861756,
      "access_key": "33fd7ed6c4763fe3c6",
      "sizes": [
       {
        "height": 56,
        "type": "s",
        "width": 75,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/jG-r_4q5Pb53kw6ZHLvaiLrQ1l0-Vv-texcxsBduIFkceB83SV44TxSqvX_bkzgI0L9DiX_Pa_K9V9uwirE3VZPm.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=75x56"
       },
       {
        "height": 97,
        "type": "m",
        "width": 130,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/jG-r_4q5Pb53kw6ZHLvaiLrQ1l0-Vv-texcxsBduIFkceB83SV44TxSqvX_bkzgI0L9DiX_Pa_K9V9uwirE3VZPm.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=130x97"
       },
       {
        "height": 453,
        "type": "x",
        "width": 604,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/jG-r_4q5Pb53kw6ZHLvaiLrQ1l0-Vv-texcxsBduIFkceB83SV44TxSqvX_bkzgI0L9DiX_Pa_K9V9uwirE3VZPm.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=604x453"
       },
       {
        "height": 605,
        "type": "y",
        "width": 807,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/jG-r_4q5Pb53kw6ZHLvaiLrQ1l0-Vv-texcxsBduIFkceB83SV44TxSqvX_bkzgI0L9DiX_Pa_K9V9uwirE3VZPm.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=807x605"
       },
       {
        "height": 960,
        "type": "z",
        "width": 1280,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/jG-r_4q5Pb53kw6ZHLvaiLrQ1l0-Vv-texcxsBduIFkceB83SV44TxSqvX_bkzgI0L9DiX_Pa_K9V9uwirE3VZPm.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=1280x960"
       },
       {
        "height": 1920,
        "type": "w",
        "width": 2560,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/jG-r_4q5Pb53kw6ZHLvaiLrQ1l0-Vv-texcxsBduIFkceB83SV44TxSqvX_bkzgI0L9DiX_Pa_K9V9uwirE3VZPm.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=2560x1920"
       },
       {
        "height": 97,
        "type": "o",
        "width": 130,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/jG-r_4q5Pb53kw6ZHLvaiLrQ1l0-Vv-texcxsBduIFkceB83SV44TxSqvX_bkzgI0L9DiX_Pa_K9V9uwirE3VZPm.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=130x97"
       },
       {
        "height": 150,
        "type": "p",
        "width": 200,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/jG-r_4q5Pb53kw6ZHLvaiLrQ1l0-Vv-texcxsBduIFkceB83SV44TxSqvX_bkzgI0L9DiX_Pa_K9V9uwirE3VZPm.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=200x150"
       },
       {
        "height": 240,
        "type": "q",
        "width": 320,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/jG-r_4q5Pb53kw6ZHLvaiLrQ1l0-Vv-texcxsBduIFkceB83SV44TxSqvX_bkzgI0L9DiX_Pa_K9V9uwirE3VZPm.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=320x240"
       },
       {
        "height": 382,
        "type": "r",
        "width": 510,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/jG-r_4q5Pb53kw6ZHLvaiLrQ1l0-Vv-texcxsBduIFkceB83SV44TxSqvX_bkzgI0L9DiX_Pa_K9V9uwirE3VZPm.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=510x382"
       }
      ],
      "text": "",
      "user_id": 100,
      "web_view_token": "3756ee13d6447dc950",
      "has_tags": false,
      "orig_photo": {
       "height": 1920,
       "type": "base",
       "url": "https://sun9-13.userapi.com/s/v1/ig2/jG-r_4q5Pb53kw6ZHLvaiLrQ1l0-Vv-texcxsBduIFkceB83SV44TxSqvX_bkzgI0L9DiX_Pa_K9V9uwirE3VZPm.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu",
       "width": 2560
      }
     },
     {
      "album_id": -53,
      "date": 1728139866,
      "id": 457248934,
      "owner_id": -218861756,
      "access_key": "9b4a7d0bbd528a58db",
      "sizes": [
       {
        "height": 56,
        "type": "s",
        "width": 75,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/9A5sE0WoFEP5RV7rny9VQ_ThC7khBOyqH9_GCrvGAKebfzvLq56Q__VD38Ts-JlrHRZPUWpUF3GOsjxZtdDzccg9.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=75x56"
       },
...
```
