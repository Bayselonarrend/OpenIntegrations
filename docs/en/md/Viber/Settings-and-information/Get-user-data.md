---
sidebar_position: 3
---

# Get user data
 Gets user information by ID



`Function GetUserData(Val Token, Val UserID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | UserID | --user | String, Number | Viber User ID |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Viber

<br/>




```bsl title="Code example"
    Token  = "523b58ba82afffaa-7ef3b426...";
    UserID = "tMNGhftyUPrB3r1lD+bT4g==";

    Result = OPI_Viber.GetUserData(Token, UserID);
```



```sh title="CLI command example"
    
  oint viber GetUserData --token %token% --user %user%

```

```json title="Result"

```
