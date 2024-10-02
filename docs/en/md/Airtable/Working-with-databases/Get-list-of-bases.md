---
sidebar_position: 1
---

# Get list of bases
 Gets the list of available bases



`Function GetListOfBases(Val Token, Val Indent = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Indent | --offset | String | Next page identifier of the base list from the previous request |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Airtable

<br/>




```bsl title="Code example"
    Token = "patNn4BXW66Yx3pdj.5b93c53cab554a8387de02d...";

    Result = OPI_Airtable.GetListOfBases(Token);
```



```sh title="CLI command example"
    
  oint airtable GetListOfBases --token %token% --offset %offset%

```

```json title="Result"

```
