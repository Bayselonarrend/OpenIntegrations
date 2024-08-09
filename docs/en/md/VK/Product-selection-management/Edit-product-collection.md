---
sidebar_position: 4
---

# Edit product selection
 Edits the properties of a product selection



`Function EditProductCollection(Val Name, Val Selection, Val Image = "", Val Main = False, Val Hidden = False, Val Parameters = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Name | --title | String | New selection name |
 | Selection | --sel | String | Selection ID |
 | Image | --picture | String, BinaryData | New selection image |
 | Main | --main | Boolean | Main |
 | Hidden | --hidden | Boolean | Hidden |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
 Parameters = GetVKParameters();
 
 Name = "EditedCollection";
 Selection = "125";
 
 Result = OPI_VK.EditProductCollection(Name, Selection,,,, Parameters);
 
 Check_VKTrue(Result);
 
 OPI_Tools.Pause(5);
```
	


```sh title="CLI command example"
 
 oint vk EditProductCollection --title %title% --sel %sel% --picture %picture% --main %main% --hidden %hidden% --auth %auth%

```

```json title="Result"
{
 "response": 1
 }
```
