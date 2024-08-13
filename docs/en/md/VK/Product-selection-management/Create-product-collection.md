---
sidebar_position: 3
---

# Create product selection
 Creates an empty product selection



`Function CreateProductCollection(Val Name, Val Image, Val Main = False, Val Hidden = False, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Name | --title | String | Selection name |
  | Image | --picture | String, BinaryData | Image file |
  | Main | --main | Boolean | Main |
  | Hidden | --hidden | Boolean | Hidden |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
  Parameters = GetVKParameters();
  
  Name = "TestCollection";
  Image = "https://openintegrations.dev/test_data/picture.jpg";
  Main = True;
  Hidden = False;
  
  Result = OPI_VK.CreateProductCollection(Name
  , Image
  , Main
  , Hidden
  , Parameters);
```



```sh title="CLI command example"
    
  oint vk CreateProductCollection --title "TestCollection" --picture "https://openintegrations.dev/test_data/picture.jpg" --main "True" --hidden "False" --auth "GetVKParameters()"

```

```json title="Result"
  {
  "response": {
  "albums_count": 23,
  "market_album_id": 39
  }
  }

```
