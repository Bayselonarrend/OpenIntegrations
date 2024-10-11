---
sidebar_position: 6
---

# Create customer refund
 Processes customer returns for online store orders



`Function CreateCustomerRefund(Val Token, Val UUID, Val Tariff, Val TestAPI = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Auth token |
  | UUID | --uuid | String | Order UUID |
  | Tariff | --tariff | Number | Tariff code (from those available under the contract) |
  | TestAPI | --testapi | Boolean | Flag to use test API for requests |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from CDEK

<br/>

:::tip
This method is used if the direct order was delivered by CDEK and the recipient wants to return it in full

 If the order was delivered by another service, or you need to return not all items, you must use the CreateOrder method with is_client_return = true

 Method at API documentation: [Customer returns](https://api-docs.cdek.ru/122762174.html)
:::
<br/>


```bsl title="Code example"
    Token  = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6WyJsb2NhdGlvbjphbGwiLCJvcmRlcjphbGwiLCJwYXltZW50OmFsbCJdLCJleHAiOjE3Mjg2ODEyNjEsImF1dGhvcml0aWVzIjpbInNoYXJkLWlkOnJ1LTAxIiwiY2xpZW50LWNpdHk60J3QvtCy0L7RgdC40LHQuNGA0YHQuiwg0J3QvtCy0L7RgdC40LHQuNGA0YHQutCw0Y8g0L7QsdC70LDRgdGC0YwiLCJhY2NvdW50LWxhbmc6cnVzIiwiY29udHJhY3Q60JjQnC3QoNCkLdCT0JvQky0yMiIsImFwaS12ZXJzaW9uOjEuMSIsImFjY291bnQtdXVpZDplOTI1YmQwZi0wNWE2LTRjNTYtYjczNy00Yjk5YzE0ZjY2OWEiLCJjbGllbnQtaWQtZWM1OmVkNzVlY2Y0LTMwZWQtNDE1My1hZmU5LWViODBiYjUxMmYyMiIsImNvbnRyYWN0LWlkOmRlNDJjYjcxLTZjOGMtNGNmNS04MjIyLWNmYjY2MDQ0ZThkZiIsImNsaWVudC1pZC1lYzQ6MTQzNDgyMzEiLCJzb2xpZC1hZGRyZ...";
    UUID   = "f1799065-01de-448c-91cf-8afe7d4c0cfc";
    Tariff = 139;

    Result = OPI_CDEK.CreateCustomerRefund(Token, UUID, Tariff, True);
```



```sh title="CLI command example"
    
oint cdek CreateCustomerRefund --token "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6WyJsb2NhdGlvbjphbGwiLCJvcmRlcjphbGwiLCJwYXltZW50OmFsbCJdLCJleHAiOjE3Mjg2ODEyNjEsImF1dGhvcml0aWVzIjpbInNoYXJkLWlkOnJ1LTAxIiwiY2xpZW50LWNpdHk60J3QvtCy0L7RgdC40LHQuNGA0YHQuiwg0J3QvtCy0L7RgdC40LHQuNGA0YHQutCw0Y8g0L7QsdC70LDRgdGC0YwiLCJhY2NvdW50LWxhbmc6cnVzIiwiY29udHJhY3Q60JjQnC3QoNCkLdCT0JvQky0yMiIsImFwaS12ZXJzaW9uOjEuMSIsImFjY291bnQtdXVpZDplOTI1YmQwZi0wNWE2LTRjNTYtYjczNy00Yjk5YzE0ZjY2OWEiLCJjbGllbnQtaWQtZWM1OmVkNzVlY2Y0LTMwZWQtNDE1My1hZmU5LWViODBiYjUxMmYyMiIsImNvbnRyYWN0LWlkOmRlNDJjYjcxLTZjOGMtNGNmNS04MjIyLWNmYjY2MDQ0ZThkZiIsImNsaWVudC1pZC1lYzQ6MTQzNDgyMzEiLCJzb2xpZC1hZGRyZ..." --uuid "f1799065-01de-448c-91cf-8afe7d4c0cfc" --tariff %tariff% --testapi %testapi%

```

```json title="Result"

```
