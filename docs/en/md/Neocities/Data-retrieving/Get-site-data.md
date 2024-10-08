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
  "views": 9064,
  "hits": 17050,
  "created_at": "Thu, 20 Jun 2024 07:28:29 -0000",
  "last_updated": "Mon, 07 Oct 2024 19:32:51 -0000",
  "domain": null,
  "tags": []
 }
}
```
