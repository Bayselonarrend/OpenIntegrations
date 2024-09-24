---
sidebar_position: 2
---

# Get token
 Receives authorization token by login and password



`Function GetToken(Val Login, Val Password) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Login | --login | String | Users login |
  | Password | --password | String | Users password |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Neocities

<br/>

:::tip
Neocities API docs: [neocities.org/api](https://neocities.org/api)
:::
<br/>


```bsl title="Code example"
    Login    = "2athenaeum";
    Password = "Rit...";

    Result = OPI_Neocities.GetToken(Login, Password);
```



```sh title="CLI command example"
    
oint neocities GetToken --login "2athenaeum" --password "Rit..."

```

```json title="Result"

```
