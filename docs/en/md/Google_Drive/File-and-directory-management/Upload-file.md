---
sidebar_position: 4
---

# Upload file
 Uploads a file to the drive



`Function UploadFile(Val Token, Val File, Val Description) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | File | --file | BinaryData,String | File to be uploaded |
  | Description | --props | Map Of KeyAndValue | JSON description or path to .json |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token     = "ya29.a0AcM612y5AI1OiRmaNZZdcZkEXR0hzPPvvmrHwVvQ_wKT0Lo35AFd6j6lHZWalv-zxiYHKQUWkU1GRjCf4Lo9uQwygnC9xAOZKaOORjGI3...";
    Image     = "https://api.athenaeum.digital/test_data/picture.jpg";
    Directory = "191iyaa6-2BCNRPOF0F8mQ0TuNWPNesdM";

    Description = OPI_GoogleDrive.GetFileDescription();
    Description.Insert("Parent", Directory);

    Result = OPI_GoogleDrive.UploadFile(Token, Image, Description);
```



```sh title="CLI command example"
    
  oint gdrive UploadFile --token %token% --file %file% --props %props%

```

```json title="Result"
{
 "kind": "drive#file",
 "id": "1iscrZRfSVq4khO1E3n-uSbfSFDTZfYdE",
 "name": "New file.jpg",
 "mimeType": "image/jpeg"
}
```
