---
sidebar_position: 2
---

# Create advertising post
 Creates an advertising post based on a post



`Function CreateAd(Val CampaignNumber, Val DailyLimit, Val CategoryNumber, Val PostID, Val AccountID, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | CampaignNumber | --campaign | String, Number | Advertising campaign ID |
  | DailyLimit | --limit | String, Number | Daily limit in rubles |
  | CategoryNumber | --category | String, Number | Advertising category number |
  | PostID | --post | String, Number | ID of the post used for advertising |
  | AccountID | --cabinet | String, Number | Advertising account ID |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();

    CampaignNumber = "1030715875";
    DailyLimit     = 150;
    CategoryNumber = 126;
    PostID         = "4712";
    AccountID      = "1607951446";

    Result = OPI_VK.CreateAd(CampaignNumber
        , DailyLimit
        , CategoryNumber
        , PostID
        , AccountID
        , Parameters);
```
 



```json title="Result"
{
 "response": [
  {
   "id": 0,
   "error_code": 603,
   "error_desc": "Some ads error occurs: ORD details must be presented."
  }
 ]
}
```
