---
sidebar_position: 3
---

# Delete order
 Deletes order by UUID



`Function DeleteOrder(Val Token, Val UUID, Val TestAPI = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Auth token |
  | UUID | --uuid | String | Order UUID for deletion |
  | TestAPI | --testapi | Boolean | Flag to use test API for requests |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from CDEK

<br/>

:::tip
Method at API documentation: [Deleting an order](https://api-docs.cdek.ru/29924487.html)
:::
<br/>


```bsl title="Code example"
    Token = "...";
    UUID  = "";

    Result = OPI_CDEK.DeleteOrder(Token, UUID, True);
```
 



```json title="Result"
{
 "entity": {
  "uuid": "9aedf214-562a-45a2-982c-897b753a0ebd"
 },
 "requests": [
  {
   "request_uuid": "0112f5e9-36db-4146-ac65-ae0f6e67b488",
   "type": "DELETE",
   "date_time": "2024-10-12T19:31:15+03:00",
   "state": "ACCEPTED"
  }
 ],
 "related_entities": []
}
```
