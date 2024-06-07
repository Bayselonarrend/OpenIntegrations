---
sidebar_position: 2
---

# Create composite post
 Creates a post based on an array of object identifiers (images, videos, etc..)


*Function CreateCompositePost(Val Text, Val Objects, Val Advertisement = False, Val LinkUnderPost = "", Val Parameters = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Text | --text | String | Post text |
 | Objects | --objects | Array of String | Array of identifiers like photo123_123 |
 | Advertisement | --ad | Boolean | Sign ""This is an ad"" |
 | LinkUnderPost | --url | String | Link (URL) under the post |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK

```bsl title="Code example"
	
 Parameters = GetVKParameters();
 Text = "Post from autotest";
 URL = "https://github.com/Bayselonarrend/OpenIntegrations";
 
 Image = "https://openintegrations.dev/test_data/picture.jpg"; // URL, Path or Binary Data
 Video = "https://openintegrations.dev/test_data/video.mp4"; // URL, Path or Binary Data
 
 TFN = GetTempFileName("png"); 
 CopyFile(Image, TFN);
 
 ImageUpload = OPI_VK.UploadPhotoToServer(TFN, Parameters)["response"][0];
 VideoUpload = OPI_VK.UploadVideoToServer(Video, "NewVideo",,, Parameters);
 
 ImageOwner = OPI_Tools.NumberToString(ImageUpload["owner_id"]);
 VideoOwner = OPI_Tools.NumberToString(VideoUpload["owner_id"]);
 
 ImageID = OPI_Tools.NumberToString(ImageUpload["id"]);
 VideoID = OPI_Tools.NumberToString(VideoUpload["video_id"]);
 
 AttachmentsArray = New Array;
 AttachmentsArray.Add("photo" + ImageOwner + "_" + ImageID);
 AttachmentsArray.Add("video" + VideoOwner + "_" + VideoID);
 
 Result = OPI_VK.CreateCompositePost(Text, AttachmentsArray, False, URL, Parameters);
 
	
```

```sh title="CLI command example"
 
 oint vk CreateCompositePost --text %text% --objects %objects% --ad %ad% --url %url% --auth %auth%


```


```json title="Result"

{
 "response": {
 "post_id": 2126
 }
}

```
