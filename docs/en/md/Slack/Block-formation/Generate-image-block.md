---
sidebar_position: 1
---

# Generate image block
 Generates a block with an image to add to the message block array



`Function GenerateImageBlock(Val URL, Val AlternateText = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --picture | String | Image URL |
  | AlternateText | --alt | String | Alternate text of the image |

  
  Returns:  Map Of KeyAndValue - Image block

<br/>




```bsl title="Code example"
  
  Text = "Alpaca picture";
  URL = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png?v1";
  
  Response = OPI_Slack.GenerateImageBlock(URL, Text); //Map
  Response = OPI_Tools.JSONString(Response); //JSON string
```



```sh title="CLI command example"
    
  oint slack GenerateImageBlock --picture "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png?v1" --alt %alt%

```

```json title="Result"
{
  "alt_text": "Yo",
  "image_url": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png?v1",
  "type": "image"
  }
```
