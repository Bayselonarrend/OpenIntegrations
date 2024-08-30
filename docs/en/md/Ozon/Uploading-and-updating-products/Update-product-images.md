---
sidebar_position: 8
---

# Update product images
 Update images and marketing color



`Function UpdateProductImages(Val ClientID, Val APIKey, Val ProductID, Val ImagesArray = "", Val Array360 = "", Val MarketingColor = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | ProductID | --productid | String, Number | Product identifier |
  | ImagesArray | --images | Array Of String | Array of images URLs |
  | Array360 | --images360 | Array Of String | Array of 360 images |
  | MarketingColor | --color | String | Marketing color |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
On each method call, send all the images that should be on the product card

 To upload, pass the URL of the image to public cloud storage. The format of the image is JPG or PNG

 If you want to change the composition or order of the images, get the information using the GetProductInformation() method, copy the data of the images, images360, color_image fields, change and complete the composition or order as needed

 Method at API documentation: [post /v1/product/pictures/import](https://docs.ozon.ru/api/seller/#operation/ProductAPI_ProductImportPictures)
:::
<br/>


```bsl title="Code example"
    ClientID  = "2128753";
    APIKey    = "7cc90d26-33e4-499b...";
    ProductID = "1111588191";

    Image1 = "https://openintegrations.dev/test_data/picture.jpg";
    Image2 = "https://openintegrations.dev/test_data/picture2.jpg";

    MarketingColor = "GREEN";

    ImagesArray = New Array;
    ImagesArray.Add(Image1);
    ImagesArray.Add(Image2);

    Result = OPI_Ozon.UpdateProductImages(ClientID
        , APIKey
        , ProductID
        , ImagesArray
        ,
        , MarketingColor);
```



```sh title="CLI command example"
    
oint ozon UpdateProductImages --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --productid "1111588191" --images %images% --images360 %images360% --color %color%

```

```json title="Result"
{
 "result": {
  "pictures": [
   {
    "product_id": 1111588191,
    "url": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg",
    "state": "imported",
    "is_primary": true,
    "is_360": false,
    "is_color": false
   },
   {
    "product_id": 1111588191,
    "url": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture2.jpg",
    "state": "imported",
    "is_primary": false,
    "is_360": false,
    "is_color": false
   },
   {
    "product_id": 1111588191,
    "url": "GREEN",
    "state": "imported",
    "is_primary": false,
    "is_360": false,
    "is_color": true
   }
  ]
 }
}
```
