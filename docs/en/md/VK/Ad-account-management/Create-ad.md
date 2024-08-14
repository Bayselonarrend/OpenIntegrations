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

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();

    CampaignNumber = "1030466671";
    DailyLimit     = 150;
    CategoryNumber = 126;
    PostID         = "3529";
    AccountID      = "1607951446";

    Result = OPI_VK.CreateAd(CampaignNumber
        , DailyLimit
        , CategoryNumber
        , PostID
        , AccountID
        , Parameters);
```



```sh title="CLI command example"
    
  oint vk CreateAd --campaign "1030425511" --limit "150" --category "126" --post "3356" --cabinet "1607951446" --auth "GetVKParameters()"

```

```json title="Result"
{
  "response": [
  {
  "id": 171372386
  }
  ]
  }
```
