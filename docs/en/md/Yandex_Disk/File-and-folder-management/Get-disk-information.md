---
sidebar_position: 1
---

# Get disk information
 Gets information about the current disk



`Function GetDiskInformation(Val Token) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
  Token = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
  Result = OPI_YandexDisk.GetDiskInformation(Token);
```



```sh title="CLI command example"
    
  oint yadisk GetDiskInformation --token "y0_AgAAAABdylaOAAs0QgAAAAD5i-a..."

```

```json title="Result"
{
 "max_file_size": 1073741824,
 "paid_max_file_size": 53687091200,
 "total_space": 5368709120,
 "reg_time": "2024-02-01T15:13:41+03:00",
 "trash_size": 0,
 "is_paid": false,
 "is_idm_managed_folder_address_access": false,
 "used_space": 825948304,
 "system_folders": {
  "odnoklassniki": "disk:/Социальные сети/Одноклассники",
  "google": "disk:/Социальные сети/Google+",
  "instagram": "disk:/Социальные сети/Instagram",
  "vkontakte": "disk:/Социальные сети/ВКонтакте",
  "attach": "disk:/Почтовые вложения",
  "mailru": "disk:/Социальные сети/Мой Мир",
  "downloads": "disk:/Загрузки/",
  "applications": "disk:/Приложения",
  "facebook": "disk:/Социальные сети/Facebook",
  "social": "disk:/Социальные сети/",
  "messenger": "disk:/Файлы Мессенджера",
  "calendar": "disk:/Материалы встреч",
  "scans": "disk:/Сканы",
  "screenshots": "disk:/Скриншоты/",
  "photostream": "disk:/Фотокамера/"
 },
 "user": {
  "reg_time": "2024-02-01T15:13:41+03:00",
  "display_name": "bayselonarrend",
  "uid": "1573541518",
  "country": "by",
  "is_child": false,
  "login": "bayselonarrend"
 },
 "is_idm_managed_public_access": false,
 "payment_flow": true,
 "unlimited_autoupload_enabled": false,
 "revision": 1728412127980782
}
```
