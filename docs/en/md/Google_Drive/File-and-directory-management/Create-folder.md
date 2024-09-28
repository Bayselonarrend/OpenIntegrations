---
sidebar_position: 5
---

# Create folder
 Creates an empty directory on the drive



`Function CreateFolder(Val Token, Val Name, Val Parent = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Name | --title | String | Folder name |
  | Parent | --catalog | String | Parent |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token     = "ya29.a0AcM612wLdbBK14FR2SE0d3WHabYb8Xtppm0oKCcbVrecgsA-a5DfsgZ29stOw4hu84F_IpHbKTJocsm1WpjLQPBT5MJ6p8D7H1PKa_iT0...";
    Directory = "191iyaa6-2BCNRPOF0F8mQ0TuNWPNesdM";
    Name      = "TestFolder";

    Result = OPI_GoogleDrive.CreateFolder(Token, Name, Directory);
```



```sh title="CLI command example"
    
  oint gdrive CreateFolder --token %token% --title "TestFolder" --catalog %catalog%

```

```json title="Result"
{
  "mimeType": "application/vnd.google-apps.folder",
  "name": "TestFolder",
  "id": "1fIqr5pJV3QybT5sPeZhBD_0TIvtL5Ovc",
  "kind": "drive#file"
  }
```
