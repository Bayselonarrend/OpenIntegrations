---
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
    Token = "sl.B9sYGdZdLILSnqlGZCwLFCstq1B1GsgevbBkwi4UK_UlNyhGAoJ1fKoXMy3dQhkEb3e80HTL6g...";

    Result = OPI_Dropbox.GetSpaceUsageData(Token);
```



```sh title="CLI command example"
    
  oint dropbox GetSpaceUsageData --token "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ..."

```

```json title="Result"
{
 "used": 1477704605,
 "allocation": {
  ".tag": "individual",
  "allocated": 2147483648
 }
}
```
