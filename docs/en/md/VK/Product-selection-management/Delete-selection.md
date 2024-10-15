---
sidebar_position: 7
---

# Delete selection
 Deletes the selection by ID



`Function DeleteSelection(Val Selection, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Selection | --sel | String | Selection ID |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from VK

<br/>




```bsl title="Code example"
  Parameters = GetVKParameters();
  
  Selection = "125";
  
  Result = OPI_VK.DeleteSelection(Selection, Parameters);
```
 



```json title="Result"
{
 "response": 1
}
```
