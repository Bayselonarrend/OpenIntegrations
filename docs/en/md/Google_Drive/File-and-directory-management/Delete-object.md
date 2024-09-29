---
sidebar_position: 9
---

# Delete object
 Deletes file or directory by ID



`Function DeleteObject(Val Token, Val Identifier) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Identifier | --object | String | Identifier of the object to delete |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token      = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Identifier = "1f-YrvMCEZ7r3JWlLGM39zn6dctvFjwCi";

    Result = OPI_GoogleDrive.DeleteObject(Token, Identifier);
```



```sh title="CLI command example"
    
  oint gdrive DeleteObject --token %token% --object "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa"

```

```json title="Result"

```
