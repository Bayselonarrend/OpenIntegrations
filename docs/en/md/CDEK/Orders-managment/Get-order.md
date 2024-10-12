---
sidebar_position: 4
---

# Get order
 Gets the order by UUID



`Function GetOrder(Val Token, Val UUID, Val TestAPI = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Auth token |
  | UUID | --uuid | String | Order UUID |
  | TestAPI | --testapi | Boolean | Flag to use test API for requests |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from CDEK

<br/>

:::tip
Method at API documentation: [Order information](https://api-docs.cdek.ru/29923975.html)
:::
<br/>


```bsl title="Code example"
    Token = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6WyJsb2NhdGlvbjphbGwiLCJvcmRlcjphbGwiLCJwYXltZW50OmFsbCJdLCJleHAiOjE3Mjg3MzkwMDYsImF1dGhvcml0aWVzIjpbInNoYXJkLWlkOnJ1LTAxIiwiY2xpZW50LWNpdHk60J3QvtCy0L7RgdC40LHQuNGA0YHQuiwg0J3QvtCy0L7RgdC40LHQuNGA0YHQutCw0Y8g0L7QsdC70LDRgdGC0YwiLCJjb250cmFjdDrQmNCcLdCg0KQt0JPQm9CTLTIyIiwiYWNjb3VudC1sYW5nOnJ1cyIsImFjY291bnQtdXVpZDplOTI1YmQwZi0wNWE2LTRjNTYtYjczNy00Yjk5YzE0ZjY2OWEiLCJhcGktdmVyc2lvbjoxLjEiLCJjbGllbnQtaWQtZWM1OmVkNzVlY2Y0LTMwZWQtNDE1My1hZmU5LWViODBiYjUxMmYyMiIsImNvbnRyYWN0LWlkOmRlNDJjYjcxLTZjOGMtNGNmNS04MjIyLWNmYjY2MDQ0ZThkZiIsImNsaWVudC1pZC1lYzQ6MTQzNDgyMzEiLCJjb250cmFnZW50L...";
    UUID  = "48763bae-2d8e-4521-9052-01377017fbe7";

    Result = OPI_CDEK.GetOrder(Token, UUID, True);
```



```sh title="CLI command example"
    
  oint cdek GetOrder --token "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6WyJsb2NhdGlvbjphbGwiLCJvcmRlcjphbGwiLCJwYXltZW50OmFsbCJdLCJleHAiOjE3Mjg2ODEyNjEsImF1dGhvcml0aWVzIjpbInNoYXJkLWlkOnJ1LTAxIiwiY2xpZW50LWNpdHk60J3QvtCy0L7RgdC40LHQuNGA0YHQuiwg0J3QvtCy0L7RgdC40LHQuNGA0YHQutCw0Y8g0L7QsdC70LDRgdGC0YwiLCJhY2NvdW50LWxhbmc6cnVzIiwiY29udHJhY3Q60JjQnC3QoNCkLdCT0JvQky0yMiIsImFwaS12ZXJzaW9uOjEuMSIsImFjY291bnQtdXVpZDplOTI1YmQwZi0wNWE2LTRjNTYtYjczNy00Yjk5YzE0ZjY2OWEiLCJjbGllbnQtaWQtZWM1OmVkNzVlY2Y0LTMwZWQtNDE1My1hZmU5LWViODBiYjUxMmYyMiIsImNvbnRyYWN0LWlkOmRlNDJjYjcxLTZjOGMtNGNmNS04MjIyLWNmYjY2MDQ0ZThkZiIsImNsaWVudC1pZC1lYzQ6MTQzNDgyMzEiLCJzb2xpZC1hZGRyZ..." --uuid "f1799065-01de-448c-91cf-8afe7d4c0cfc" --testapi %testapi%

```

```json title="Result"
{
 "entity": {
  "uuid": "9aedf214-562a-45a2-982c-897b753a0ebd",
  "type": 1,
  "number": "ddOererre7450813980068",
  "tariff_code": 139,
  "comment": "New order",
  "delivery_recipient_cost": {
   "value": 50
  },
  "delivery_recipient_cost_adv": [
   {
    "threshold": 200,
    "sum": 3000
   }
  ],
  "sender": {
   "name": "Petrov Petr"
  },
  "recipient": {
   "name": "Ivaniv Ivan",
   "phones": [
    {
     "number": "+79134637228"
    }
   ]
  },
  "from_location": {
   "code": 44,
   "city": "Moscow",
   "address": "Ave. Leningradsky, 4"
  },
  "to_location": {
   "code": 270,
   "city": "Novosibirsk",
   "address": "st. Bluchera, 32"
  },
  "services": [
   {
    "code": "SECURE_PACKAGE_A2",
    "parameter": "10"
   }
  ],
  "packages": [
   {
    "number": "bar-001",
    "weight": 4000,
    "length": 10,
    "width": 10,
    "height": 10,
    "comment": "Packaging",
    "items": [
     {
      "name": "Product",
      "ware_key": "00055",
      "payment": {
       "value": 3000
      },
      "weight": 700,
      "amount": 2,
      "url": "www.item.ru",
      "cost": 300
     }
    ]
   }
  ],
  "statuses": [
   {
    "code": "ACCEPTED",
    "name": "Принят",
    "date_time": "2024-10-12T19:31:14+03:00",
    "city": "Офис СДЭК"
   }
  ]
 },
 "requests": [
  {
   "request_uuid": "825e8d4d-e04d-404e-939b-e119ba58707a",
   "type": "CREATE",
   "date_time": "2024-10-12T19:31:14+03:00",
   "state": "ACCEPTED"
  }
 ],
 "related_entities": []
}
```
