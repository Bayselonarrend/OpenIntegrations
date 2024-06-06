---
sidebar_position: 1
---

# Create post
 Creates a post with images


*Function CreatePost(Val Text, Val ImageArray, Val Advertisement = False, Val LinkUnderPost = "", Val Parameters = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Text | --text | String | Post text |
 | ImageArray | --pictures | Array of String, BinaryData | Array of images |
 | Advertisement | --ad | Boolean | Sign ""This is an ad"" |
 | LinkUnderPost | --url | String | Link (URL) under the post |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK

```bsl title="Code example"
	
 Parameters = GetVKParameters();
 Text = "Post from autotest";
 URL = "https://github.com/Bayselonarrend/OpenIntegrations";
 
 Image = "https://openintegrations.dev/test_data/picture.jpg"; // URL, Path or Binary Data
 Image2 = "https://openintegrations.dev/test_data/picture2.jpg"; // URL, Path or Binary Data
 
 AndVF = GetTempFileName("png"); 
 CopyFile(Image2, AndVF);
 
 ImageArray = New Array;
 ImageArray.Add(Image);
 ImageArray.Add(AndVF);
 
 Result = OPI_VK.CreatePost(Text, ImageArray, True, URL, Parameters);
 Result = OPI_VK.CreatePost(Text, Image, False,, Parameters);
 
	
```

```sh title="CLI command example"
 
 oint vk CreatePost --text %text% --pictures %pictures% --ad %ad% --url %url% --auth %auth%


```


```json title="Result"

{
 "response": {
 "post_id": 2123
 }
}

```
