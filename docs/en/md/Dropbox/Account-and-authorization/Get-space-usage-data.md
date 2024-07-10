---
sidebar_position: 5
---

# Get space usage data
 Gets information on the amount of used disk space


<br/>


`Function GetSpaceUsageData(Val Token) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
 Token = "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L...";
 
 Result = OPI_Dropbox.GetSpaceUsageData(Token);
```
	


```sh title="CLI command example"
 
 oint dropbox GetSpaceUsageData --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..."

```

```json title="Result"
{
 "used": 1477493597,
 "allocation": {
 ".tag": "individual",
 "allocated": 2147483648
 }
}
```
