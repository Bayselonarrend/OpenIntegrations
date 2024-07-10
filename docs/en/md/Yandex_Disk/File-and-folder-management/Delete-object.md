---
sidebar_position: 4
---

# Delete object
 Deletes an object at the specified path


<br/>


`Function DeleteObject(Val Token, Val Path, Val ToCart = True) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Path | --path | String | Path to the folder or file to be deleted |
 | ToCart | --can | Boolean | To cart |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
Token = "y0_AgAAAABdylaOAA...";
 Path = "/Alpaca.png"
 Response = OPI_YandexDisk.DeleteObject(Token, Path); //Map
 Response = OPI_Tools.JSONString(Response); //String
```
	


```sh title="CLI command example"
 
 oint yadisk DeleteObject --token "y0_AgAAAABdylaOAA..." --path "/Alpaca.png" --can %can%

```

```json title="Result"
<empty string>
```
