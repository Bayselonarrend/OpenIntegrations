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
    Token      = "ya29.a0AcM612yQIsgMPiOdOLBSBoiVfcCBuJ5T9HRP5lB04ipL2jQDnyuXGmn-IkxMKqss53fPz99sXRoX3_ZJt6s_N7YSfVzI88y_uUa2euM32...";
    NewName    = "UpdatedFile.jpg";
    Identifier = "1rjQ1PytDjJVgTIkNK600sQEPGqHDIeWW";
    File       = "https://api.athenaeum.digital/test_data/picture2.jpg"; // URL, Binary Data or Path to file

    Result = OPI_GoogleDrive.UpdateFile(Token, Identifier, File, NewName);
```



```sh title="CLI command example"
    
  oint gdrive UpdateFile --token %token% --object "1V0oaZh3qQZ7-wbARC8-vrErAFllsBGSJ" --file %file% --title %title%

```

```json title="Result"
{
 "kind": "drive#file",
 "id": "1slRtvK9Yap08a-wh_iE5go6dkCMwZrYH",
 "name": "UpdatedFile.jpg",
 "mimeType": "image/jpeg"
}
```
