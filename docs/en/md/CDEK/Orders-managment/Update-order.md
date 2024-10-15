---
sidebar_position: 2
---

# Update order
 Changes the field values of the selected order



`Function UpdateOrder(Val Token, Val UUID, Val OrderDescription, Val TestAPI = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Auth token |
  | UUID | --uuid | String | Order UUID for updating |
  | OrderDescription | --order | Structure of KeyAndValue | Set of changing order fields |
  | TestAPI | --testapi | Boolean | Flag to use test API for requests |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from CDEK

<br/>

:::tip
Method at API documentation: [Change of order](https://api-docs.cdek.ru/36981178.html)
:::
<br/>


```bsl title="Code example"
    Token = "...";
    UUID  = "";

    OrderDescription = New Structure("comment", "NewComment");

    Result = OPI_CDEK.UpdateOrder(Token, UUID, OrderDescription, True);
```
 



```json title="Result"
{
 "entity": {
  "uuid": "9aedf214-562a-45a2-982c-897b753a0ebd"
 },
 "requests": [
  {
   "request_uuid": "03d76b39-93a1-4c15-b5fa-ff49129579e4",
   "type": "UPDATE",
   "date_time": "2024-10-12T19:31:15+03:00",
   "state": "ACCEPTED"
  }
 ],
 "related_entities": []
}
```
