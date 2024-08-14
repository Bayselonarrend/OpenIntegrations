---
sidebar_position: 7
---

# Group products
 Groups products based on similar sets of properties



`Function GroupProducts(Val ProductsArray, Val ExistingGroup = "", Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ProductsArray | --items | Array Of String | Array of product IDs |
  | ExistingGroup | --sellgroup | String | ID of the existing group, if needed |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();

    Item1 = "9441430";
    Item2 = "9441431";

    ProductsArray = New Array;
    ProductsArray.Add(Item1);
    ProductsArray.Add(Item2);

    Result = OPI_VK.GroupProducts(ProductsArray, , Parameters);
```



```sh title="CLI command example"
    
  oint vk GroupProducts --items %items% --sellgroup %sellgroup% --auth "GetVKParameters()"

```

```json title="Result"
{
  "response": {
  "item_group_id": 5957
  }
  }
```
