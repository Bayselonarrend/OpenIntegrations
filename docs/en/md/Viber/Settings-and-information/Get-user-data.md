---
sidebar_position: 3
---

# Get user data
 Gets user information by ID


<br/>


`Function GetUserData(Val Token, Val UserID) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | UserID | --user | String, Number | Viber User ID |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Viber

<br/>




```bsl title="Code example"
 
 Response = OPI_Viber.GetUserData(Token, UserID); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
```
	


```sh title="CLI command example"
 
 oint viber GetUserData --token %token% --user %user%

```

```json title="Result"
{
 "user": {
 "device_type": "iPhone8,4",
 "mnc": 1,
 "mcc": 257,
 "api_version": 10,
 "primary_device_os": "iOS 15.6.1",
 "viber_version": "21.6.0.18",
 "country": "FR",
 "language": "ru",
 "avatar": "http://dl-media.viber.com/1/share/2/long/bots/generic-avatar%402x.png",
 "name": "Subscriber",
 "id": "d3jxe6111111NkjYGgZg=="
 },
 "chat_hostname": "SN-CHAT-07_",
 "status_message": "ok",
 "status": 0
 }
```
