---
sidebar_position: 1
---

# Create page
 Creates a child page above another parent page



`Function CreatePage(Val Token, Val Parent, Val Title) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Parent | --page | String | Parent ID |
  | Title | --title | String | Page title |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Notion

<br/>




```bsl title="Code example"
    Token  = "secret_9RsfMrRMqZwqp0Zl0B...";
    Parent = "5dd94c34fab04bff986b7511c0779f77";
    Title  = "TestTitle";

    Result = OPI_Notion.CreatePage(Token, Parent, Title);
```



```sh title="CLI command example"
    
  oint notion CreatePage --token "secret_9RsfMrRMqZwqp0Zl0B..." --page "5dd94c34fab04bff9..." --title "Created by 1C"

```

```json title="Result"

```
