---
sidebar_position: 1
---

# Create order
 Creates an order based on field descriptions



`Function CreateOrder(Val Token, Val OrderDescription, Val OnlineStore = False, TestAPI = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Auth token |
  | OrderDescription | --order | Structure of KeyAndValue | Set of order fields. See GetOrderDescription |
  | OnlineStore | --ostore | Boolean | Flag of Online store order type |
  | TestAPI | --testapi | Boolean | Flag to use test API for requests |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from CDEK

<br/>

:::tip
Method at API documentation: [Order registration](https://api-docs.cdek.ru/29923926.html)
:::
<br/>


```bsl title="Code example"

```



```sh title="CLI command example"
    
  oint cdek CreateOrder --token %token% --order %order% --ostore %ostore% --testapi %testapi%

```

```json title="Result"

```
