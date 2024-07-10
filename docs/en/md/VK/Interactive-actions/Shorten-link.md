---
sidebar_position: 5
---

# Shorten link
 Creates a shortened URL from a regular one



`Function ShortenLink(Val URL, Val Parameters = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL for shortening |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: String - Shortened URL 

<br/>




```bsl title="Code example"
 
 Response = OPI_VK.ShortenLink("https://github.com/Bayselonarrend/OpenIntegrations", Parameters);
```
	


```sh title="CLI command example"
 
 oint vk ShortenLink --url %url% --auth %auth%

```

```json title="Result"
https://vk.cc/ctL1sM
```
