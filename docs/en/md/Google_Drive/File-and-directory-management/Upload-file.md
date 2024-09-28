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
    Token     = "ya29.a0AcM612z6H4poMFq_1-p1k1-QF7c-gwUkVSsqTdSkNphsLEOb5P6mIEka1HO6Qtpa8blAWg966f9g85FujqfIsORbwU-wVy_3xEHh5ycBg...";
    Image     = "https://openintegrations.dev/test_data/picture.jpg";
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
  "mimeType": "image/jpeg",
  "name": "New file.jpg",
  "id": "16hPGNTMmbnXhz_g0vjGbrLP19h56RwIg",
  "kind": "drive#file"
  }
```
