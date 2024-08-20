---
sidebar_position: 7
---

# Delete product property variant
 Deletes the previously created product property variant



`Function DeleteProductPropertyVariant(Val Option, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Option | --option | String, Number | Variant ID |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();

    Option = "2177";

    Result = OPI_VK.DeleteProductPropertyVariant(Option, Parameters);

    Check_VKTrue(Result);

    OPI_Tools.Pause(5);
```



```sh title="CLI command example"
    
  oint vk DeleteProductPropertyVariant --option "2054" --auth "GetVKParameters()"

```

```json title="Result"
{
  "response": 1
  }
```
