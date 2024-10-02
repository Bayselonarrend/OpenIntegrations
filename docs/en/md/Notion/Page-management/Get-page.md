---
sidebar_position: 3
---

# Get page
 Gets information about the page by ID



`Function GetPage(Val Token, Val Page) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Page | --page | String | Page ID |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Notion

<br/>




```bsl title="Code example"
    Token = "secret_9RsfMrRMqZwqp0Zl0B...";
    Page  = "11282aa7-fc4e-814c-990c-dd3c9c3c2c22";

    Result = OPI_Notion.GetPage(Token, Page);
```



```sh title="CLI command example"
    
  oint notion GetPage --token "secret_9RsfMrRMqZwqp0Zl0B..." --page "a574281614174169bf55dbae4..."

```

```json title="Result"

```
