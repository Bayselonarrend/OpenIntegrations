---
sidebar_position: 1
---

# Get token
 Gets a token based on account ID and password



`Function GetToken(Val Account, Val Password, TestAPI = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Account | --account | String | Client identifier (Account) |
  | Password | --pass | String | Secret key (Password) |
  | TestAPI | --testapi | Boolean | Flag to use test API for requests |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from CDEK

<br/>

:::tip
Method at API documentation: [Client authorization](https://api-docs.cdek.ru/29923918.html)
:::
<br/>


```bsl title="Code example"
    Account  = "wqGwiQx0gg8mLtiEKsUinjVSICCjtTEP";
    Password = "RmAmgvSgSl...";

    Result = OPI_CDEK.GetToken(Account, Password, True);
```



```sh title="CLI command example"
    
  oint cdek GetToken --account "wqGwiQx0gg8mLtiEKsUinjVSICCjtTEP" --pass "RmAmgvSgSl..." --testapi %testapi%

```

```json title="Result"

```
