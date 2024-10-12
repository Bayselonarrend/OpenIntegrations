---
sidebar_position: 7
---

# Upload attachments array
 Uploads files to the server and returns their IDs



`Function UploadAttachmentsArray(Val ArrayOfFiles, Val AttachmentsType, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ArrayOfFiles | --files | Array of String, BinaryData | Array of files to be uploaded |
  | AttachmentsType | --type | String | Attachment type: tweet_video, tweet_image, tweet_gif |
  | Parameters | --auth | Structure Of String | Authorization data. See GetStandardParameters |

  
  Returns:  Array Of String - Media ID array

<br/>




```bsl title="Code example"
    Parameters = GetTwitterAuthData();

    Image1 = "https://api.athenaeum.digital/test_data/picture.jpg"; // URL, Binary Data or Path to file
    Image2 = "https://api.athenaeum.digital/test_data/picture2.jpg"; // URL, Binary Data or Path to file

    ImageArray = New Array();
    ImageArray.Add(Image1);
    ImageArray.Add(Image2);

    Result = OPI_Twitter.UploadAttachmentsArray(ImageArray, "tweet_image", Parameters);
```



```sh title="CLI command example"
    
oint twitter UploadAttachmentsArray --files %files% --type %type% --auth %auth%

```

```json title="Result"
[
 "1843891479330058240",
 "1843891499429142528"
]
```
