---
sidebar_position: 11
---

# Upload photo to server
 Uploads photo to server for further use


*Function UploadPhotoToServer(Val Image, Val Parameters = "", Val View = "Post") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Image | --file | String, BinaryData | Image file |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |
 | View | --type | String | Upload type (Post, Product, Story, Poll, Other) |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK 

```bsl title="Code example"
	
 Image = "https://openintegrations.dev/test_data/picture.jpg"; // URL, Path or Binary Data
 
 TFN = GetTempFileName("png"); 
 FileCopy(Image, TFN);
 
 ImageUpload = OPI_VK.UploadPhotoToServer(Image, Parameters);
 ImageUpload = OPI_VK.UploadPhotoToServer(TFN, Parameters);
 
	
```

```sh title="CLI command example"
 
 oint vk UploadPhotoToServer --file %file% --auth %auth% --type %type%


```


```json title="Result"



```
