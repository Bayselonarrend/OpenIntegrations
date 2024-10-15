---
sidebar_position: 1
---

# Check token
 Checks if the bot token is functional



`Function CheckToken(Val Token) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from VK Teams

<br/>

:::tip
Method at API documentation: [GET /self/get](https://teams.vk.com/botapi/#/self/get_self_get)
:::
<br/>


```bsl title="Code example"
    Token  = "001.3501506236.091...";
    Result = OPI_VKTeams.CheckToken(Token);
```
 



```json title="Result"
{
 "userId": "1011893356",
 "ok": true
}
```
