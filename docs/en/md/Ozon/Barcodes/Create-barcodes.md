---
sidebar_position: 2
---

# Create barcodes
 Generates new barcodes for products



`Function CreateBarcodes(Val ClientID, Val APIKey, Val ProductsID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | ProductsID | --productids | String, Array of String | Products IDs for barcodes creating |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
You can create barcodes for a maximum of 100 products per request

 From one merchant account, you can use the method no more than 20 times per minute

 Method at API documentation: [post /v1/barcode/generate](https://docs.ozon.ru/api/seller/#operation/generate-barcode)
:::
<br/>


```bsl title="Code example"
    ClientID  = "2128753";
    APIKey    = "7cc90d26-33e4-499b...";
    ProductID = "1111588191";

    Result = OPI_Ozon.CreateBarcodes(ClientID, APIKey, ProductID);
```



```sh title="CLI command example"
    
oint ozon CreateBarcodes --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --productids %productids%

```

```json title="Result"

```
