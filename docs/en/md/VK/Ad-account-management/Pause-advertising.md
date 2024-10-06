---
sidebar_position: 3
---

# Pause advertising post
 Pauses the display of the advertising post



`Function PauseAdvertising(Val AccountID, Val AdID, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | AccountID | --cabinet | String, Number | Advertising account ID |
  | AdID | --adv | String, Number | Ad ID |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();

    AccountID = "1607951446";
    AdID      = "0";

    Result = OPI_VK.PauseAdvertising(AccountID, AdID, Parameters);
```



```sh title="CLI command example"
    
  oint vk PauseAdvertising --cabinet "1607951446" --adv "0" --auth "GetVKParameters()"

```

```json title="Result"
{
 "error": {
  "error_code": 100,
  "error_msg": "One of the parameters specified was missing or invalid: data[0][ad_id] is invalid",
  "request_params": [
   {
    "key": "from_group",
    "value": "1"
   },
   {
    "key": "owner_id",
    "value": "-218861756"
   },
   {
    "key": "v",
    "value": "5.131"
   },
   {
    "key": "app_id",
    "value": "51694790"
   },
   {
    "key": "group_id",
    "value": "218861756"
   },
   {
    "key": "account_id",
    "value": "1607951446"
   },
   {
    "key": "data",
    "value": "[\r\n {\r\n  \"ad_id\": \"0\",\r\n  \"status\": 0\r\n }\r\n]"
   },
   {
    "key": "method",
    "value": "ads.updateAds"
   },
   {
    "key": "oauth",
    "value": "1"
   }
  ]
 }
}
```
