---
sidebar_position: 18
---

# Complete the complex attribute
 Formats the value in attribute format and adds it to the <attributes> array of the collection



`Function CompleteComplexAttribute(Collection, Val AttributeID, Val ComplexID, Val Values) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Collection | --object | Structure Of String | Complex attribute structure or product structure |
  | AttributeID | --attributeid | String, Number | Attribute ID |
  | ComplexID | --complexid | String, Number | Complex attribute ID |
  | Values | --values | Arbitrary | Value or array of values to add to <values> field |

  
  Returns:  Structure - A collection enhanced with a new attribute

<br/>

:::tip
In 1C the method can be used as a procedure, without getting a return value. Return value is required for CLI version
:::
<br/>


```bsl title="Code example"
    ItemStructure = New Structure;
    ItemStructure.Insert("description_category_id", 17028922);
    ItemStructure.Insert("name"                   , "Protective film set for X3 NFC. Dark cotton");
    ItemStructure.Insert("offer_id"               , "143210608");
    ItemStructure.Insert("barcode"                , "112772873170");
    ItemStructure.Insert("price"                  , "1000");
    ItemStructure.Insert("old_price"              , "1100");
    ItemStructure.Insert("vat"                    , "0.1");
    ItemStructure.Insert("height"                 , 250);
    ItemStructure.Insert("width"                  , 150);
    ItemStructure.Insert("depth"                  , 10);
    ItemStructure.Insert("dimension_unit"         , "mm");
    ItemStructure.Insert("weight"                 , 100);
    ItemStructure.Insert("weight_unit"            , "g");

    CategoryAttribute1 = New Structure("dictionary_value_id,value", 971082156, "Speaker stand");

    CategoryAttribute2 = New Structure("value", "Protective film set for X3 NFC. Dark cotton");

    OPI_Ozon.CompleteComplexAttribute(ItemStructure, 5076 , 0, CategoryAttribute1);
    OPI_Ozon.CompleteComplexAttribute(ItemStructure, 9048 , 0, CategoryAttribute2);
```



```sh title="CLI command example"
    
  oint ozon CompleteComplexAttribute --object %object% --attributeid %attributeid% --complexid %complexid% --values %values%

```

```json title="Result"
{
 "description_category_id": 17028922,
 "name": "Protective film set for X3 NFC. Dark cotton",
 "offer_id": "143210608",
 "barcode": "112772873170",
 "price": "1000",
 "old_price": "1100",
 "vat": "0.1",
 "height": 250,
 "width": 150,
 "depth": 10,
 "dimension_unit": "mm",
 "weight": 100,
 "weight_unit": "g",
 "attributes": [
  {
   "id": 5076,
   "complex_id": 0,
   "values": [
    {
     "dictionary_value_id": 971082156,
     "value": "Speaker stand"
    }
   ]
  },
  {
   "id": 9048,
   "complex_id": 0,
   "values": [
    {
     "value": "Protective film set for X3 NFC. Dark cotton"
    }
   ]
  }
 ]
}
```
