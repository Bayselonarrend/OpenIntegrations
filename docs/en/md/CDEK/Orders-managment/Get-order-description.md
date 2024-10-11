---
sidebar_position: 2
---

# Get order description
 Gets the layout of order for the CreateOrder function



`Function GetOrderDescription(Val Clear = False, Val RequiredOnly = False, Val OnlineStore = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Clear | --empty | Boolean | True > structure with empty valuse, False > field descriptions at values |
  | RequiredOnly | --required | Boolean | True > only required fields will be in the set |
  | OnlineStore | --ostore | Boolean | Flag of including fields in the layout exclusively for online store orders |

  
  Returns:  Structure of KeyAndValue - Fields structure

<br/>

:::tip
Required fields may depend on the type of order or nesting. Be sure to read the CDEK documentation

 Field descriptions in the documentation: [Order registration](https://api-docs.cdek.ru/29923926.html)
:::
<br/>


```bsl title="Code example"
    Result = OPI_CDEK.GetOrderDescription();
```



```sh title="CLI command example"
    
  oint cdek GetOrderDescription --empty %empty% --required %required% --ostore %ostore%

```

```json title="Result"

```
