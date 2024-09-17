﻿---
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

    AccountID = FunctionParameters["VK_AdsCabinetID"];
    AdID      = FunctionParameters["VK_AdsPostID"];

    Result = OPI_VK.PauseAdvertising(AccountID, AdID, Parameters);
```



```sh title="CLI command example"
    
  oint vk PauseAdvertising --cabinet "1607951446" --adv "0" --auth "GetVKParameters()"

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
