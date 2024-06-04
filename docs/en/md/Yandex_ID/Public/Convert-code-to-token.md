---
sidebar_position: 2
---

# Convert code to token
 Converts the code to a token after entering the code when executing GetConfirmationCode


*Function ConvertCodeToToken(Val ClientId, Val ClientSecret, Val DeviceCode) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | ClientId | --id | String | Client id |
 | ClientSecret | --secret | String | Client secret |
 | DeviceCode | --device | String | device_code from GetConfirmationCode() |

 
 Returns: Key-Value Pair - serialized JSON response from Yandex

```bsl title="Code example"
	

	
```

```sh title="CLI command example"
 
 oint yandex ConvertCodeToToken --id %id% --secret %secret% --device %device%

```


```json title="Result"



```
