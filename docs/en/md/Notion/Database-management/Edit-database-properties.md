---
sidebar_position: 3
---

# Edit database properties
 Edits properties of an existing database



`Function EditDatabaseProperties(Val Token, Val Base, Val Properties = "", Val Title = "", Val Description = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Base | --base | String | Target database ID |
  | Properties | --props | Map of KeyAndValue | New or modified database properties |
  | Title | --title | String | New database title |
  | Description | --description | String | New database description |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Notion

<br/>




```bsl title="Code example"
    Token = "secret_9RsfMrRMqZwqp0Zl0B...";
    Base  = "11282aa7-fc4e-810b-ab77-cef5a2a3443e";

    Title       = "TestTitle";
    Description = "TestDescription";

    Properties = New Map;
    Properties.Insert("Email", "rich_text"); // Type fields "Email" will changed with email to text
    Properties.Insert("Website"); // Field "Website" will deleted

    Result = OPI_Notion.EditDatabaseProperties(Token, Base, Properties, Title, Description);
```



```sh title="CLI command example"
    
  oint notion EditDatabaseProperties --token "secret_9RsfMrRMqZwqp0Zl0B..." --base "5dd94c34fab04bff9..." --props %props% --title "Updated title" --description "Updated base description"

```

```json title="Result"

```
