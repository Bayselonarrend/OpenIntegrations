---
sidebar_position: 1
---

# Create field
 Creates a new field in the table



`Function CreateField(Val Token, Val Base, Val Table, Val FieldStructure) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Base | --base | String | Base identifier |
  | Table | --table | String | Table identifier |
  | FieldStructure | --fielddata | Structure of KeyAndValue | Description of the new field |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Airtable

<br/>




```bsl title="Code example"
    Token = "patNn4BXW66Yx3pdj.5b93c53cab554a8387de02d...";
    Base  = "app9bSgL4YtTVGTlE";
    Table = "tblDUGAZFZaeOwE6x";
    Name  = String(New UUID);

    Field  = OPI_Airtable.GetNumberField(Name);
    Result = OPI_Airtable.CreateField(Token, Base, Table, Field);
```



```sh title="CLI command example"
    
  oint airtable CreateField --token %token% --base "apptm8Xqo7TwMaipQ" --table "tbl9G4jVoTJpxYwSY" --fielddata %fielddata%

```

```json title="Result"
{
 "type": "number",
 "options": {
  "precision": 0
 },
 "id": "fldDqI1OXajeQw5Gg",
 "name": "b3fd1280-83b2-4145-838d-3437b14adee3"
}
```
