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
    Token     = "ya29.a0AcM612y5AI1OiRmaNZZdcZkEXR0hzPPvvmrHwVvQ_wKT0Lo35AFd6j6lHZWalv-zxiYHKQUWkU1GRjCf4Lo9uQwygnC9xAOZKaOORjGI3...";
    Directory = "191iyaa6-2BCNRPOF0F8mQ0TuNWPNesdM";
    Name      = "TestFolder";

    Result = OPI_GoogleDrive.CreateFolder(Token, Name, Directory);
```



```sh title="CLI command example"
    
  oint gdrive CreateFolder --token %token% --title "TestFolder" --catalog %catalog%

```

```json title="Result"
{
 "kind": "drive#file",
 "id": "1grSYVEN_m8PfHLj5ZrpDyMqDEtbF00E9",
 "name": "TestFolder",
 "mimeType": "application/vnd.google-apps.folder"
}
```
