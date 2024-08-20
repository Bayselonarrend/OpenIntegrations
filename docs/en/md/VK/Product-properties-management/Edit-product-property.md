---
sidebar_position: 3
---

# Edit product property
 Edits the existing product property



`Function EditProductProperty(Val Name, Val Property, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Name | --title | String | New name |
  | Property | --prop | String, Number | Property ID |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();

    Name     = "Color (change.)";
    Property = "695";

    Result = OPI_VK.EditProductProperty(Name, Property, Parameters);
```



```sh title="CLI command example"
    
  oint vk EditProductProperty --title "Color (change.)" --prop "648" --auth "GetVKParameters()"

```

```json title="Result"
{
  "response": 1
  }
```
