---
sidebar_position: 1
---

# Get disk information
 Gets information about the current disk




<br/>


*Function GetDiskInformation(Val Token) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Yandex


```bsl title="Code example"
 
 Token = "y0_AgAAAABdylaOAA...";
 Response = OPI_YandexDisk.GetDiskInformation(Token); //Map
 Response = OPI_Tools.JSONString(Response); //String
 
```
	


```sh title="CLI command example"
 
 oint yadisk GetDiskInformation --token "y0_AgAAAABdylaOAA..."

```

```json title="Result"
 {
 "user": {
 "login": "bayselonarrend",
 "country": "by",
 "uid": "1573541111",
 "display_name": "bayselonarrend",
 "is_child": false,
 "reg_time": "2024-02-01T22:13:41+00:00"
 },
 "revision": 1707416628219047,
 "system_folders": {
 "photostream": "disk:/Photos/",
 "screenshots": "disk:/Screenshots/",
 "scans": "disk:/Scans",
 "messenger": "disk:/Messenger files",
 "facebook": "disk:/Social networks/Facebook",
 "applications": "disk:/Apps",
 "downloads": "disk:/Downloads/",
 "mailru": "disk:/Social networks/My World",
 "attach": "disk:/Mail attachments",
 "instagram": "disk:/Social networks/Instagram",
 "calendar": "disk:/Meeting materials",
 "social": "disk:/Social networks/",
 "vkontakte": "disk:/Social networks/VKontakte",
 "google": "disk:/Social networks/Google+",
 "odnoklassniki": "disk:/Social networks/Classmates"
 },
 "unlimited_autoupload_enabled": false,
 "used_space": 73372937,
 "trash_size": 0,
 "reg_time": "2024-02-01T12:13:41+00:00",
 "total_space": 5368709120,
 "is_paid": false,
 "paid_max_file_size": 53687091200,
 "max_file_size": 1073741824
 }
```
