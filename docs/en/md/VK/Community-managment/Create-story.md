---
sidebar_position: 7
---

# Create story
 Creates a story from an image



`Function CreateStory(Val Image, Val URL = "", Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Image | --picture | String, BinaryData | Story background |
  | URL | --url | String | URL for button under the story |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();
    URL        = "https://github.com/Bayselonarrend/OpenIntegrations";

    Image = "https://openintegrations.dev/test_data/picture.jpg"; // URL, Path to file or Binary Data
    TFN   = GetTempFileName("png");
    CopyFile(Image, TFN);
    Image = New BinaryData(TFN);

    Result = OPI_VK.CreateStory(Image , URL, Parameters);

    Result = OPI_VK.CreateStory(TFN, , Parameters);
```



```sh title="CLI command example"
    
  oint vk CreateStory --picture "https://openintegrations.dev/test_data/picture.jpg // URL, Path to file or Binary Data" --url "https://github.com/Bayselonarrend/OpenIntegrations" --auth "GetVKParameters()"

```

```json title="Result"
{
  "response": {
  "count": 1,
  "items": [
  {
  "id": 456239491,
  "owner_id": -218861756,
  "access_key": "story",
  "can_comment": 1,
  "can_reply": 1,
  "can_see": 1,
  "can_like": true,
  "can_share": 1,
  "can_hide": 1,
  "date": 1717072436,
  "expires_at": 1717158836,
  "link": {
  "text": "More",
  "url": "https://github.com/Bayselonarrend/OpenIntegrations"
  },
  "photo": {
  "album_id": -81,
  "date": 1717072436,
  "id": 457244016,
  "owner_id": -218861756,
  "sizes": [
  {
  "height": 56,
  "type": "s",
  "width": 75,
  "url": "https://sun6-20.userapi.com/s/v1/ig2/TUrQJn6Un8LHB0aNIOPtaqEt3K_J4tZbV2notqyJ1TUyHCj9m-bbiOZKm1u07WpGGAZfH1LFXbg95EM-uS0JHKX9.jpg?size=75x56&quality=95&type=story"
  },
  {
  "height": 97,
  "type": "m",
  "width": 130,
  "url": "https://sun6-20.userapi.com/s/v1/ig2/lASmJS8sUOYvtmSKkFOsBGNIWpcqoqenWSBOdBHSXQE9PuZjUx_aVVA3Zd6DOV08nssSEYQgXJ6Vam6TiPx2Lcpm.jpg?size=130x97&quality=95&type=story"
  },
  {
  "height": 192,
  "type": "j",
  "width": 256,
  "url": "https://sun6-20.userapi.com/s/v1/ig2/mmYPgPQo3uRxhAH1qIKIijT-5j87fr0A5PEe1X8k3kdo5MmagHYZIdECvXyFL9KubVsKzTZTWFJSQgskL5a09dhS.jpg?size=256x192&quality=95&type=story"
  },
  {
  "height": 453,
  "type": "x",
  "width": 604,
  "url": "https://sun6-20.userapi.com/s/v1/ig2/APnAEUFfn6z-WwqFWAM0_jbv9cRo4zrIPx3RSFrsSNdh8bXpv6438yZqB_BDM3pMfSfl6Gsx751T7mJ8yEf_zCi9.jpg?size=604x453&quality=95&type=story"
  },
  {
  "height": 605,
  "type": "y",
  "width": 807,
  "url": "https://sun6-20.userapi.com/s/v1/ig2/vou57hqLWC875j9nOB1HbiEWaVcSXCHmxNlyzyKEyKv6UO97Mm67PyKNftSvW0RvaHARFvl7Hc9noOv2TAV8Tq6X.jpg?size=807x605&quality=95&type=story"
  },
  {
  "height": 960,
  "type": "z",
  "width": 1280,
  "url": "https://sun6-20.userapi.com/s/v1/ig2/WGh4yRLRWsT4baZUDXiIUZU90sFYcZKcme9nnAPSy8CW_uYDQRDQSy8s0SkNRDEBteCyRBPG0Ka7tPwRQzp5M6Cx.jpg?size=1280x960&quality=95&type=story"
  },
  {
  "height": 1920,
  "type": "w",
  "width": 2560,
  "url": "https://sun6-20.userapi.com/s/v1/ig2/QugTL2gH3oV88GUPKhP1GOUfKWONc8iSt_v-Qt6TOsmioQPJ9nyq4L2a1yBHu2eSJKjsql1VhMtEx6wpt3fVVnly.jpg?size=2560x1920&quality=95&type=story"
  }
  ],
  "text": "",
  "user_id": 100,
  "web_view_token": "404a88e5d32e0ff306",
  "has_tags": false
  },
  "replies": {
  "count": 0,
  "new": 0
  },
  "is_one_time": false,
  "track_code": "story/3AAQAdLy9G9EAs4bMamDA84nNfHkBAAFoAagB6AIAA==",
  "type": "photo",
  "views": 0,
  "likes_count": 0,
  "reaction_set_id": "reactions",
  "no_sound": false,
  "can_ask": 0,
  "can_ask_anonymous": 0,
  "narratives_count": 0,
  "can_use_in_narrative": true
  }
  ]
  }
  }
```
