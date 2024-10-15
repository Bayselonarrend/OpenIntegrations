---
sidebar_position: 8
---

# Get field (email)
 Gets the description of an email field



`Function GetEmailField(Val Name) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Name | --title | String | Field name |

  
  Returns:  Structure - Field description

<br/>




```bsl title="Code example"
    Result = OPI_Airtable.GetEmailField("Email");
```
 



```json title="Result"
{
 "name": "Email",
 "type": "email"
}
```
