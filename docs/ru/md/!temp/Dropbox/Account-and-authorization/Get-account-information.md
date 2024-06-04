---
sidebar_position: 4
---

# Получить информацию об аккаунте
 Получает информацию об аккаунте


*Функция ПолучитьИнформациюОбАккаунте(Знач Токен, Знач Аккаунт = "") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Аккаунт | --account | Строка | ID аккаунта. Текущий аккаунт токена, если не заполнено |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

```bsl title="Пример кода"
	
    Токен = "sl.B2PZ-Sk7vWqtAfWKI0CKnYNapuN4bH-a4_tTsbN02eoxT1dlQ9Vs_vcf30ZAAl9h-m3xg5uz5c...";
    
    Результат = OPI_Dropbox.ПолучитьИнформациюОбАккаунте(Токен);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox ПолучитьИнформациюОбАккаунте --token "sl.B2PZ-Sk7vWqtAfWKI0CKnYNapuN4bH-a4_tTsbN02eoxT1dlQ9Vs_vcf30ZAAl9h-m3xg5uz5c..." --account %account%

```


```json title="Результат"

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
