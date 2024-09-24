---
sidebar_position: 1
---

# Get site data
 Gets information about a site by its name or token



`Function GetSiteData(Val Token, Val Website = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Auth token |
  | Website | --sitename | String | Site name (login) for information. Current, if not filled in |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Neocities

<br/>

:::tip
Neocities API docs: [neocities.org/api](https://neocities.org/api)
:::
<br/>


```bsl title="Code example"
    Token   = "7419cd51de4037f7...";
    Website = "2athenaeum";

    Result = OPI_Neocities.GetSiteData(Token);

    Result = OPI_Neocities.GetSiteData(Token, Website);
```



```sh title="CLI command example"
    
  oint neocities GetSiteData --token "7419cd51de4037f7..." --sitename %sitename%

```

```json title="Result"
{
 "result": "success",
 "info": {
  "sitename": "opi-test",
  "views": 7230,
  "hits": 13957,
  "created_at": "Thu, 20 Jun 2024 07:28:29 -0000",
  "last_updated": "Tue, 24 Sep 2024 12:13:04 -0000",
  "domain": null,
  "tags": []
 }
}
```
