---
sidebar_position: 7
---

# Create refusal
 Creates an order refusal to return to the online store



`Function CreateRefusal(Val Token, Val UUID, Val TestAPI = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Auth token |
  | UUID | --uuid | String | Order UUID |
  | TestAPI | --testapi | Boolean | Flag to use test API for requests |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from CDEK

<br/>

:::tip
Method at API documentation: [Registration of refusal](https://api-docs.cdek.ru/55327658.html)
:::
<br/>


```bsl title="Code example"
    Token = "...";
    UUID  = "";

    Result = OPI_CDEK.CreateRefusal(Token, UUID, True);
```
 



```json title="Result"
{
 "entity": {
  "uuid": "9aedf214-562a-45a2-982c-897b753a0ebd"
 },
 "requests": [
  {
   "request_uuid": "048cf376-c616-405b-9676-1f66f3106ce0",
   "type": "CREATE_REFUSAL",
   "date_time": "2024-10-12T19:31:15+03:00",
   "state": "ACCEPTED"
  }
 ],
 "related_entities": []
}
```
