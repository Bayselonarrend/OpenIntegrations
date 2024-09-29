﻿---
sidebar_position: 5
---

# Get space usage data
 Gets information on the amount of used disk space



`Function GetSpaceUsageData(Val Token) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
    Token = "sl.B91EDRcG6KqqbvQ9nc8sWhG3gvHG_3nWIpT8qbct8H-IHRKpi0kUuYPR64_hqVqYmsnnoR7HMj...";

    Result = OPI_Dropbox.GetSpaceUsageData(Token);
```



```sh title="CLI command example"
    
  oint dropbox GetSpaceUsageData --token "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ..."

```

```json title="Result"
{
  "used": 1477493597,
  "allocation": {
  ".tag": "individual",
  "allocated": 2147483648
  }
  }
```
