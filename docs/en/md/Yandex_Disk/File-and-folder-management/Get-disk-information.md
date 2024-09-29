---
sidebar_position: 1
---

# Get disk information
 Gets information about the current disk



`Function GetDiskInformation(Val Token) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
  Token = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
  Result = OPI_YandexDisk.GetDiskInformation(Token);
```



```sh title="CLI command example"
    
  oint yadisk GetDiskInformation --token "y0_AgAAAABdylaOAAs0QgAAAAD5i-a..."

```

```json title="Result"

```
