---
sidebar_position: 9
---

# Get field (phone)
 Gets the description of a phone number field



`Function GetPhoneField(Val Name) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Name | --title | String | Field name |

  
  Returns:  Structure - Field description

<br/>




```bsl title="Code example"
  
  Name = "Phone";
  
  Response = OPI_Airtable.GetPhoneField(Name); //Map
  Response = OPI_Tools.JSONString(Response); //JSON string
```



```sh title="CLI command example"
    
  oint airtable GetPhoneField --title "Phone"

```

```json title="Result"
{
  "name": "Phone",
  "type": "phoneNumber"
  }
```
