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
    Token      = "ya29.a0AcM612wD1Uh1izWoUeXoBTM33TS6PlaGZFI6xXeGHeWT2_ZZZ0UbpJzbIurRFIjYKBnh4ZJ0HEgC9HNppTpTV6hgI7ZOwZO6J5KZlEbzH...";
    NewName    = "UpdatedFile.jpg";
    Identifier = "17pGWmj6IhPQB-wRJS3QOzqfqGghLRUGH";
    File       = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture2.jpg"; // URL, Binary Data or Path to file

    Result = OPI_GoogleDrive.UpdateFile(Token, Identifier, File, NewName);
```
 



```json title="Result"
{
 "kind": "drive#file",
 "id": "1slRtvK9Yap08a-wh_iE5go6dkCMwZrYH",
 "name": "UpdatedFile.jpg",
 "mimeType": "image/jpeg"
}
```
