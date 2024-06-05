---
sidebar_position: 4
---

# Add users to folder
 Grants external users access to the directory


*Function AddUsersToFolder(Val Token, Val FolderID, Val EmailAddresses, Val ViewOnly = True) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | FolderID | --folder | String | ID of the public catalog (shared folder ID) |
 | EmailAddresses | --emails | String, Array of String | List of email addresses of users being added |
 | ViewOnly | --readonly | Boolean | Prohibits file editing for the external user |

 
 Returns: Undefined - empty response

```bsl title="Code example"
	
 Token = "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L...";
 Email = "h5bk6ft62s@privaterelay.appleid.com";
 Folder = "5022319569"; // shared_folder_id
 
 Result = OPI_Dropbox.AddUsersToFolder(Token, Folder, Email, False);
 
	
```

```sh title="CLI command example"
 
 oint dropbox AddUsersToFolder --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --folder %folder% --emails %emails% --readonly %readonly%


```


```json title="Result"



```
