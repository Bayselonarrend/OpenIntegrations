---
sidebar_position: 4
---

# Delete object
 Deletes an object at the specified path



`Function DeleteObject(Val Token, Val Path, Val ToCart = True) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path to the folder or file to be deleted |
  | ToCart | --can | Boolean | To cart |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
    Token = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Path  = "/ef1c7053-d969-4d1d-9101-52190c3b3a39.png";

    Result = OPI_YandexDisk.DeleteObject(Token, Path, False);
```



```sh title="CLI command example"
    
  oint yadisk DeleteObject --token "y0_AgAAAABdylaOAA..." --path "/Alpaca.png" --can %can%

```

```json title="Result"
<empty string>
```
