---
sidebar_position: 4
---

# Add product
 Adds a new product to the community's catalog



`Function AddProduct(Val ProductDescription, Val Selection = "", Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ProductDescription | --product | Map Of KeyAndValue | JSON description of the product or path |
  | Selection | --sel | String | Selection ID for placing the product, if needed |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();

    Image1    = "https://openintegrations.dev/test_data/picture.jpg"; // URL, Path to file or binary Data
    Image2    = "https://openintegrations.dev/test_data/picture2.jpg"; // URL, Path to file or binary Data
    Selection = "122";

    ImageArray = New Array;
    ImageArray.Add(Image1);
    ImageArray.Add(Image2);

    ProductDescription = New Map();
    ProductDescription.Insert("Name"             , "TestProduct");
    ProductDescription.Insert("Description"      , "Product description");
    ProductDescription.Insert("Category"         , "20173");
    ProductDescription.Insert("Price"            , 1);
    ProductDescription.Insert("OldPrice"         , 15);
    ProductDescription.Insert("MainPhoto"        , Image1);
    ProductDescription.Insert("URL"              , "https://github.com/Bayselonarrend/OpenIntegrations");
    ProductDescription.Insert("AdditionalPhotos" , ImageArray);
    ProductDescription.Insert("MainInGroup"      , True);
    ProductDescription.Insert("Width"            , 20);
    ProductDescription.Insert("Height"           , 30);
    ProductDescription.Insert("Depth"            , 40);
    ProductDescription.Insert("Weight"           , 100);
    ProductDescription.Insert("SKU"              , "12345");
    ProductDescription.Insert("AvailableBalance" , "10");

    Result = OPI_VK.AddProduct(ProductDescription, Selection, Parameters);
```



```sh title="CLI command example"
    
  oint vk AddProduct --product %product% --sel "125" --auth "GetVKParameters()"

```

```json title="Result"
{
  "response": {
  "market_item_id": 8656047
  }
  }
```
