---
sidebar_position: 3
---

# Get list of published objects.
 Gets a list of published objects



`Function GetPublishedObjectsList(Val Token, Val Count = 0, Val OffsetFromStart = 0) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Count | --amount | Number | Number of returned objects |
  | OffsetFromStart | --offset | Number | Offset for getting objects not from the beginning of the list |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
    Token           = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Count           = 2;
    OffsetFromStart = 1;

    Result = OPI_YandexDisk.GetPublishedObjectsList(Token, Count, OffsetFromStart);
```



```sh title="CLI command example"
    
  oint yadisk GetPublishedObjectsList --token "y0_AgAAAABdylaOAA..." --amount %amount% --offset %offset%

```

```json title="Result"

```
