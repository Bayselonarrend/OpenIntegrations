---
sidebar_position: 5
---

# Get order by number
 Receives the order by CDEK number or number from customer IB



`Function GetOrderByNumber(Val Token, Val OrderNumber, Val Internal = False, Val TestAPI = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Auth token |
  | OrderNumber | --number | String | Order number |
  | Internal | --internal | Boolean | Type of order number. True > number in the customer base, False > CDEK number |
  | TestAPI | --testapi | Boolean | Flag to use test API for requests |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from CDEK

<br/>

:::tip
Method at API documentation: [Order information](https://api-docs.cdek.ru/29923975.html)
:::
<br/>


```bsl title="Code example"
    Token = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6WyJsb2NhdGlvbjphbGwiLCJvcmRlcjphbGwiLCJwYXltZW50OmFsbCJdLCJleHAiOjE3Mjg3MzkwMDYsImF1dGhvcml0aWVzIjpbInNoYXJkLWlkOnJ1LTAxIiwiY2xpZW50LWNpdHk60J3QvtCy0L7RgdC40LHQuNGA0YHQuiwg0J3QvtCy0L7RgdC40LHQuNGA0YHQutCw0Y8g0L7QsdC70LDRgdGC0YwiLCJjb250cmFjdDrQmNCcLdCg0KQt0JPQm9CTLTIyIiwiYWNjb3VudC1sYW5nOnJ1cyIsImFjY291bnQtdXVpZDplOTI1YmQwZi0wNWE2LTRjNTYtYjczNy00Yjk5YzE0ZjY2OWEiLCJhcGktdmVyc2lvbjoxLjEiLCJjbGllbnQtaWQtZWM1OmVkNzVlY2Y0LTMwZWQtNDE1My1hZmU5LWViODBiYjUxMmYyMiIsImNvbnRyYWN0LWlkOmRlNDJjYjcxLTZjOGMtNGNmNS04MjIyLWNmYjY2MDQ0ZThkZiIsImNsaWVudC1pZC1lYzQ6MTQzNDgyMzEiLCJjb250cmFnZW50L...";

    OrderNumber = "ddOererre7450813980068";
    Result      = OPI_CDEK.GetOrderByNumber(Token, OrderNumber, True, True);
```
 



```json title="Result"
{
 "entity": {
  "uuid": "9aedf214-562a-45a2-982c-897b753a0ebd",
  "type": 1,
  "is_return": false,
  "is_reverse": false,
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
   "name": "Petrov Petr",
   "passport_requirements_satisfied": false
  },
  "seller": {
   "name": "Тестирование Интеграции ИМ"
  },
  "recipient": {
   "name": "Ivaniv Ivan",
   "phones": [
    {
     "number": "+79134637228"
    }
   ],
   "passport_requirements_satisfied": false
  },
  "from_location": {
   "code": 44,
   "city_uuid": "7e8f36ba-d937-4ce4-8d53-e44177db6469",
   "city": "Москва",
   "fias_guid": "0c5b2444-70a0-4932-980c-b4dc0d3f02b5",
   "kladr_code": "7700000000000",
   "country_code": "RU",
   "country": "Россия",
   "region": "Москва",
   "region_code": 81,
   "sub_region": "Москва",
   "longitude": 37.61556,
   "latitude": 55.75222,
   "address": "Ave. Leningradsky, 4"
  },
  "to_location": {
   "code": 270,
   "city_uuid": "4e938d63-e189-454d-bb5c-54bfb2f1e4e2",
   "city": "Новосибирск",
   "kladr_code": "5400000100000",
   "country_code": "RU",
   "country": "Россия",
   "region": "Новосибирская область",
   "region_code": 23,
   "sub_region": "городской округ Новосибирск",
   "longitude": 82.906928,
   "latitude": 55.028739,
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
      "return_item_detail": {},
      "excise": false,
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
  ],
  "is_client_return": false,
  "delivery_detail": {
   "total_sum": 0,
   "payment_info": []
  },
  "calls": {}
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
