---
sidebar_position: 24
---

# Delete tasks dependencies
 Removes the dependency of one task to another




<br/>


*Function DeleteTasksDependencies(Val URL, Val FromID, Val DestinationID, Val LinkType, Val Token = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | FromID | --taskfrom | String, Number | From task ID |
 | DestinationID | --taskto | String, Number | To task ID |
 | LinkType | --linktype | String, Number | Link type: 0 start>start, 1 start>finish, 2 finish>start, 3 finish>finish |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API


	


```sh title="CLI command example"
 
 oint bitrix24 DeleteTasksDependencies --url %url% --taskfrom %taskfrom% --taskto %taskto% --linktype %linktype% --token %token%

```


