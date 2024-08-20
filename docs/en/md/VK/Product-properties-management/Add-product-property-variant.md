---
sidebar_position: 5
---

# Add product property variant
 Adds a variant for an existing property



`Function AddProductPropertyVariant(Val Value, Val Property, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Value | --value | String | Property value |
  | Property | --prop | String, Number | Property ID where the variant is added |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();

    Property    = "695";
    OptionArray = New Array;
    OptionArray.Add("Yellow");
    OptionArray.Add("Blue");
    OptionArray.Add("Red");

    For Each Value In OptionArray Do

        Result = OPI_VK.AddProductPropertyVariant(Value, Property, Parameters);

        FunctionParameters.Insert(ParameterName, VariantID);
    EndDo;
```



```sh title="CLI command example"
    
  oint vk AddProductPropertyVariant --value %value% --prop "648" --auth "GetVKParameters()"

```

```json title="Result"
{
  "response": {
  "variant_id": 980
  }
  }
```
