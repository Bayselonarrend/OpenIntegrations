﻿---
sidebar_position: 1
---

# Create post
 Creates a post with images



`Function CreatePost(Val Text, Val ImageArray, Val Advertisement = False, Val LinkUnderPost = "", Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Text | --text | String | Post text |
  | ImageArray | --pictures | Array of String, BinaryData | Array of images |
  | Advertisement | --ad | Boolean | Sign ""This is an ad"" |
  | LinkUnderPost | --url | String | Link (URL) under the post |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();
    Text       = "Post from autotest";
    URL        = "https://github.com/Bayselonarrend/OpenIntegrations";

    Image  = "https://openyellow.neocities.org/test_data/picture.jpg"; // URL, Path or Binary Data
    Image2 = "https://openyellow.neocities.org/test_data/picture2.jpg"; // URL, Path or Binary Data

    TFN = GetTempFileName("png");
    CopyFile(Image2, TFN);

    ImageArray = New Array;
    ImageArray.Add(Image);
    ImageArray.Add(TFN);

    Result = OPI_VK.CreatePost(Text, ImageArray, True, URL, Parameters);

    Result = OPI_VK.CreatePost(Text, Image, False , , Parameters);
```



```sh title="CLI command example"
    
  oint vk CreatePost --text "Post from autotest" --pictures %pictures% --ad %ad% --url %url% --auth "GetVKParameters()"

```

```json title="Result"
{
 "response": {
  "post_id": 4552
 }
}
```
