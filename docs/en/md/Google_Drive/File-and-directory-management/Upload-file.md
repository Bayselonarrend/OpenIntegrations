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
    Token     = "ya29.a0AcM612wD1Uh1izWoUeXoBTM33TS6PlaGZFI6xXeGHeWT2_ZZZ0UbpJzbIurRFIjYKBnh4ZJ0HEgC9HNppTpTV6hgI7ZOwZO6J5KZlEbzH...";
    Image     = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg";
    Directory = "191iyaa6-2BCNRPOF0F8mQ0TuNWPNesdM";

    Description = OPI_GoogleDrive.GetFileDescription();
    Description.Insert("Parent", Directory);

    Result = OPI_GoogleDrive.UploadFile(Token, Image, Description);
```
 



```json title="Result"
{
 "kind": "drive#file",
 "id": "1iscrZRfSVq4khO1E3n-uSbfSFDTZfYdE",
 "name": "New file.jpg",
 "mimeType": "image/jpeg"
}
```
