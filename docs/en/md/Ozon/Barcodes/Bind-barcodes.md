---
sidebar_position: 1
---

# Bind barcodes
 Binds barcodes to products



`Function BindBarcodes(Val ClientID, Val APIKey, Val BarcodesMap) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | BarcodesMap | --barcodes | Map Of KeyAndValue | Key > product SKU, Value > barcode |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Ozon Seller API

<br/>

:::tip
Method at API documentation: [post /v1/barcode/add](https://docs.ozon.ru/api/seller/#operation/add-barcode)
:::
<br/>


```bsl title="Code example"
    ClientID = "2128753";
    APIKey   = "7cc90d26-33e4-499b...";

    BarcodesMap = New Map;
    BarcodesMap.Insert(1626044001, "112233");

    Result = OPI_Ozon.BindBarcodes(ClientID, APIKey, BarcodesMap);
```
 



```json title="Result"
{
 "errors": [
  {
   "barcode": "112233",
   "code": "item_not_found",
   "error": "sellerID of item 1626044001 is not 2128753",
   "sku": 1626044001
  }
 ]
}
```
