---
sidebar_position: 19
---

# Get codes upload status
 Gets the status of digital item codes upload by task ID



`Function GetCodesUploadStatus(Val ClientID, Val APIKey, Val TaskID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | TaskID | --taskid | String, Number | Add product task ID |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
Method at API documentation: [post /v1/product/upload_digital_codes/info](https://docs.ozon.ru/api/seller/#operation/ProductAPI_UploadDigitalCodeInfo)
:::
<br/>


```bsl title="Code example"
    ClientID = "2128753";
    APIKey   = "7cc90d26-33e4-499b...";
    TaskID   = "1";

    Result = OPI_Ozon.GetCodesUploadStatus(ClientID, APIKey, TaskID);
```



```sh title="CLI command example"
    
  oint ozon GetCodesUploadStatus --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --taskid %taskid%

```

```json title="Result"
{
 "code": 7,
 "message": "s2s: method \"/endpoints.v1.Service/GetDigitalCodesTaskByID\" is not allowed for the provided access tokens: permission denied",
 "details": []
}
```
