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
    Token  = "...";
    UUID   = "";
    Tariff = 139;

    Result = OPI_CDEK.CreateCustomerRefund(Token, UUID, Tariff, True);
```
 



```json title="Result"
{
 "entity": {
  "uuid": "9aedf214-562a-45a2-982c-897b753a0ebd"
 },
 "requests": [
  {
   "request_uuid": "12ae6a3a-b014-41df-a496-ae58ff5eccfe",
   "type": "CREATE_CLIENT_RETURN",
   "date_time": "2024-10-12T19:31:15+03:00",
   "state": "ACCEPTED"
  }
 ],
 "related_entities": []
}
```
