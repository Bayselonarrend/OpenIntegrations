---
sidebar_position: 4
---

# Get account information
 Gets account information


*Function GetAccountInformation(Val Token, Val Account = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Account | --account | String | Account ID. Current token account if not filled |

 
 Returns: Key-Value Pair - serialized JSON response from Dropbox

```bsl title="Code example"
	
 Token = "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L...";
 
 Result = OPI_Dropbox.GetAccountInformation(Token);

	
```

```sh title="CLI command example"
 
 oint dropbox GetAccountInformation --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --account %account%


```


```json title="Result"

{
 "account_id": "dbid:AAA4WKMCfgoW5LwuNQFeLOyp-X4omQiNDhE",
 "name": {
 "given_name": "Anton",
 "surname": "Titovets",
 "familiar_name": "Anton",
 "display_name": "Anton Titovets",
 "abbreviated_name": "АТ"
 },
 "email": "bayselonarrend@gmail.com",
 "email_verified": true,
 "disabled": false,
 "country": "BY",
 "locale": "en",
 "referral_link": "https://www.dropbox.com/referrals/AADQceVD6l02CM1dzgLM7s_o8gdaPXKc7oM?src=app9-2724483",
 "is_paired": false,
 "account_type": {
 ".tag": "basic"
 },
 "root_info": {
 ".tag": "user",
 "root_namespace_id": "3179550035",
 "home_namespace_id": "3179550035"
 }
}

```
