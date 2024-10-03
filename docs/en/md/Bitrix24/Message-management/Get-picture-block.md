﻿---
sidebar_position: 8
---

# Get picture block
 Make picture block for SendMessage method



`Function GetPictureBlock(Val Name, Val URL) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Name | --title | String | Picture name |
  | URL | --url | String | URL of sending picture |

  
  Returns:  Structure - PictureBlock

<br/>

:::tip
Blocks at API documentation: [Link](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&CHAPTER_ID=07867)
:::
<br/>


```bsl title="Code example"
    Name = "Image";
    URL  = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg";

    Result = OPI_Bitrix24.GetPictureBlock(Name, URL);
```



```sh title="CLI command example"
    
  oint bitrix24 GetPictureBlock --title %title% --url %url%

```

```json title="Result"

```
