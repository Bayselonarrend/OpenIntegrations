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
    Token      = "ya29.a0AcM612z6H4poMFq_1-p1k1-QF7c-gwUkVSsqTdSkNphsLEOb5P6mIEka1HO6Qtpa8blAWg966f9g85FujqfIsORbwU-wVy_3xEHh5ycBg...";
    Identifier = "1A0oqifjQs0coHvFLF4BFr7hCmOJxETDe";

    Result = OPI_GoogleDrive.DeleteObject(Token, Identifier);
```



```sh title="CLI command example"
    
  oint gdrive DeleteObject --token %token% --object "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa"

```

```json title="Result"
''
```
