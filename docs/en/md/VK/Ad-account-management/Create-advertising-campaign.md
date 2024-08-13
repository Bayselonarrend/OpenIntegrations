---
sidebar_position: 1
---

# Create advertising campaign
 Creates a campaign in the selected advertising account



`Function CreateAdvertisingCampaign(Val AccountID, Val Name, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | AccountID | --cabinet | String, Number | Advertising account ID |
  | Name | --title | String | Campaign name |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
  Parameters = GetVKParameters();
  
  AccountID = "1607951446";
  Name = "New campaign";
  
  Result = OPI_VK.CreateAdvertisingCampaign(AccountID, Name, Parameters);
```



```sh title="CLI command example"
    
  oint vk CreateAdvertisingCampaign --cabinet "1607951446" --title %title% --auth "GetVKParameters()"

```

```json title="Result"
  {
  "response": [
  {
  "id": 1029701085
  }
  ]
  }

```
