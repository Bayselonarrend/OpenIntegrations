﻿---
sidebar_position: 4
---

# Get account information
 Gets account information



`Function GetAccountInformation(Val Token, Val Account = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Account | --account | String | Account ID. Current token account if not filled |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
    Token = "sl.B9sYGdZdLILSnqlGZCwLFCstq1B1GsgevbBkwi4UK_UlNyhGAoJ1fKoXMy3dQhkEb3e80HTL6g...";

    Result = OPI_Dropbox.GetAccountInformation(Token);
```



```sh title="CLI command example"
    
  oint dropbox GetAccountInformation --token "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ..." --account %account%

```

```json title="Result"
{
 "account_id": "dbid:AAA4WKMCfgoW5LwuNQFeLOyp-X4omQiNDhE",
 "name": {
  "given_name": "Антон",
  "surname": "Титовец",
  "familiar_name": "Антон",
  "display_name": "Антон Титовец",
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
