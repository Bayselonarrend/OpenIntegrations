---
sidebar_position: 8
---

# Update file
 Updates file binary data



`Function UpdateFile(Val Token, Val Identifier, Val File, Val NewName = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Identifier | --object | String | Identifier of the object to update |
  | File | --file | BinaryData,String | File source for update |
  | NewName | --title | String | New file name (if necessary) |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token      = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    NewName    = "UpdatedFile.jpg";
    Identifier = "1f-YrvMCEZ7r3JWlLGM39zn6dctvFjwCi";
    File       = "https://openyellow.neocities.org/test_data/picture2.jpg"; // URL, Binary Data or Path to file

    Result = OPI_GoogleDrive.UpdateFile(Token, Identifier, File, NewName);
```



```sh title="CLI command example"
    
  oint gdrive UpdateFile --token %token% --object "1V0oaZh3qQZ7-wbARC8-vrErAFllsBGSJ" --file %file% --title %title%

```

```json title="Result"
{
 "kind": "drive#file",
 "id": "15Altue8di42CdCumJSJFF2_mg0zVmBox",
 "name": "UpdatedFile.jpg",
 "mimeType": "image/jpeg"
}
```
