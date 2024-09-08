---
sidebar_position: 15
---

# Upload product activations codes
 Uploads activation codes for a digital product or service



`Function UploadProductActivationCodes(Val ClientID, Val APIKey, Val ProductID, Val Codes) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | ProductID | --productid | Number | Product ID |
  | Codes | --codes | String, Array of String | Digital product activation codes |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
The activation code is linked to the digital product card

 Uploading status check - GetCodesUploadStatus()

 Method at API documentation: [post /v1/product/upload_digital_codes](https://docs.ozon.ru/api/seller/#operation/ProductAPI_UploadDigitalCode)
:::
<br/>


```bsl title="Code example"
    ClientID  = "2128753";
    APIKey    = "7cc90d26-33e4-499b...";
    ProductID = "1111588191";

    Codes = New Array;
    Codes.Add("11111111");
    Codes.Add("22222222");

    Result = OPI_Ozon.UploadProductActivationCodes(ClientID, APIKey, ProductID, Codes);
```



```sh title="CLI command example"
    
  oint ozon UploadProductActivationCodes --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --productid "1111588191" --codes %codes%

```

```json title="Result"
{
 "code": 7,
 "message": "Is not service company",
 "details": []
}
```
