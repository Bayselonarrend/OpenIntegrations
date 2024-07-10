---
sidebar_position: 3
---

# Add user to file
 Defines access to the file for an external user


<br/>


`Function AddUsersToFile(Val Token, Val FileID, Val EmailAddresses, Val ViewOnly = True) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | FileID | --fileid | String | ID of the file to be accessed |
 | EmailAddresses | --emails | String, Array of String | List of email addresses of users being added |
 | ViewOnly | --readonly | Boolean | Prohibits file editing for the external user |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
 Token = "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L...";
 Email = "h5bk6ft62s@privaterelay.appleid.com";
 File = "kJU6-a-pT48AAAAAAAAABw";
 
 Result = OPI_Dropbox.AddUsersToFile(Token, File, Email, False);
```
	


```sh title="CLI command example"
 
 oint dropbox AddUsersToFile --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --fileid %fileid% --emails %emails% --readonly %readonly%

```

```json title="Result"
 [
 {
 "member": {
 ".tag": "email",
 "email": "h5bk6ft62s@privaterelay.appleid.com"
 },
 "result": {
 ".tag": "success",
 "success": {
 ".tag": "editor"
 }
 },
 "sckey_sha1": "ee2d8fd2cee052e103a52aa74be85bbebb8e6bb4",
 "invitation_signature": [
 "ee2d8fd2cee052e103a52aa74be85bbebb8e6bb4:ed7721b375882c806612d4056dad9f317cc98a22"
 ]
 }
]
```
