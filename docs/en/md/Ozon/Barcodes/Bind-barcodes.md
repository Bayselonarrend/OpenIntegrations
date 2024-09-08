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

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

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



```sh title="CLI command example"
    
oint ozon BindBarcodes --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --barcodes %barcodes%

```

```json title="Result"

```
