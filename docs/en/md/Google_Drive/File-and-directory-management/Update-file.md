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
    Token      = "ya29.a0AcM612wLdbBK14FR2SE0d3WHabYb8Xtppm0oKCcbVrecgsA-a5DfsgZ29stOw4hu84F_IpHbKTJocsm1WpjLQPBT5MJ6p8D7H1PKa_iT0...";
    NewName    = "UpdatedFile.jpg";
    Identifier = "1RijXw14hyQN_59ZOzJ9f35ezzU_qd114";
    File       = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture2.jpg"; // URL, Binary Data or Path to file

    Result = OPI_GoogleDrive.UpdateFile(Token, Identifier, File, NewName);
```



```sh title="CLI command example"
    
  oint gdrive UpdateFile --token %token% --object "1V0oaZh3qQZ7-wbARC8-vrErAFllsBGSJ" --file %file% --title %title%

```

```json title="Result"

```
