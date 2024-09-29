---
sidebar_position: 3
---

# Get list of comments
 Gets the list of all comments of the object



`Function GetCommentList(Val Token, Val ObjectID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | ObjectID | --object | String | Object identifier |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token      = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Identifier = "1f-YrvMCEZ7r3JWlLGM39zn6dctvFjwCi";

    Result = OPI_GoogleDrive.GetCommentList(Token, Identifier);
```



```sh title="CLI command example"
    
  oint gdrive GetCommentList --token %token% --object %object%

```

```json title="Result"

```
