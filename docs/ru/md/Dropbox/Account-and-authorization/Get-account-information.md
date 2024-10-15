---
sidebar_position: 4
---

# Получить информацию об аккаунте
 Получает информацию об аккаунте



`Функция ПолучитьИнформациюОбАккаунте(Знач Токен, Знач Аккаунт = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Аккаунт | --account | Строка | ID аккаунта. Текущий аккаунт токена, если не заполнено |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
    Токен = "sl.B-iqyqXWh8YCVSZnVG0BwXxLlHNbfCDJrGlOyhjKnx1cAwPeSV71gjqQ1iR0QLna032Hn-HZjE...";

    Результат = OPI_Dropbox.ПолучитьИнформациюОбАккаунте(Токен);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint dropbox ПолучитьИнформациюОбАккаунте --token "***" \
              --account "dbid:AAA4WKMCfgoW5LwuNQFeLOyp-X4omQiNDhE"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint dropbox ПолучитьИнформациюОбАккаунте ^
              --token "***" ^
              --account "dbid:AAA4WKMCfgoW5LwuNQFeLOyp-X4omQiNDhE"
        ```
    </TabItem>
</Tabs>


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
